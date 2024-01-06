

import 'package:flutter/cupertino.dart';

class ListViewDemoViewModel {

  BuildContext context;
  void Function(VoidCallback fn) setState;

  ListViewDemoViewModel({
    required this.context,
    required this.setState
  });

  final TextEditingController email = TextEditingController();

}