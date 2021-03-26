import 'package:avengers/src/model/User.dart';
import 'package:avengers/src/network/ResponseInterceptor.dart';
import 'package:avengers/src/providers/BaseProvider.dart';
import 'package:avengers/src/providers/Status.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();
  final BaseProvider baseProvider;

  ApiProvider(this.baseProvider) {
    dio.options.baseUrl = "https://reqres.in/api/";
    dio.interceptors.add(AppInterceptor(baseProvider));
  }

  Future<void> users({Function(List<User> users) onSuccess}) async {
    baseProvider.status = Status.Loading;

    Response response = await dio.get("users?page=2");
    if (response.statusCode == 200) {
      List<User> users = [];
      response.data['data'].forEach((v) {
        users.add(User.fromJson(v));
      });
      onSuccess(users);
    }
  }
}
