import 'package:chat_app/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> registerAccount(
    String name, String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    User? user = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print('user create successful');
      return user;
    } else {
      print("create failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> login(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    User? user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print('user create successful');
      return user;
    } else {
      print("create failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logout(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    });
  } catch (e) {
    print(e);
  }
}
