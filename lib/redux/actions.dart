import '../models/word.dart';

class LoadWordsAction {
  final List<Word> words;
  LoadWordsAction(this.words);
}

class NextWordAction {}

class KnowWordAction {}

class UpdateCurrentIndexAction {
  final int newIndex;

  UpdateCurrentIndexAction(this.newIndex);
}

class RestartAction {}
