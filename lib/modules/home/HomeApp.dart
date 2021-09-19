import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/service/StorageService.dart';
import 'package:my_app/modules/auth/SignUp.dart';
import 'package:my_app/modules/auth/Login.dart';
import 'package:my_app/modules/control/Control.dart';
import 'package:my_app/modules/games/Games.dart';
import 'package:my_app/modules/profile/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/UserHeader.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => HomePage(),
        '/signUp': (context) => SignUp(),
      },
    );
  }

//
// Widget router() {
//   if(StorageService.getToken()){
//     return HomePage();
//   }else{
//     return Login();
//   }
// }
}

class HomePage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<HomePage> {
  int _selectedIndex = 0;
  String token = '';

  Widget _myHome = MyHome();
  Widget _myGames = MyGames();
  Widget _myControl = MyControl();
  Widget _myProfile = MyProfile();

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    setState(() {
      token = StorageService.getToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this.getBody(),
        bottomNavigationBar: Container(
          height: 62,
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(31),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF0000001a),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1))
                ],
              ),
              child: menuBar(),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 64,
          height: 64,
          child: FloatingActionButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              backgroundColor: Colors.white,
              child: Icon(
                Icons.control_camera,
                size: 35,
                color: Colors.blue,
              )),
        ));
  }

  Widget getBody() {
    if (this._selectedIndex == 0) {
      return this._myHome;
    } else if (this._selectedIndex == 1) {
      return this._myGames;
    } else if (this._selectedIndex == 3) {
      return this._myControl;
    } else if (this._selectedIndex == 4) {
      return this._myProfile;
    } else {
      return this._myHome;
    }
  }

  BottomNavigationBar menuBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang Chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videogame_asset),
          label: 'Giải Trí',
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.control_camera),
          label: 'Điều Khiển',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Cá nhân',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF4478DA),
      onTap: _onItemTapped,
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFFA690FC), Color(0xFF0DC3E3)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            User(),
            Container(
              height: 100,
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ],
        ),
      ),
    );
  }
}
