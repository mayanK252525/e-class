import 'package:E_Class/updatedetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_pdf_viewer/simple_pdf_viewer.dart';

class EditLeaveNotes extends StatefulWidget {
  @override
  _EditLeaveNotesState createState() => _EditLeaveNotesState();
}

class _EditLeaveNotesState extends State<EditLeaveNotes> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String sem = "SEM";
  String department = "Department";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Text("Select Semister : "),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DropdownButton<String>(
                              hint: Text(
                                sem,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              items: <String>['1', '2', '3', '4', '5', '6']
                                  .map((String value1) {
                                return new DropdownMenuItem<String>(
                                  value: value1,
                                  child: new Text(value1),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  sem = value;
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
                ),
                Container(
                  child: Row(
                    children: [
                      Text("Select Department : "),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DropdownButton<String>(
                              hint: Text(
                                department,
                                style: TextStyle(
                                  color: Colors.grey,
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
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: RaisedButton(
                      elevation: 10,
                      color: Colors.green[200],
                      onPressed: () {
                        setState(() {
                          if (sem == "SEM" || department == "Department") {
                            _displayError(context);
                            print("Please Select All Fields");
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LeaveNotesToDelete(
                                      sem: sem,
                                      dept: department,
                                    )));
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 25.0),
                            child: Text("View"),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displayError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Please Select Semister And Department'),
      backgroundColor: Colors.red[900],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

class LeaveNotesToDelete extends StatefulWidget {
  String sem;
  String dept;

  LeaveNotesToDelete({
    this.dept,
    this.sem,
  });

  @override
  _LeaveNotesToDeleteState createState() => _LeaveNotesToDeleteState();
}

class _LeaveNotesToDeleteState extends State<LeaveNotesToDelete> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String chp = "Loading";
  String date = "Loading";
  String sub = "Loading";
  String tname = "Loading";
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Delete LeaveNote"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: FutureBuilder<QuerySnapshot>(
          // <2> Pass `Future<QuerySnapshot>` to future
          future: FirebaseFirestore.instance
              .collection('LeaveNotes')
              .where(
                'SEM',
                isEqualTo: widget.sem,
              )
              .where('DEPARTMENT', isEqualTo: widget.dept)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // <3> Retrieve `List<DocumentSnapshot>` from snapshot
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return ListView(
                  children: documents
                      .map((doc) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey[200],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Divider(height: 2, color: Colors.black),
                                  ListTile(
                                    leading: Container(
                                        width: 50.0,
                                        child: Text(doc['SUBJECT'])),
                                    title: Text(
                                      doc['NAME'],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17.0),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  url = doc["URL"];
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          AlertDialog(
                                                            backgroundColor:
                                                                Colors
                                                                    .blue[900],

                                                            // backgroundColor: Colors.green[200],
                                                            content:
                                                                SimplePdfViewerWidget(
                                                              initialUrl: url,
                                                            ),
                                                          ));
                                                });
                                              },
                                              child: Text("VIEW"),
                                              color: Colors.amberAccent[700],
                                            )),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Added On : " + doc['DATE'],
                                              //overflow: TextOverflow.clip,
                                            )),
                                      ],
                                    ),
                                    trailing: RaisedButton(
                                      onPressed: () {
                                        setState(() {
                                          url = doc["URL"];
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                  backgroundColor:
                                                      Colors.blue[900],
                                                  title: Text(
                                                    "Delete this exam?",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),

                                                  // backgroundColor: Colors.green[200],
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: RaisedButton(
                                                          color:
                                                              Colors.green[300],
                                                          onPressed: () {
                                                            setState(() async {
                                                              print(url);
                                                              _firebaseFirestore
                                                                  .collection(
                                                                      "LeaveNotes")
                                                                  .where("URL",
                                                                      isEqualTo:
                                                                          url)
                                                                  .get();

                                                              var doc_id2 = doc
                                                                  .reference.id;

                                                              print(doc_id2);

                                                              _firebaseFirestore
                                                                  .collection(
                                                                      "LeaveNotes")
                                                                  .doc(doc_id2)
                                                                  .delete()
                                                                  .whenComplete(() =>
                                                                      //    _displaySuccess(
                                                                      //      context));

                                                                      Navigator.of(context).popUntil((route) => route.isFirst));
                                                            });
                                                          },
                                                          child: Text(
                                                            "DELETE",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                      },
                                      color: Colors.black,
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Divider(height: 2, color: Colors.black),
                                ],
                              ),
                            ),
                          ))
                      .toList());
            } else {
              return Center(child: CircularProgressIndicator());
              //  return Text('It's Error!');
            }
          }),
    );
  }
}
