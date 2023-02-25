import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String Id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        children: [
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            'assets/images/scholar.png',
            height: 80,
          ),
          Text(
            'Scholar Chat',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'Register',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'Email',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'Password',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Register',
            ontap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'already have an account?  ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFFd3f3f3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
