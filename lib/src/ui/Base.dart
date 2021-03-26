import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: contentView(),
    );
  }

  Widget contentView();
  AppBar appBar() {
    return null;
  }
}
