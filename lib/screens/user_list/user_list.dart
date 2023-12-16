import 'package:chat_app/screens/user_list/user_list_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  late UserListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = UserListViewModel(context: context, setState: setState);
    viewModel.init();
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
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildUserList(),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildUserList() {
    return ListView.separated(
      itemCount: viewModel.userList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _buildUserItem(viewModel.userList[index]);
      }, separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildUserItem(userInfo) {

    final String name = userInfo.data()['name'] ?? '';
    final String email = userInfo.data()['email'] ?? '';

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(email),
        ],
      ),
      leading: const Icon(Icons.person),
      trailing: const Icon(Icons.chat_sharp),
    );
  }
}
