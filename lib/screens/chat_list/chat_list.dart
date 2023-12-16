import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatList extends ConsumerStatefulWidget {
  const ChatList({super.key});

  @override
  ConsumerState<ChatList> createState() => _ChatList();
}

class _ChatList extends ConsumerState<ChatList> {
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
        title: const Text('ChatList'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
