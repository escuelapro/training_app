import 'package:flutter/material.dart';
import 'package:training_app/colors/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.violet,
    this.borderRadius = 15.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: AppColors.white),
        ),
      ),
    );
  }
}
