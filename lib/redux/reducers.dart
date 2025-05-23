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
    final newknownCount = state.knownCount + 1;
    return state.copyWith(currentIndex: nextIndex, knownCount: newknownCount);
  } else if (action is UpdateCurrentIndexAction) {
    return state.copyWith(currentIndex: action.newIndex);
  } else if (action is RestartAction) {
    return AppState(words: state.words, currentIndex: 0, knownCount: 0);
  }

  return state;
}
