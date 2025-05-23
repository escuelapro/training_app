import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redux/redux.dart';
import 'package:training_app/colors/app_colors.dart';
import 'package:training_app/services/api.dart';
import 'package:training_app/widgets/buttons.dart';
import '../redux/state.dart';
import '../models/word.dart';
import '../redux/actions.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, viewModel) {
        final progress = viewModel.currentIndex / viewModel.words.length;

        return Scaffold(
          backgroundColor: AppColors.lexiMessageBackground,
          appBar: AppBar(
            backgroundColor: AppColors.lexiMessageBackground,
            elevation: 0,
            toolbarHeight: 55.78,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15.78),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/hourglass.svg',
                      color: AppColors.violet,
                      height: 20,
                      width: 20,
                    ),
                  ),

                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 15.78,
                        backgroundColor: AppColors.grayDF,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.violet,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.close, color: AppColors.grayText),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Builder(
                  builder: (context) {
                    final words = viewModel.words;
                    final currentIndex = viewModel.currentIndex;

                    final hasMoreWords = currentIndex < words.length;

                    if (hasMoreWords) {
                      final currentWord = words[currentIndex];

                      return Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                currentWord.text,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.violet,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppButton(
                                  text: "I remember",
                                  onPressed: () async {
                                    if (currentWord.progress < 4) {
                                      await incrementProgress(currentWord.id);
                                    }

                                    viewModel.onKnowWord();
                                  },
                                  color: AppColors.violet,
                                ),
                                const SizedBox(height: 12),
                                AppButton(
                                  text: "I don't",
                                  onPressed: viewModel.onNextWord,
                                  color: AppColors.violet,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      final knownCount = viewModel.knownCount;
                      final totalCount = words.length;
                      final notKnownCount = totalCount - knownCount;

                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Finished!',
                              style: TextStyle(
                                fontSize: 28,
                                color: AppColors.violet,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Known words: $knownCount',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.violet,
                              ),
                            ),
                            Text(
                              'Unknown words: $notKnownCount',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.violet,
                              ),
                            ),
                            const SizedBox(height: 24),
                            AppButton(
                              text: "Restart",
                              onPressed: viewModel.onRestart,
                              color: AppColors.violet,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Word> words;
  final int currentIndex;
  final int knownCount;
  final VoidCallback onNextWord;
  final VoidCallback onKnowWord;
  final VoidCallback onRestart;
  _ViewModel({
    required this.words,
    required this.currentIndex,
    required this.knownCount,
    required this.onNextWord,
    required this.onKnowWord,
    required this.onRestart,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      words: store.state.words,
      currentIndex: store.state.currentIndex,
      knownCount: store.state.knownCount,
      onNextWord: () => store.dispatch(NextWordAction()),
      onKnowWord: () => store.dispatch(KnowWordAction()),
      onRestart: () => store.dispatch(RestartAction()),
    );
  }
}
