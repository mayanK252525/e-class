import 'package:E_Class/addcollegecircularadmin.dart';
import 'package:E_Class/addvideolectures.dart';
import 'package:E_Class/register.dart';
import 'package:E_Class/updatedetails.dart';
import 'package:E_Class/viewassignment.dart';
import 'package:E_Class/viewexams.dart';
import 'package:E_Class/viewusers.dart';
import 'package:E_Class/viewvideoadmin.dart';
import 'package:flutter/material.dart';
import 'uploadexams.dart';
import 'addassignments.dart';
import 'admindrawer.dart';
import 'package:E_Class/viewleavenoteadmin.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          backgroundColor: Colors.blue[900],
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 58.0),
              child: Icon(Icons.notifications),
            )
          ],
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[900],
                  Colors.blue[700],
                  Colors.blue[500],
                  Colors.blue[300],
                ]),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(15.0),
            children: [
              //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers //addusers
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/attendance.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Add Users"),
                      ),
                    ],
                  ),
                ),
              ),

//viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers //viewusers
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewUsers()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/viewuser.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("View Users"),
                      ),
                    ],
                  ),
                ),
              ),

//viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams  //viewexams
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewExams()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/exam.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("View Exams"),
                      ),
                    ],
                  ),
                ),
              ),

              //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams  //updateexams

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadExams()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "Images/test.png",
                        height: 60,
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Add Exam Details"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewAssignment()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/assignment.png",
                          height: 60.0, width: 60.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("View Assignment"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAssignments()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "Images/homework.png",
                        height: 60.0,
                        width: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Add Assignments"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UpdateDetails()));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/remove.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("UPDATE Details"),
                      ),
                    ],
                  ),
                ),
              ),
//leave note      //leave note      //leave note      //leave note      //leave note      //leave note      //leave note      //leave note      //leave note      //leave note
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewLeaveNoteAdmin()));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "Images/leavenote.png",
                        height: 60.0,
                        width: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("LeaveNote"),
                      ),
                    ],
                  ),
                ),
              ),

              //Circulars                //Circulars           //Circulars
              //
              //
              /////
              ///
              ///
              ///
              ///
              ///
              ///
              /////Circulars//Circulars//Circulars//Circulars//Circulars//Circulars//Circulars

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddCollegeCirculars()));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/circular.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("College Circulars"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddCollegeCirculars()));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/circular2.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Add Circulars"),
                      ),
                    ],
                  ),
                ),
              ),
//video Lectures

//
//
//
//
//Video Lectures

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BottomCheck()));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/video.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Video Lectures"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddVideoLectures()));
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/addvideo.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Add Video Lecture"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/about.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("About"),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Images/contact.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Contact"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        //  drawer: Nav_Drawer(),
        drawer: AdminDrawer(),
      ),
    );
  }
}
