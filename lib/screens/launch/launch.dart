import 'package:chat_app/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 一個跳轉用的空畫面，主要負責 App 啟動邏輯。
/// 判斷是否有可用的 accessToken 來嘗試自動登入會在這個地方做。
class Launch extends ConsumerStatefulWidget {
  const Launch({super.key});

  @override
  ConsumerState<Launch> createState() => _LaunchState();
}

class _LaunchState extends ConsumerState<Launch> {
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
    final Size size = MediaQuery.of(context).size;

    return const Register();

    // return WillPopScope(
    //   onWillPop: () async {
    //     return false;
    //   },
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text('sign in'),
    //       ),
    //       body: Column(
    //         children: [
    //           inputField(size, 'email', Icons.account_box),
    //           const SizedBox(height: 10),
    //           inputField(size, 'password', Icons.lock),
    //           const SizedBox(height: 10),
    //           confirmButton(size)
    //         ],
    //       )),
    // );
  }

  Widget inputField(Size size, String hintText, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: size.height / 15,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xfffafafa), width: 1)),
        ),
      ),
    );
  }

  Widget confirmButton(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: size.height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.amberAccent,
      ),
      child: InkWell(
        onTap: () {
          print('login');
        },
        child: const Center(
          child: Text('confirm'),
        ),
      ),
    );
  }
}
