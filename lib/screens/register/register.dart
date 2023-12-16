import 'package:chat_app/screens/login/login.dart';
import 'package:chat_app/screens/register/register_view_model.dart';
import 'package:chat_app/system/base_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  late RegisterViewModel viewModel;


  @override
  void initState() {
    super.initState();
    viewModel = RegisterViewModel(context: context, setState: setState);
    viewModel.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _buildBanner(),
              _buildMainContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.only(left: 32),
      width: double.infinity,
      height: 140,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Chat App',
          style: TextStyle(fontSize: 36, color: Color(0xff14181B)),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(36),
      child: Column(
        children: [
          _buildTitle(),
          _buildSubTitle(),
          _buildInputField('Name', Icons.assistant_direction, viewModel.name),
          _buildInputField('Email', Icons.email, viewModel.email),
          _buildInputField('Password', Icons.lock, viewModel.password),
          _buildLoginButton(),
          _buildSignUpLink(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Create an account',
        style: TextStyle(color: Color(0xff14181B), fontSize: 36),
      ),
    );
  }

  Widget _buildSubTitle() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 12, bottom: 24),
        child: Text(
          "Let's get started by filling out the form below.",
          style: TextStyle(color: Color(0xff14181B), fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String hintText,
      IconData icon,
      TextEditingController controller
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          filled: true,
          fillColor: Colors.grey[200],
          // 设置背景颜色
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff57636C)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(12.0), // 设置圆角
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 44,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff4B39EF),
      ),
      child: InkWell(
        onTap: () => viewModel.register(),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            text: "Already have an account?   ",
            style: const TextStyle(
              color: Color(0xff14181B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Sign In here',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    BaseViewModel.pushReplacement(context, const Login());
                  },
                style: const TextStyle(
                  color: Color(0xff4B39EF),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
