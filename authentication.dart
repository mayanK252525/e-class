import 'rolenav.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'studenthomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'adminhomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
String userID;
String get getUserID => userID;

String err;

Future loginAccount(String email, String pass, context) async {
  String name;
  String emailid;
  String password;
  String sem;
  String dept;
  String uid;
  String role;

  UserCredential userCredential = await firebaseAuth
      .signInWithEmailAndPassword(email: email, password: pass)
      .catchError((e) {
    print(e);
  });

  User user = userCredential.user;
  userID = user.uid;
  print(userID);

  if (userID != null) {
    // fetchData(context);
    DocumentSnapshot document =
        await FirebaseFirestore.instance.collection('Users').doc(userID).get();
    role = document.data()["Role"];
    name = document.data()["Name"];
    emailid = document.data()["E-mail"];
    password = document.data()["Password"];
    sem = document.data()["Sem"];
    dept = document.data()["Department"];
    uid = document.data()["UserID"];

    //////
    ///
    ///
    ///
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("E-mail", email.toString());
    sharedPreferences.setString("Role", role.toString());
    sharedPreferences.setString("Name", name.toString());
    sharedPreferences.setString("Password", pass.toString());
    sharedPreferences.setString("Sem", sem.toString());
    sharedPreferences.setString("Department", dept.toString());
    sharedPreferences.setString("UserID", uid.toString());
    sharedPreferences.setString("isUserLoggedIN", "Yes");

    fetchData(context);
  } else {
    print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror");
  }
}

Future<void> createAccount(String name, String sem, String dept, String role,
    String email, String pass, context) async {
  UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: pass)
      .catchError((e) {
  
    err = e;
    print(err);
  });
  User user = userCredential.user;
  userID = user.uid;
  print(userID);

  if (userID != null) {
    addData(userID, name, sem, dept, role, email, pass, context);
  } else {
    print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror");
  }
}

Future signOut(BuildContext context) {
  return firebaseAuth.signOut().whenComplete(() => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage())));
}

Future addData(String uid, String name, String sem, String dept, String role,
    String email, String pass, context) {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.doc(uid).set({
    'Name': name,
    'Sem': sem,
    'Department': dept,
    'Role': role,
    'E-mail': email,
    'Password': pass,
    'UserID': uid,
  });
  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AdminHomePage()));
}
