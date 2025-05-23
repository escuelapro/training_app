import 'package:flutter/material.dart';
import 'package:training_app/colors/app_colors.dart';

class NoUserScreen extends StatelessWidget {
  const NoUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Подключите бота из вашего личного кабинета к телеграмму,\n'
          'тогда вы сможете проходить тренировку с вашими словами.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: AppColors.violet),
        ),
      ),
    );
  }
}
