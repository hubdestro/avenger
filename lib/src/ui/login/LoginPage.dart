import 'package:avengers/src/ui/Base.dart';
import 'package:avengers/src/ui/home/HomePage.dart';
import 'package:avengers/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:avengers/src/ext/extension.dart';

import '../../providers/LoginProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends BaseState<LoginPage> {

  final GlobalKey<FormState> _keyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyPassword = GlobalKey<FormState>();


  @override
  Widget contentView() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "logo",
              child: Image.asset("assets/logo.png", height: 120),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 30, bottom: 10),
              child: Form(
                key: _keyEmail,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@example.com'),
                  validator: (String value) {
                    if (value.isEmpty)
                      return "Please enter email";
                    else if (!value.isValidEmail())
                      return "Invalid email";
                    else
                      return null;
                  },
                  onChanged: (text) {
                    Future.delayed(Duration(milliseconds: 100), () {
                      _keyEmail.currentState.validate();
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 30, top: 10),
              child: Form(
                key: _keyPassword,
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                  validator: (String value) {
                    if (value.isEmpty) return "Please enter password";
                    return null;
                  },
                  onChanged: (text) {
                    Future.delayed(Duration(milliseconds: 100), () {
                      _keyPassword.currentState.validate();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 18),
                child: MaterialButton(
                  onPressed: () {
                    AppNavigation.pushReplacement(context, HomePage());

                    // if (_keyEmail.currentState.validate() &&
                    //     _keyPassword.currentState.validate()) _doLogin();
                  },
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _doLogin() {
    FocusScope.of(context).unfocus();
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.addListener(() {
      AppAlert.snakeBar(context, "Login successfully");
      AppNavigation.pushReplacement(context, HomePage());
    });
    // loginProvider.login();
  }
}
