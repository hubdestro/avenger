import 'package:avengers/src/repository/login_repo.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {

  LoginRepo loginRepository = LoginRepo();

  Future<void> login() async {
    await loginRepository.login("eve.holt@reqres.in", "cityslicka");
    notifyListeners();
  }
}
