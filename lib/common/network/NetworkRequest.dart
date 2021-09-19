import 'package:dio/dio.dart';


class NetworkRequest{
  Dio dio = Dio();
  String api_url = "https://dev.api.loyalty.wiinvent.tv";

  void login() async {
    String url = '/v1/auth/login';
    Response response = await dio.post(api_url + url, data: {"username": "test@gmail.com", "password": "123456"});
    print(response);
  }


  void getProfile() async {
    String url = '/v1/auth/login';
    try {
      Response response = await dio.get(api_url + url);
      print(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }
}

