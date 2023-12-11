import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
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
        title: const Text('home'),
        actions: [logoutButton()],
      ),
      body: SafeArea(
          child: Container(
        color: Colors.cyan,
      )),
    );
  }

  Widget logoutButton() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: InkWell(
          onTap: () {
            logout(context);
          },
          child: Icon(Icons.exit_to_app),
        ));
  }
}
