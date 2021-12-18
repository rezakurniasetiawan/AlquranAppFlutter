import 'dart:convert';
import 'package:alquran_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future _register() async {
    var url = "https://alquranapp2.000webhostapp.com/register.php";
    var response = await http.post(url, body: {
      "name": name.text,
      "email": email.text,
      "password": pass.text,
      "username": user.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "User allready exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registration Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00695C),
          centerTitle: true,
          title: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
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
                        'Created New Account',
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
                        hintText: 'Nama', prefixIcon: Icon(Icons.person)),
                    controller: name,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Email', prefixIcon: Icon(Icons.person)),
                    controller: email,
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
                      _register();
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF00695C),
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
