import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication.dart';

class Nav_Drawer extends StatefulWidget {
  @override
  _Nav_DrawerState createState() => _Nav_DrawerState();
}

class _Nav_DrawerState extends State<Nav_Drawer> {
  String name;
  String email;
  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: UserAccountsDrawerHeader(
                accountName: (name != null) ? Text(name) : Text("Loading..."),
                accountEmail:
                    (email != null) ? Text(email) : Text("Loading..."),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('Images/ngpatellogo.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey[900],
                        Colors.blue[900],
                      ]),
                ),
              ),
            ),
            ListTile(
              title: Text("Time-Table"),
              leading: Image.asset(
                'Images/timetable.png',
                scale: 1.5,
              ),
            ),
            ListTile(
              title: Text("Attendance"),
              leading: Image.asset(
                'Images/attendance.png',
                scale: 1.5,
              ),
            ),
            ListTile(
              title: Text("exam"),
              leading: Image.asset(
                'Images/exam.png',
                scale: 1.5,
              ),
            ),
            ListTile(
              title: Text("Assignment"),
              leading: Image.asset(
                'Images/assignment.png',
                scale: 1.5,
              ),
            ),
            ListTile(
              title: Text("Circulars"),
              leading: Image.asset(
                'Images/circular2.png',
                scale: 2.0,
              ),
            ),
            ListTile(
              title: Text("About"),
              leading: Image.asset(
                'Images/about.png',
                scale: 1.5,
              ),
            ),
            ListTile(
              title: Text("Contact"),
              leading: Image.asset(
                'Images/contact.png',
                scale: 1.5,
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.black,
            ),
            ListTile(
              title: Text("Privacy-Policy"),
              //leading: Icon(Icons.),
            ),
            ListTile(
              title: Text("Contact Developer"),
              //leading: Icon(Icons.developer_board),
            ),
            Divider(
              height: 2.0,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.clear();
                signOut(context);
              },
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String getname = preferences.getString("Name");
    String getemail = preferences.getString("E-mail");
    setState(() {
      name = getname;
      email = getemail;
    });
  }
}
