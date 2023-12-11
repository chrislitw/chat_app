import 'package:chat_app/screens/home/home.dart';
import 'package:chat_app/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return const Home();
    } else {
      return const Login();
    }
  }
}
