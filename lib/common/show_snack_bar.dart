import 'package:flutter/material.dart';

class ShowSnackBar {
  static snackBarFunction(context, {required String text, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: color ?? Colors.black,
      ),
    );
  }
}
