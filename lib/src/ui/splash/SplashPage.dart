import 'dart:async';

import 'package:avengers/src/ui/Base.dart';
import 'package:avengers/src/ui/login/LoginPage.dart';
import 'package:avengers/src/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends BaseState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      AppNavigation.pushReplacementWithAnimation(context, LoginPage());
    });
  }

  @override
  Widget contentView() {
    return Center(
      child: Hero(
        tag: "logo",
        child: Image.asset(
          "assets/logo.png",
          height: 70,
          width: 70,
        ),
      ),
    );
  }
}
