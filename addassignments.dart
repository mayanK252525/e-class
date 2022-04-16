import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'verifyuploadassignments.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAssignments extends StatefulWidget {
  @override
  _AddAssignmentsState createState() => _AddAssignmentsState();
}
//

class _AddAssignmentsState extends State<AddAssignments> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String imageURL;
  String sem = "SEM";
  String department = "DEPARTMENT";
  String sub;
  String chp;5
  String tname;
  String downloadurl;
  var datetime;
  bool isLoading = false;

  var i = 0;
  var date;

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
                    "UPLOADING...",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text("Do Not Press Back"),
                ],
              ),
            ),
          ))
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Text("Add Assignment"),
              centerTitle: true,
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
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 25.0),
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
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 25.0),
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
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 25.0, right: 25.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Subject Name (eg. JAVA)",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(500, 327, 129, 155),
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
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
                    ///
                    ///
                    ///
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 25.0, right: 25.0),
                      child: SingleChildScrollView(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Faculty Name",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(500, 327, 129, 155),
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(height: 2, color: Colors.black),
                    ),
                    Text(
                      "Select Date For Assignment : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 100,
                        child: CupertinoDatePicker(
                            backgroundColor: Color.fromRGBO(0, 191, 255, 0.1),
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime(2017, 1, 1),
                            onDateTimeChanged: (DateTime newDateTime) {
                              // Do something

                              datetime = newDateTime;
                              //  print(date);
                              var dateTime =
                                  DateTime.parse("2019-10-22 00:00:00.000");

                              date =
                                  "${datetime.day}-${datetime.month}-${datetime.year}";

                              print(date);
                            }),
                      ),
                    ),
                    //selected pdf box         //selected pdf box         //selected pdf box         //selected pdf box
                    //selected pdf box         //selected pdf box         //selected pdf box         //selected pdf box         //selected pdf box

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () async {
                          if (sem == "SEM" ||
                              department == "DEPARTMENT" ||
                              sub == null ||
                              tname == null ||
                              datetime == null) {
                            print("Pleaseeeeeeeeeee select all fields");
                            _displayErrorMessager(context);
                          } else {
                            PlatformFile file = await pickFile();
                            File selectedFile = File(file.path);

                            if (selectedFile != null) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VerifyUploadAssignments(
                                        date: date,
                                        department: department,
                                        pdffile: selectedFile,
                                        sem: sem,
                                        subject: sub,
                                        tname: tname,
                                      )));
                            }
                          }

                          //  downloadurl = await uploadAssignments(
                          //    selectedFile, sem, department, tname, sub, date);

                          //print(downloadurl);
                        },
                        child: Text("SELECT FILE"),
                        color: Colors.orangeAccent[100],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: RaisedButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => VerifyUploadAssignments()));
                    //       });
                    //     },
                    //     child: Text(
                    //       "SUBMIT",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     color: Color.fromARGB(200, 327, 129, 155),
                    //   ),
                    // )
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
    FilePickerResult result = await FilePicker.platform.pickFiles();
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
