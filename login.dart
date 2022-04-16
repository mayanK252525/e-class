import 'package:E_Class/authentication.dart';
import 'package:E_Class/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  String err;
  String userID;
  bool isLoading = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String get getUserID => userID;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "Images/newloading.gif",
                    height: 50.0,
                    width: 50.0,
                  ),
                  Text(
                    "Please Wait...",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text("Do Not Press Back"),
                ],
              ),
            ),
          ))
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 38.0),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                ".",
                                style: TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.red),
                              ),
                            ],
                          )),
                    ),
//EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL  //EMAIL
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 150.0, left: 25.0, right: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),

//PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 25.0, right: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),

//LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON
                    Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Container(
                        height: 40.0,
                        child: RaisedButton(
                          //   borderRadius: BorderRadius.circular(20.0),
                          //    shadowColor: Colors.green,
                          color: Colors.green,
                          elevation: 7.0,
                          shape: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.green[900]),

                          onPressed: () {
                            setState(() {
                              isLoading = true;
                              loginAccount(email, password, context);
                            });
                          },
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("Forgot Password?")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
