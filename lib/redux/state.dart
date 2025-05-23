import '../models/word.dart';

class AppState {
  final List<Word> words;
  final int currentIndex;
  final int knownCount;

  AppState({
    required this.words,
    required this.currentIndex,
    required this.knownCount,
  });

  AppState.initial() : words = [], currentIndex = 0, knownCount = 0;

  AppState copyWith({List<Word>? words, int? currentIndex, int? knownCount}) {
    return AppState(
      words: words ?? this.words,
      currentIndex: currentIndex ?? this.currentIndex,
      knownCount: knownCount ?? this.knownCount,
    );
  }
}
