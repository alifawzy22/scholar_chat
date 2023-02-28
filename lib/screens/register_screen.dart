import 'package:flutter/material.dart';
import 'package:scholar_chat/common/show_snack_bar.dart';
import 'package:scholar_chat/common/validate_email.dart';
import 'package:scholar_chat/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scholar_chat/screens/chat_page.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? emailAddress;

  String? password;
  bool ismodalLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ModalProgressHUD(
        inAsyncCall: ismodalLoading,
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
                'Register',
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
                  emailAddress = data;
                  setState(() {});
                },
                validateFunction: validateEmail,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onChangeFunction: (data) {
                  password = data;
                  setState(() {});
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
                text: 'Register',
                ontap: () async {
                  setState(() {
                    ismodalLoading = true;
                  });
                  if (formKey.currentState!.validate()) {
                    try {
                      await createUserAndEmail();
                      setState(() {
                        ismodalLoading = false;
                      });
                      Navigator.pushNamed(context, ChatPage.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ShowSnackBar.snackBarFunction(context,
                            text: 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        ShowSnackBar.snackBarFunction(context,
                            text: 'The account already exists for that email.');
                      }
                      setState(() {
                        ismodalLoading = false;
                      });
                    } catch (e) {
                      setState(() {
                        ismodalLoading = false;
                      });

                      ShowSnackBar.snackBarFunction(context, text: '$e');
                    }
                  }
                  setState(() {
                    ismodalLoading = false;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'already have an account?  ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
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
        ),
      ),
    );
  }

  Future<void> createUserAndEmail() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
