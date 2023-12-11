import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class BaseViewModel {
  static bool get isIos => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;

  static void showToast(BuildContext context, String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF7C7C7C),
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void popPage(BuildContext context, {dynamic sendMessage}) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, sendMessage);
    }
  }

  static Future<T?> pushPage<T extends Object>(
      BuildContext context, Widget page,
      {PageTransitionType? pageTransitionType}) {
    final Route<T>? pageTransition =
        _getPageTransition(type: pageTransitionType, page: page);
    return Navigator.push(
      context,
      pageTransition ?? MaterialPageRoute(builder: (context) => page),
    );
  }

  static Route<T>? _getPageTransition<T extends Object>(
      {PageTransitionType? type, required Widget page}) {
    Route<T>? pageTransition;
    if (type != null) {
      pageTransition = PageTransition(
        type: type, // 这里定义过渡效果
        child: page,
      );
    }

    return pageTransition;
  }
}
