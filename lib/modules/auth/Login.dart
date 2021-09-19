import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/common/constants/Constants.dart';
import 'package:my_app/common/constants/HttpStatusCode.dart';
import 'package:my_app/common/model/Model.dart';
import 'package:my_app/common/service/StorageService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/HomeApp.dart';
import 'SignUp.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  Dio dio = Dio();

  String username = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff005AE6),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 85, 0, 34),
              child: Align(
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
              child: TextField(
                style:
                TextStyle(color: Colors.white, fontSize: 15, height: 2),
                onChanged: (value){
                  setState(() => username = value);
                },
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  labelStyle:
                  TextStyle(color: Colors.white, fontSize: 15, height: .1),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15, height: 2),
                    obscureText: true,
                    onChanged: (value){
                      setState(() => password = value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 15, height: .1),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 42),
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Ghi nhớ",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Text(
                      "Quên mật khẩu?",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 160),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: RaisedButton(
                  onPressed: () async {
                    onLogin();
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFFC71AA1),
                            Color(0xFFE765CB),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0))),
                    padding: EdgeInsets.only(top: 15),
                    child: const Text('Đăng nhập',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bạn chưa có tài khoản?",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    FlatButton(
                      child: Text(
                        'Đăng ký ngay',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                    )
                  ]),
            ),
          ],
        ),
      ),);
  }

  void onLogin() async {
    final url = '/v1/auth/login';
    final data = {
      "username": username,
      "password": password
    };

    Response response = await dio.post(Constants.API_URL + url, data: data);
    if(response.statusCode == HttpStatusCode.OK){
      // final  body = convert.jsonDecode(response.data);
      // StorageService.setToken(body['accessToken']);
      // print(StorageService.getToken());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

}
