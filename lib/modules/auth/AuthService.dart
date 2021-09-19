import 'package:dio/dio.dart';
import 'package:my_app/common/constants/Constants.dart';
import 'package:my_app/common/constants/HttpStatusCode.dart';

abstract class AuthService{
  Dio dio = Dio();
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<void> login(String username, String password) async {
    final url = '/v1/auth/login';
    final data = {
      "username": username,
      "password": password
    };

    Response response = await dio.post(Constants.API_URL + url, data: data);
    if(response.statusCode == HttpStatusCode.OK){
      print(response.data);
    }
  }

}