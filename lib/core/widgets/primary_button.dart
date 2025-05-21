import 'package:flutter/material.dart';
import 'package:linkifoot/core/theme/theme_app.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const PrimaryButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeApp.primaryColor,
          foregroundColor: ThemeApp.surfaceColor,
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusButton,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
