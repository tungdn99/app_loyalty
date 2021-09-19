import 'package:flutter/material.dart';


class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                    width: 68,
                    height: 68,
                    margin: const EdgeInsets.only(right: 9.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                      Image.asset('assets/images/iconProfile.jpg'),
                    )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyễn Tiến Anh',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'P2419',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 16),
            child: Container(
              width: 62,
              height: 66,
              margin: const EdgeInsets.only(top: 9.0),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                      AssetImage("assets/images/iconProfile.png")),
                  shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
