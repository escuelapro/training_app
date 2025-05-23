import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:training_app/redux/state.dart';
import 'package:training_app/services/api.dart';
import 'package:training_app/ui/no_user_screen.dart';
import 'ui/training_screen.dart';
import 'redux/reducers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "",
      appId: "",
      messagingSenderId: "",
      projectId: "",
      storageBucket: "",
    ),
  );

  final telegramId = getTelegramUserId();
  print('telegramId $telegramId');
  final result = await fetchWords(telegramId);

  final store = Store<AppState>(
    appReducer,
    initialState: AppState(words: result.words, currentIndex: 0, knownCount: 0),
  );

  runApp(MyApp(store: store, showTrainingScreen: result.userFound));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final bool showTrainingScreen;

  const MyApp({
    super.key,
    required this.store,
    required this.showTrainingScreen,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Telegram Mini App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: showTrainingScreen ? TrainingScreen() : NoUserScreen(),
      ),
    );
  }
}
