

import 'package:chat_app/system/firebase/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
}