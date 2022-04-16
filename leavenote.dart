import 'package:E_Class/studenthomepage.dart';
import 'package:E_Class/viewyourleavenotes.dart';
import 'package:flutter/material.dart';
import 'addleavenote.dart';

class LeaveNote extends StatefulWidget {
  @override
  _LeaveNoteState createState() => _LeaveNoteState();
}

class _LeaveNoteState extends State<LeaveNote> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: Colors.blue[900],
                          title: Text(
                            "Steps : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          // backgroundColor: Colors.green[200],
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "1. Write Subject Of LeaveNote.",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "2. Attach PDF File Contain Below Details :",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " - Your Name",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " - Your SEM",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " - Your DEPARTMENT",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " - Your SUBJECT",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  " - Your BODY(MUST CONTAIN DATE ON WHICH YOU ARE GOING TO ASBENT)",
                                  style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " - Your PARENTS MOBILE NO.",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " - Your PARENTS SIGNATURE.",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                              RaisedButton(
                                color: Colors.green[300],
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        ),
                        //    barrierDismissible: false,
                      );
                    },
                    child: Icon(Icons.info)),
              )
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.note_add),
                  text: "Write Note",
                ),
                Tab(
                  icon: Icon(Icons.view_week_rounded),
                  text: "View Your Note",
                ),
              ],
            ),
            title: Text("LeaveNote"),
          ),
          body: TabBarView(
            children: [
              AddLeavenote(),
              ViewYourLeaveNotes(),
            ],
          ),
        ));
  }
}
