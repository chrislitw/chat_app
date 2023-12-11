import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 一個跳轉用的空畫面，主要負責 App 啟動邏輯。
/// 判斷是否有可用的 accessToken 來嘗試自動登入會在這個地方做。
class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  ConsumerState<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends ConsumerState<Welcome> {
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('launch'),
          ),
          resizeToAvoidBottomInset: false,
          body: Text('asdasdasd')),
    );
  }
}
