import 'package:avengers/src/providers/BaseProvider.dart';
import 'package:avengers/src/providers/Status.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends InterceptorsWrapper {
  BaseProvider baseProvider;

  AppInterceptor(this.baseProvider);

  @override
  Future onRequest(RequestOptions options) async {
    baseProvider.status = Status.Loading;
    print("Inside OnRequest Interceptor");
    return options;
  }

  @override
  Future onError(DioError err) async {
    baseProvider.status = Status.Error;
    print("Inside onError Interceptor");
    return err;
  }

  @override
  Future onResponse(Response response) async {
    print("Inside onResponse Interceptor");
    print("${response.data.toString()}");
    baseProvider.status = Status.Success;
    return response;
  }
}
