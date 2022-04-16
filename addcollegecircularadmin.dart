import 'package:intl/intl.dart';
import 'package:E_Class/adminhomepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter_fullpdfview/flutter_fullpdfview.dart';

class AddCollegeCirculars extends StatefulWidget {
  @override
  _AddCollegeCircularsState createState() => _AddCollegeCircularsState();
}

class _AddCollegeCircularsState extends State<AddCollegeCirculars> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String title;
    String department = "DEPARTMENT";
    String dept;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add College Circulars"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: Column(
          children: [
            /////////////////
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
                    labelText: "TITLE (eg. Change In Timetable)",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(500, 327, 129, 155),
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value1) {
                    title = value1;
                    print(title);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: RaisedButton(
                onPressed: () async {
                  if (title == null) {
                    _displayError(context);
                  } else {
                    PlatformFile file = await pickFile();
                    File selectedFile = File(file.path);

                    if (selectedFile != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VerifyAndUploadCircular(
                                file: selectedFile,
                                title: title,
                              )));
                    }
                  }
                },
                child: Text(
                  "Select PDF",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                color: Colors.green[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _displayError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Select All Fields'),
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

class VerifyAndUploadCircular extends StatefulWidget {
  File file;
  String title;
  // String department;
  VerifyAndUploadCircular({
    // this.department,
    this.file,
    this.title,
  });
  @override
  _VerifyAndUploadCircularState createState() =>
      _VerifyAndUploadCircularState();
}

class _VerifyAndUploadCircularState extends State<VerifyAndUploadCircular> {
  bool isLoading = false;
  bool underline = false;
  String downloadurl;
  var col = Colors.grey;
  FirebaseStorage _storage = FirebaseStorage.instance;
  String department = "Department";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            key: _scaffoldKey,
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    Text("Do Not Press Back"),
                  ],
                ),
              ),
            ))
        : Scaffold(
            appBar: AppBar(
              title: Text("Verify And Upload Circulars"),
              centerTitle: true,
              backgroundColor: Colors.blue[900],
            ),
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 2.0,
                      color: col,
                      height: 2.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Text("Select Department : "),
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
                                      color: col,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  items: <String>[
                                    'Computer',
                                    'Electrical',
                                    'Chemical',
                                    'Mechenical'
                                  ].map((String value1) {
                                    return new DropdownMenuItem<String>(
                                      value: value1,
                                      child: new Text(value1),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      department = value;
                                      col = Colors.grey;
                                      print(department);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 2.0,
                      color: col,
                      height: 2.0,
                    ),
                  ),
                  Container(
                    //  color: Colors.grey[200],
                    height: 300,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PDFView(
                        filePath: widget.file.path,
                        enableSwipe: true,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 20.0, right: 20.0),
                    child: RaisedButton(
                      color: Colors.orange[900],
                      elevation: 7.0,
                      shape: Border.all(
                          style: BorderStyle.solid, color: Colors.green[900]),
                      onPressed: () async {
                        if (department == "Department") {
                          setState(() {
                            col = Colors.red;
                          });
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          downloadurl = await uploadCircular(
                              widget.file, department, widget.title);
                          print(downloadurl);
                        }
                      },
                      child: Center(
                        child: Text(
                          "UPLOAD",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future<String> uploadCircular(
    File file,
    String department,
    String title,
  ) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String uploaddate = formatter.format(now);
    print(uploaddate);
    String filename = uploaddate + file.path + department;
    String downloadurl;
    await _storage
        .refFromURL('gs://e-class-8c994.appspot.com')
        .child("Add Circulars")
        .child(department.toString())
        .child(filename)
        .putFile(file)
        .then((snapShot) async {
      print(snapShot.ref.getDownloadURL());
      downloadurl = await snapShot.ref.getDownloadURL();
    }).catchError((error) {
      isLoading = false;
      print(error);
    });
    if (downloadurl != null) {
      setState(() {
        isLoading = true;
      });

      print("Download Urllllllllll =====     " + downloadurl);
      CollectionReference users =
          FirebaseFirestore.instance.collection('Circulars');
      users.doc().set({
        'TITLE': title,
        'UPLOAD DATE': uploaddate,
        'DEPARTMENT': department,
        'URL': downloadurl,
      });

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            "Circular Added Succesfully",
            style: TextStyle(color: Colors.green[900]),
          ),
          // backgroundColor: Colors.green[200],
          content: RaisedButton(
            color: Colors.orange,
            onPressed: () {
              setState(() {
                isLoading = false;
              });
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AdminHomePage()));
            },
            child: Text(
              "OK",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      print(downloadurl);
    } else {
      setState(() {
        isLoading = false;
        print("Download URL Not Found");
      });
    }
    return null;
  }
}