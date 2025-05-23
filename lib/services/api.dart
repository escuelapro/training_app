import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/word.dart';
import 'dart:js_interop';

@JS('window.Telegram.WebApp.initDataUnsafe.user.id')
external int? get telegramUserId;

String getTelegramUserId() {
  final telegramId = telegramUserId?.toString() ?? '';
  return telegramId;
}

String? userDocId;

class FetchResult {
  final List<Word> words;
  final bool userFound;

  FetchResult({required this.words, required this.userFound});
}

Future<FetchResult> fetchWords(String telegramId) async {
  try {
    final studentsQuery =
        await FirebaseFirestore.instance
            .collection('students')
            .where('notifications.cid', isEqualTo: telegramId)
            .get();

    if (studentsQuery.docs.isNotEmpty) {
      userDocId = studentsQuery.docs.first.id;

      final wordsSnapshot =
          await FirebaseFirestore.instance
              .collection('students')
              .doc(userDocId)
              .collection('words')
              .get();

      final words =
          wordsSnapshot.docs
              .map(
                (doc) => Word(
                  id: doc.id,
                  text: doc.data()['learnword'] as String? ?? '',
                  progress: doc.data()['progress'] as int? ?? 0,
                ),
              )
              .toList();

      return FetchResult(words: words, userFound: true);
    } else {
      print('User with this Telegram ID not found.');
    }
  } catch (e) {
    print('Error loading words: $e');
  }

  return FetchResult(words: [], userFound: false);
}

Future<void> incrementProgress(String wordId) async {
  if (userDocId == null) {
    print('userDocId ещё не загружен');
    return;
  }

  try {
    await FirebaseFirestore.instance
        .collection('students')
        .doc(userDocId)
        .collection('words')
        .doc(wordId)
        .update({'progress': FieldValue.increment(1)});
    print('✅ Progress increased');
  } catch (e) {
    print('❌ Failed to update progress: $e');
  }
}
