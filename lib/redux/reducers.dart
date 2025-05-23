import 'package:training_app/models/word.dart';
import 'state.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoadWordsAction) {
    return AppState(words: action.words, currentIndex: 0, knownCount: 0);
  } else if (action is NextWordAction) {
    final nextIndex = state.currentIndex + 1;
    return state.copyWith(currentIndex: nextIndex);
  } else if (action is KnowWordAction) {
    final nextIndex = state.currentIndex + 1;
    final newKnownCount = state.knownCount + 1;

    final updatedWords = List<Word>.from(state.words);

    final currentWord = updatedWords[state.currentIndex];
    if (currentWord.progress < 4) {
      final updatedWord = Word(
        id: currentWord.id,
        text: currentWord.text,
        progress: currentWord.progress + 1,
      );
      updatedWords[state.currentIndex] = updatedWord;
    }

    return state.copyWith(
      currentIndex: nextIndex,
      knownCount: newKnownCount,
      words: updatedWords,
    );
  } else if (action is UpdateCurrentIndexAction) {
    return state.copyWith(currentIndex: action.newIndex);
  } else if (action is RestartAction) {
    return AppState(words: state.words, currentIndex: 0, knownCount: 0);
  }

  return state;
}
