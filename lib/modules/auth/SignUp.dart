import 'package:flutter/material.dart';

import 'Login.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {

  String username = '';
  String password = '';
  String confirmPassword = '';

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
                  "Đăng ký",
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
                    onChanged: (value){
                      setState(() => password = value);
                    },
                    obscureText: true,
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15, height: 2),
                    onChanged: (value){
                      setState(() => confirmPassword = value);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Xác nhận mật khẩu',
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
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      value: false,
                      onChanged: (bool? value) {
                      },
                    ),
                    Text(
                      "Tôi đồng ý với các Điều khoản & Điều kiện",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: RaisedButton(
                  onPressed: onSignUp,
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
                    child: const Text('Đăng ký',
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
                        'Đăng nhập ngay',
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
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    )
                  ]),
            ),
          ],
        ),
      ),);
  }

  void onSignUp() {

    Navigator.pushNamed(context, '/login');
  }
}