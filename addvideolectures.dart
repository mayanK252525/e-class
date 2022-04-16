import 'dart:io';

import 'package:E_Class/verifyanduploadvideo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'adminhomepage.dart';

class AddVideoLectures extends StatefulWidget {
  @override
  _AddVideoLecturesState createState() => _AddVideoLecturesState();
}

class _AddVideoLecturesState extends State<AddVideoLectures> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String imageURL;
  String sem = "SEM";
  String department = "DEPARTMENT";
  String topic;

  String sub;
  // String chp;
  String tname;
  String downloadurl;
  var datetime;
  bool isLoading = false;

  var i = 0;
  var date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add Video Lectures"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          //  color: Color.fromARGB(300, 227, 129, 455),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SEM : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        //  color: Color.fromARGB(500, 327, 129, 155)
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton<String>(
                          hint: Text(
                            sem,
                            style: TextStyle(
                              // color: Color.fromARGB(500, 327, 129, 155),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          items: <String>['1', '2', '3', '4', '5', '6']
                              .map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              sem = value;
                              print(sem);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ///
              ///
              ///
              ///
              ///
              ///
              ///
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "DEPARTMENT : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        //   color: Color.fromARGB(500, 327, 129, 155)
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton<String>(
                          hint: Text(
                            department,
                            style: TextStyle(
                              //color: Color.fromARGB(500, 327, 129, 155),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          items: <String>[
                            'Computer',
                            'Electrical',
                            'Chemical',
                            'Mechenical'
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              department = value;
                              print(department);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(height: 2, color: Colors.black),
              ),
              //subname  //subname   //subname   //subname    //subname          //subname              //subname     //subname
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Subject Name (eg. JAVA)",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(500, 327, 129, 155),
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      sub = value;
                    },
                  ),
                ),
              ),

              //////////////////////
              ////
              ///
              ///
              ///
              ///
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Topic Name (eg. Exception Handeling)",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(500, 327, 129, 155),
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      topic = value;
                    },
                  ),
                ),
              ),

              ///
              ///
              ///
              ///
              ///
              ///
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                child: SingleChildScrollView(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Faculty Name",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(500, 327, 129, 155),
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      tname = value;
                    },
                  ),
                ),
              ),
              ///////////
              ///
              ///
              ///
              ///
              ///
              ///
              ///

              //selected pdf box         //selected pdf box         //selected pdf box         //selected pdf box
              //selected pdf box         //selected pdf box         //selected pdf box         //selected pdf box         //selected pdf box

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: RaisedButton(
                  onPressed: () async {
                    if (sem == "SEM" ||
                        department == "DEPARTMENT" ||
                        topic == null ||
                        sub == null ||
                        tname == null) {
                      print("Pleaseeeeeeeeeee select all fields");
                      _displayErrorMessager(context);
                    } else {
                      PlatformFile file = await pickFile();
                      File selectedFile = File(file.path);

                      if (selectedFile != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerifyAndUploadVideo(
                                  //  date: date,
                                  department: department,
                                  pdffile: selectedFile,
                                  sem: sem,
                                  subject: sub,
                                  topicname: topic,
                                  tname: tname,
                                )));
                      }
                    }
                  },
                  child: Text(
                    "SELECT VIDEO",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.lime[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _displayErrorMessager(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Please Select All Fields'),
      backgroundColor: Colors.red[900],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<PlatformFile> pickFile() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles(type: FileType.video, allowMultiple: false);
    if (result != null) {
      PlatformFile file = result.files.first;
      print("File Path..." + file.path);
      return file;
    } else {
      print("User Cancelled");
      return null;
    }
  }
}
