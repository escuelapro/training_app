import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:training_app/colors/app_colors.dart';
import 'package:web/web.dart' as web;

class NoUserScreen extends StatelessWidget {
  const NoUserScreen({super.key});

  void openLink(String url) {
    web.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: AppColors.violet),
              children: [
                const TextSpan(text: 'Подключите бота из вашего '),
                TextSpan(
                  text: 'личного кабинета',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap =
                            () => openLink('https://escuela-clase.web.app'),
                ),
                const TextSpan(
                  text:
                      ' к телеграмму,\nтогда вы сможете проходить тренировку с вашими словами.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
