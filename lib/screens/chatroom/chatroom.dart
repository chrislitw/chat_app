import 'package:chat_app/system/firebase/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chatroom extends ConsumerStatefulWidget {
  final String chatroomId;
  final String oppositeUserId;

  const Chatroom({
    super.key,
    required this.chatroomId,
    required this.oppositeUserId,
  });

  @override
  ConsumerState<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends ConsumerState<Chatroom> {
  final TextEditingController message = TextEditingController();
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String get chatroomId => widget.chatroomId;
  String get oppositeUserId => widget.oppositeUserId;

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
        title: const Text('chatroom'),
      ),
      body: SafeArea(
        child: _buildMainContent(),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: _buildMessageField(),
      )
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xffFAFAFA),
      child: StreamBuilder<QuerySnapshot>(
        stream: _firebaseFireStore
            .collection('chatroom')
            .doc(chatroomId)
            .collection('messages')
            .orderBy('createTime', descending: false)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(snapshot.data?.docs[index]);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildMessageField() {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                controller: message,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'type some text',
                  hintStyle: const TextStyle(color: Color(0xff57636C)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0.0),
                    borderRadius: BorderRadius.circular(12.0), // 设置圆角
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                final String userId = firebaseAuth.currentUser?.uid ?? '';
                sendMessage(userId, oppositeUserId, chatroomId, message.text);
              },
              child: const Icon(Icons.send),
            )
          ],
        ));
  }

  Widget _buildMessageItem(a) {


    final String message = a['message'];
    final senderId = a['senderId'];

    final String uid = _firebaseAuth.currentUser?.uid ?? '';


    return Container(
      alignment: senderId == uid
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xff4B39EF),
        ),
        child: Text(message, style: const TextStyle(color: Color(0xffffffff)),),
      )
    );
  }
}
