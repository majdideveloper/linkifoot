import 'package:flutter/material.dart';
import 'package:linkifoot/core/widgets/custom_text_field.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordTextField({super.key, required this.controller});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Confirm password',
      prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      obscureText: _obscureText,
      validator: (value) => value == null || value.isEmpty
          ? 'Please confirm your password'
          : null,
    );
  }
}
