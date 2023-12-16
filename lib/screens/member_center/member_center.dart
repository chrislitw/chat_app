import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberCenter extends ConsumerStatefulWidget {
  const MemberCenter({super.key});

  @override
  ConsumerState<MemberCenter> createState() => _MemeberCenterState();
}

class _MemeberCenterState extends ConsumerState<MemberCenter> {
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
        title: const Text('MemberCenter'),
        automaticallyImplyLeading: false,
        actions: [logoutButton()],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          color: Colors.green,
          child: const Column(
            children: [
              Text('asd'),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          logout(context);
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
