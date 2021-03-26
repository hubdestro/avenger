import 'package:avengers/src/model/User.dart';
import 'package:avengers/src/network/ApiProvider.dart';
import 'BaseProvider.dart';

class UserProvider extends BaseProvider {
  ApiProvider _apiProvider;

  UserProvider() {
    this._apiProvider = ApiProvider(this);
  }

  List<User> _userList = [];

  Future<void> execute() async {
    await _apiProvider.users(onSuccess: (users) {
      _userList = users;
      notifyListeners();
    });
  }

  List<User> userList() {
    return _userList;
  }
}
