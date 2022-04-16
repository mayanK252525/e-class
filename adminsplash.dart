import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'adminhomepage.dart';

class AdminSplash extends StatefulWidget {
  @override
  _AdminSplashState createState() => _AdminSplashState();
}

class _AdminSplashState extends State<AdminSplash> {
  String name;
  @override
  void initState() {
    super.initState();
    getName().whenComplete(() {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AdminHomePage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("Images/adminsplash.gif"),
              Text(
                "Hello,",
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchData() {
    FutureBuilder<QuerySnapshot>(
        // <2> Pass `Future<QuerySnapshot>` to future
        future: FirebaseFirestore.instance.collection('Users').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
                children: documents.map(
              (doc) => name = doc['Name'],
            ));
          } else {
            return Center(child: CircularProgressIndicator());
            //  return Text('It's Error!');
          }
        });
  }

  Future getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String getname = preferences.getString("Name");
    setState(() {
      name = getname;
    });
  }
}
