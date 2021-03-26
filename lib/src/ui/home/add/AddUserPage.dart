import 'package:avengers/src/ui/Base.dart';
import 'package:avengers/src/utils/utils.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends BaseState<AddUserPage> {

  @override
  AppBar appBar() {
    return AppBar(
      elevation: 10,
      centerTitle: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      title: Text("Add Avengers"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget contentView() {
    return Column(
      children: [],
    );
  }
}
