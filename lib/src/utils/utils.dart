import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static Future<dynamic> push(BuildContext context, Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushReplacement(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushReplacementWithAnimation(
      BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (_, __, ___) => page));
  }
}

class AppAlert {
  static void snakeBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text('$message'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
