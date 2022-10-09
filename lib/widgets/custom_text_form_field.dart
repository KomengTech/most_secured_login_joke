import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.isPassword = false,
    this.obscurePassword = true,
    this.obscureIcon,
  }) : super(key: key);

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final bool obscurePassword;
  final IconButton? obscureIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              textScaleFactor: 1.2,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            obscureText: isPassword ? obscurePassword : false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            showCursor: true,
            cursorColor: Colors.grey,
            cursorHeight: 22,
            cursorWidth: 1,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: isPassword ? obscureIcon : null,
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(30.0)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ),
        ],
      ),
    );
  }
}
