import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/screens/register_screen.dart';

import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
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
          const Text(
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
          const Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            hintText: 'Email',
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            hintText: 'Password',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Login',
            ontap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'don\'t have an account?  ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                child: const Text(
                  'Register',
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
