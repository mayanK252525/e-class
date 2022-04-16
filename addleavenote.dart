import 'dart:io';
import 'package:intl/intl.dart';
import 'package:E_Class/studenthomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_fullpdfview/flutter_fullpdfview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLeavenote extends StatefulWidget {
  @override
  _AddLeavenoteState createState() => _AddLeavenoteState();
}

class _AddLeavenoteState extends State<AddLeavenote> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String subjectforleave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Subject (eg.Sick Leave,Travel Leave)",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                onChanged: (value) {
                  subjectforleave = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                  onPressed: () async {
                    if (subjectforleave == null) {
                      print("Pleaseeeeeeeeeee Add Subject.....");
                      _displayErrorMessage(context);
                    } else {
                      PlatformFile file = await pickFile();
                      File selectedFile = File(file.path);

                      if (selectedFile != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerifyAndUploadLeaveNote(
                                  fileurl: selectedFile.path,
                                  sub: subjectforleave,
                                )));
                      }
                    }
                  },
                  child: Text("Attach"),
                  color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }

  _displayErrorMessage(BuildContext context) {
    final snackBar = SnackBar(content: Text('Please Add Subject'));
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

class VerifyAndUploadLeaveNote extends StatefulWidget {
  String fileurl;
  String sub;
  VerifyAndUploadLeaveNote({
    this.sub,
    this.fileurl,
  });
  @override
  _VerifyAndUploadLeaveNoteState createState() =>
      _VerifyAndUploadLeaveNoteState();
}

class _VerifyAndUploadLeaveNoteState extends State<VerifyAndUploadLeaveNote> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name;
  String email;
  String sem;
  String dept;
  File selectedfile;
  bool isLoading = false;

  FirebaseStorage _storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
    getlocaldata();
  }

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
              title: Text("Verify And Upload"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Subject : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            widget.sub,
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),

                    /////////////////////////////////////////////
                    ///
                    ///
                    ///
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Name : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),

                    //////////////////////////////////////////////////
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "SEM / Department : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            sem + " / " + dept,
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height: 300,
                          width: 250,
                          child: PDFView(
                            filePath: widget.fileurl,
                            fitEachPage: true,
                            //  swipeHorizontal: true,
                            autoSpacing: true,
                            pageFling: true,
                            onError: (error) {
                              setState(() {
                                print(error.toString());
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                              print(selectedfile.path);
                              print(sem);
                              print(dept);
                              print(name);
                              print(widget.sub);

                              uploadAssignments(
                                  selectedfile, sem, dept, name, widget.sub);
                            });
                          },
                          child: Text(
                            "Submit Application",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.green),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future<String> uploadAssignments(
      File file, String sem, String department, String name, String sub) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatteddate = formatter.format(now);
    String filename = sub + name + formatteddate.toString() + sem + department;
    String downloadurl;
    print(file.path);
    print(sem);
    print(department);
    print(name);
    print(sub);
    print(filename);
    print(formatteddate);

    await _storage
        .refFromURL('gs://e-class-8c994.appspot.com')
        .child("Add LeaveNote")
        .child(department.toString())
        .child(sem.toString())
        .child(filename.toString())
        .putFile(file)
        .then((snapShot) async {
      print(snapShot.ref.getDownloadURL());
      downloadurl = await snapShot.ref.getDownloadURL();
    }).catchError((error) {
      isLoading = false;
      print(error);
    });
    if (downloadurl != null) {
      print("Download Urllllllllll =====     " + downloadurl);
      CollectionReference users =
          FirebaseFirestore.instance.collection('LeaveNotes');
      users.doc().set({
        'SEM': sem,
        'DEPARTMENT': department,
        'E-MAIL': email,
        'NAME': name,
        'SUBJECT': sub,
        'DATE': formatteddate,
        'URL': downloadurl,
      });

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Leave Application Submitted Succesfully"),
          // backgroundColor: Colors.green[200],
          content: RaisedButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => StudentHomePage()));
              });
            },
            child: Text("OK"),
          ),
        ),
        barrierDismissible: false,
      );

      print(downloadurl);
    } else {
      print("Download URL Not Found");
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Error...Application Not Submitted"),
          // backgroundColor: Colors.green[200],
          content: RaisedButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => StudentHomePage()));
              });
            },
            child: Text("OK"),
          ),
        ),
        //   barrierDismissible: false,
      );
    }
  }

  Future getlocaldata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String getname = sharedPreferences.getString("Name");
    String getemail = sharedPreferences.getString("E-mail");
    String getsem = sharedPreferences.getString("Sem");
    String getdept = sharedPreferences.getString("Department");
    File thisfile = File(widget.fileurl);

    setState(() {
      name = getname;
      sem = getsem;
      email = getemail;
      dept = getdept;
      selectedfile = thisfile;
    });
  }
}
