import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String? hintText;
  const CustomTextField({this.hintText,Key? key}):super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.white,
        ),
        
        enabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),

        border:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
