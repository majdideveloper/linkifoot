import 'package:flutter/material.dart';

class SecondryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;

  const SecondryButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: color),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: color,
            )),
      ),
    );
  }
}
