import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserList'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
