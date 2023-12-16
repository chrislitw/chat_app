import 'package:chat_app/screens/login/login.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

// 註冊
Future<User?> fireAuthRegister(String name, String email, String password) async {
  UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password
  );

  User? user = userCredential.user;

  if (user != null) {
    print('user create successful');
    _firebaseFireStore
        .collection('users')
        .doc(user!.uid)
        .set({'uid': user!.uid, 'email': email, 'name': name});
    return user;
  } else {
    print("create failed");
    return null;
  }
}

// 登入
Future<User?> fireAuthLogin(String email, String password) async {
  UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password
  );

  User? user = userCredential.user;



  if (user != null) {
    print('user create successful');
    _firebaseFireStore
        .collection('users')
        .doc(user!.uid)
        .set({'uid': user.uid, 'email': email}, SetOptions(merge: true));
    return user;
  } else {
    print("create failed");
    return null;
  }
}

// 登出
Future logout(BuildContext context) async {
  await _firebaseAuth.signOut().then((value) {
    BaseViewModel.pushReplacement(context, const Login());
  });
}
