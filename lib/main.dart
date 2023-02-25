import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/screens/login_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScolarChat());
}

class ScolarChat extends StatelessWidget {
  const ScolarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.Id: (context) => LoginScreen(),
        RegisterScreen.Id: (context) => RegisterScreen(),
      },
      home: LoginScreen(),
    );
  }
}
