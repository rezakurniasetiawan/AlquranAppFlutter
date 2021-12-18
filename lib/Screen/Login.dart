import 'package:alquran_app/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';

class Loginku extends StatefulWidget {
  const Loginku({Key key}) : super(key: key);

  @override
  _LoginkuState createState() => _LoginkuState();
}

class _LoginkuState extends State<Loginku> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future _login() async {
    var url = "https://alquranapp2.000webhostapp.com/login.php";
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      await FlutterSession().set('token', user.text);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacementNamed(context, '/HalamanUtama');
    } else {
      Fluttertoast.showToast(
          msg: "Username and password invalid",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/up_header.jpg'),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 30.0,
                  bottom: 20.0,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Username', prefixIcon: Icon(Icons.person)),
                controller: user,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                controller: pass,
                obscureText: true,
              ),
              SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () {
                  _login();
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF00695C),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Dont have an account',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                        TextSpan(
                            text: '  SIGN UP',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold))
                      ])),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
