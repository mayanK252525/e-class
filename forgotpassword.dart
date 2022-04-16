import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String err;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter E-mail",
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
                      style: BorderStyle.solid, color: Colors.green[900]),

                  onPressed: () {
                    if (email != null) {
                      setState(() {
                        //  isLoading = true;
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .catchError((e) {
                          setState(() {
                            err = e;
                            print(e);
                          });
                          //_displayErrorMessage(context, e);
                        });
                        if (err == null) {
                          _displaySuccessMessage(context);
                        }
                      });
                    } else {
                      _displayErrorMessage(context, err.toString());
                    }
                  },
                  child: Center(
                    child: Text(
                      "RESET",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _displaySuccessMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('password Reset Link To Your Registerd E-mail ID'),
      backgroundColor: Colors.green[900],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _displayErrorMessage(BuildContext context, String error) {
    final snackBar = SnackBar(
      content: Text(error),
      backgroundColor: Colors.red[900],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _displayNULLMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Please Enter E-Mail"),
      backgroundColor: Colors.red[900],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
