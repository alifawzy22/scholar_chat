import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static String id = 'RegisterScreen';
  GlobalKey<FormState> _formKey = GlobalKey();
  String? emailAddress;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: _formKey,
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
              },
              validateFunction: (data) {
                if (data == null || data.isEmpty) {
                  return 'please enter Email';
                }
                return null;
              },
              hintText: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              onChangeFunction: (data) {
                password = data;
                print('Password = $password');
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
                if (_formKey.currentState!.validate()) {
                  print('password = $password');
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailAddress!,
                      password: password!,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Success.'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('The password provided is too weak.'),
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'The account already exists for that email.'),
                        ),
                      );
                    } else {
                      SnackBar(
                        content: Text('Emal not correct.'),
                      );
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$e'),
                      ),
                    );
                  }
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
    );
  }
}
