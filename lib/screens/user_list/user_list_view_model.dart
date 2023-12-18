

import 'package:chat_app/screens/chatroom/chatroom.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:chat_app/system/firebase/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserListViewModel {

  BuildContext context;
  void Function(VoidCallback fn) setState;

  UserListViewModel({
    required this.context,
    required this.setState
  });

  List<QueryDocumentSnapshot> userList = [];


  void init(){
    _getUserList();
  }

  void _getUserList() async {
    final res = await getAllUserList();
    setState((){
      userList = res;
    });
  }

  void createChatroom(String oppositeUserId) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final String userId = firebaseAuth.currentUser?.uid ?? '';

    // BaseViewModel.showToast(context, '$userId');

    String chatroomId = '';

    if (userId[0].toLowerCase().codeUnits[0] > oppositeUserId[0].toLowerCase().codeUnits[0]) {
      chatroomId = '$userId$oppositeUserId';
    } else {
      chatroomId = '$oppositeUserId$userId';
    }

    await fireStoreCreateChatroom(userId, oppositeUserId, chatroomId);


    if (context.mounted) {
      BaseViewModel.pushPage(context, Chatroom(
        chatroomId: chatroomId,
        oppositeUserId: oppositeUserId
      ));
    }
  }

}