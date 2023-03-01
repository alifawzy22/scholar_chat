import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/common/show_snack_bar.dart';
import 'package:scholar_chat/common/validate_email.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/screens/chat_page.dart';
import 'package:scholar_chat/screens/register_screen.dart';

import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? userName;
  String? password;
  bool isModalloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ModalProgressHUD(
        inAsyncCall: isModalloading,
        child: Form(
          key: formKey,
          child: ListView(
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
              CustomTextFormField(
                onChangeFunction: (data) {
                  setState(() {
                    userName = data;
                  });
                },
                validateFunction: validateEmail,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onChangeFunction: (data) {
                  setState(() {
                    password = data;
                  });
                },
                validateFunction: (data) {
                  if (data == null || data.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Login',
                ontap: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isModalloading = true;
                    });
                    try {
                      await signInWithEmailAndPassword();

                      Navigator.pushNamed(context, ChatPage.id,
                          arguments: userName);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ShowSnackBar.snackBarFunction(context,
                            text: 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        ShowSnackBar.snackBarFunction(context,
                            text: 'Wrong password provided for that user.');
                      }
                      setState(() {
                        isModalloading = false;
                      });
                    }
                    setState(() {
                      isModalloading = false;
                    });
                  }
                },
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
        ),
      ),
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userName!, password: password!);
  }
}
