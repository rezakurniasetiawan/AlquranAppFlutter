import 'package:alquran_app/SpalshScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00695C),
          centerTitle: true,
          title: Text(
            "Al-Qur'an",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 120),
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/reza.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: FutureBuilder(
                          future: FlutterSession().get('token'),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.hasData ? snapshot.data : 'Loading...',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF00695C),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SpashScreenku()));
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF00695C),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
