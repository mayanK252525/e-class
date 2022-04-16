import 'package:flutter/material.dart';
import 'authentication.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String sem = "SEM";
  String role = "Student";
  String email;
  String password;
  String err;
  String dept = "Department";
  bool isLoading = false;

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
                    "Please Wait...",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Text("Do Not Press Back"),
                ],
              ),
            ),
          ))
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 38.0),
                                child: Text(
                                  "ADD Users",
                                  style: TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                ".",
                                style: TextStyle(
                                    fontSize: 100.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.red),
                              ),
                            ],
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 25.0, right: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "NAME",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          name = value;
                        },
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
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
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

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Container(
                        child: Row(
                          children: [
                            Text("Select Department : "),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 25.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      dept,
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
                                        dept = value;

                                        print(dept);
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

//role     //role     //role     //role     //role     //role     //role     //role     //role     //role     //role     //role     //role     //role

                    Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 25.0, right: 25.0),
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Radio(
                                      value: "Admin",
                                      groupValue: role,
                                      onChanged: (value) {
                                        setState(() {
                                          role = value;
                                          print(role);
                                        });
                                      }),
                                  Text("Admin")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 50.0, right: 25.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Radio(
                                        value: "Student",
                                        groupValue: role,
                                        onChanged: (value) {
                                          setState(() {
                                            role = value;
                                            print(role);
                                          });
                                        }),
                                    Text("Student")
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),

//EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL   //EMAIL  //EMAIL
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 25.0, right: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "EMAIL",
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

//PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD   //PASSWORD

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 25.0, right: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),

//LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON  //LOGINBUTTON
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
                              style: BorderStyle.solid,
                              color: Colors.green[900]),

                          onPressed: () {
                            setState(() {
                              isLoading = true;
                              createAccount(name, sem, dept, role, email,
                                  password, context);
                            });
                          },
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //  Padding(
                    //  padding: const EdgeInsets.only(bottom: 5.0),
                    //child: Align(
                    //  alignment: Alignment.bottomCenter,
                    //child: Text("NG PATEL POLYTECHNIC")),
                    // ),
                  ],
                ),
              ),
            ),
          );
  }
}
