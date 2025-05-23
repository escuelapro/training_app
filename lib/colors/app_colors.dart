import 'package:flutter/material.dart';

class AppColors {
  // Основные цвета
  static const Color violet = Color(0xFF8679EC);
  static const Color green = Color(0xFF34C759);
  static const Color blueMessage = Color(0xFF3196FA);
  static const Color mistakeColor = Color(0xFFFF8F07);
  static const Color lexiMessageBackground = Color(0xFFEFEFEF);
  static const Color backgroundWhite = Color(0xFFF8F8F9);
  static const Color starColor = Color(0xFFFFBB00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grayDF = Color(0xFFDFDFDF);

  static const Color grayText = Color(0xFF323232);
  static const Color grayText2 = Color(0xFF606060);
  static const Color grayText3 = Color(0xFF9B9B9B);
  static const Color grayText80 = Color(0xCC323232);
  static const Color whiteText80 = Color(0xCCFFFFFF);

  static const Color blueMessage20 = Color(0x333196FA);

  static const Gradient newGradient = LinearGradient(
    colors: [Color(0xFF8679EC), Color(0xFF66B5ED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient gradient3 = LinearGradient(
    colors: [Color(0xFF8E60DB), Color(0xFF8CC2E8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
