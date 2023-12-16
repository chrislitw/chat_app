import 'package:chat_app/screens/home/home.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel {

  BuildContext context;
  void Function(VoidCallback fn) setState;

  RegisterViewModel({
    required this.context,
    required this.setState
  });

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  init(){

  }


  void register() {
    if (name.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty) {
      fireAuthRegister(name.text, email.text, password.text).then((user) {
        if (user != null) {
          print('register successful');
          BaseViewModel.pushReplacement(context, const Home());
        } else {
          print('register failed');
          BaseViewModel.showToast(context, 'login failed');
        }
      });
    } else {
      BaseViewModel.showToast(context, 'some info not filled in');
    }
  }


}