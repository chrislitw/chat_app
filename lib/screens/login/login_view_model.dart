// class PersonalMissionViewModel {
//   WidgetRef ref;
//   ViewChange setState;
//   PersonalMissionViewModel({required this.ref, required this.setState});
// }

import 'package:chat_app/screens/home/home.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:chat_app/system/firebase/auth.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel {
  BuildContext context;
  void Function(VoidCallback fn) setState;

  LoginViewModel({required this.context, required this.setState});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode focusNode = FocusNode();


  init() {}

  void login() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      fireAuthLogin(email.text, password.text).then((user) {
        if (user != null) {
          print('login successful');
          BaseViewModel.pushReplacement(context, const Home());
        } else {
          print('login failed');
          BaseViewModel.showToast(context, 'login failed');
        }
      });
    } else {
      BaseViewModel.showToast(context, 'some info not filled in');
    }
  }
}
