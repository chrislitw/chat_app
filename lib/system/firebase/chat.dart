

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;


Future fireStoreCreateChatroom(String userId, String oppositeUserId, String chatroomId) async {

  // final String chatroomId = '$userId-$oppositeUserId';


  final DocumentSnapshot res = await _firebaseFireStore
      .collection('chatroom')
      .doc(chatroomId)
      .get();

  if (res.exists) {
  } else {
    _createChatroom(userId, chatroomId);
    _sendDefaultMessage(userId, oppositeUserId, chatroomId);
  }

  print('res: ${res.data()}');
}

// type
// 1: text
// 2: image
// 3: audio
// 4: video
// 5: other

// 如果 chatroom 不存在，則創建一個 chatroom
Future _createChatroom(String userId, String chatroomId) async {
  await _firebaseFireStore
      .collection('chatroom')
      .doc(chatroomId)
      .set({});
}

// 創建房間時會傳送一則訊息
Future _sendDefaultMessage(String userId, String oppositeUserId, String chatroomId) async {
  await _firebaseFireStore
      .collection('chatroom')
      .doc(chatroomId)
      .collection('messages')
      .add({'senderId': userId, 'receiverId': oppositeUserId, 'message': "你好～", 'type': 1, 'createTime': Timestamp.now()});
}

// 傳送訊息
Future sendMessage(String userId, String oppositeUserId, String chatroomId, String message) async {
  await _firebaseFireStore
      .collection('chatroom')
      .doc(chatroomId)
      .collection('messages')
      .add({'senderId': userId, 'receiverId': oppositeUserId, 'message': message, 'type': 1, 'createTime': Timestamp.now()});
}

