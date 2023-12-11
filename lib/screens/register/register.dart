import 'package:chat_app/screens/home/home.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 一個跳轉用的空畫面，主要負責 App 啟動邏輯。
/// 判斷是否有可用的 accessToken 來嘗試自動登入會在這個地方做。
class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  bool isLoading = false;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
              title: const Text('register a account.'),
              leading: InkWell(
                onTap: () {
                  BaseViewModel.popPage(context);
                },
                child: Icon(Icons.arrow_back_ios_new),
              )),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    inputField(size, 'name', Icons.account_box, name),
                    const SizedBox(height: 10),
                    inputField(size, 'email', Icons.email, email),
                    const SizedBox(height: 10),
                    inputField(size, 'password', Icons.lock, password),
                    const SizedBox(height: 10),
                    confirmButton(size)
                  ],
                )),
    );
  }

  Widget inputField(Size size, String hintText, IconData icon,
      TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: size.height / 15,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xfffafafa), width: 1)),
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
        borderRadius: BorderRadius.circular(10),
        color: Colors.amberAccent,
      ),
      child: InkWell(
        onTap: () {
          if (name.text.isNotEmpty &&
              email.text.isNotEmpty &&
              password.text.isNotEmpty) {
            print('login');
            setState(() {
              isLoading = true;
            });

            registerAccount(name.text, email.text, password.text).then((user) {
              if (user != null) {
                setState(() => isLoading = false);
                print('register successful');
                BaseViewModel.pushPage(context, Home());
              } else {
                print('register failed');
                BaseViewModel.showToast(context, 'register failed');
              }
            });
          }
        },
        child: Center(
          child: Text('register.'),
        ),
      ),
    );
  }
}
