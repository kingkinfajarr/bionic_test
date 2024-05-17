import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final bool? enabled;
  final bool? obsecureText;

  const CustomTextField({
    super.key,
    this.textEditingController,
    this.label,
    this.enabled,
    this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      obscureText: obsecureText ?? false,
      controller: textEditingController,
      decoration: InputDecoration(
        label: (label ?? '').isNotEmpty
            ? Text(
                label ?? '',
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            : null,
        filled: true,
        focusColor: Colors.purple,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.purple,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
