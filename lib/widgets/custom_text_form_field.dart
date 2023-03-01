// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? obsecureText;
  final String? hintText;
  final String? Function(String? data)? validateFunction;
  final void Function(String data)? onChangeFunction;
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.validateFunction,
    this.onChangeFunction,
    this.obsecureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ?? false,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      validator: validateFunction,
      onChanged: onChangeFunction,
    );
  }
}
