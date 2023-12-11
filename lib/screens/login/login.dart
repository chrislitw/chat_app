import 'package:chat_app/screens/register/register.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 一個跳轉用的空畫面，主要負責 App 啟動邏輯。
/// 判斷是否有可用的 accessToken 來嘗試自動登入會在這個地方做。
class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool isLoading = false;
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
          title: const Text('login page'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  inputField(size, 'email', Icons.email, email),
                  const SizedBox(height: 10),
                  inputField(size, 'password', Icons.lock, password),
                  const SizedBox(height: 10),
                  confirmButton(size),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      BaseViewModel.pushPage(context, const Register());
                    },
                    child: const Center(
                      child: Text(
                        'create a account.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )
                ],
              ),
      ),
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
            borderSide: const BorderSide(color: Color(0xfffafafa), width: 1),
          ),
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
          if (email.text.isNotEmpty && password.text.isNotEmpty) {
            print('login');
            setState(() {
              isLoading = true;
            });

            login(email.text, password.text).then((user) {
              if (user != null) {
                setState(() {
                  isLoading = false;
                });
                print('register successful');
              } else {
                print('register failed');
              }
            });
          }
        },
        child: const Center(
          child: Text('login'),
        ),
      ),
    );
  }
}
