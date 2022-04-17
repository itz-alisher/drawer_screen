import 'dart:ui';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.profile) {
      //container = ProfilePage();
    } else if (currentPage == DrawerSections.about) {
      //container = AboutPage();
    } else if (currentPage == DrawerSections.appointment) {
      //container = AppointmentPage();
    } else if (currentPage == DrawerSections.message) {
      //container = MessagePage();
    } else if (currentPage == DrawerSections.purchase) {
      //container = PurchasePage();
    } else if (currentPage == DrawerSections.schedule) {
      //container = SchedulePage();
    } else if (currentPage == DrawerSections.cart) {
      //container = CartPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Profile", Icons.account_circle_outlined,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(3, "About Us", Icons.help_outline,
              currentPage == DrawerSections.about ? true : false),
          menuItem(4, "Appointment", Icons.note_add_outlined,
              currentPage == DrawerSections.appointment ? true : false),
          // Divider(),
          menuItem(5, "Message", Icons.message_rounded,
              currentPage == DrawerSections.message ? true : false),
          menuItem(6, "Purchase", Icons.wallet_giftcard_outlined,
              currentPage == DrawerSections.purchase ? true : false),
          // Divider(),
          menuItem(7, "Schedule", Icons.schedule_outlined,
              currentPage == DrawerSections.schedule ? true : false),
          menuItem(8, "My Cart", Icons.shopping_cart_outlined,
              currentPage == DrawerSections.cart ? true : false),
          menuItem(9, "Promotion", Icons.web_outlined,
              currentPage == DrawerSections.promotion ? true : false),
          menuItem(10, "Support", Icons.headphones_outlined,
              currentPage == DrawerSections.support ? true : false),
          menuItem(11, "Settings", Icons.settings_sharp,
              currentPage == DrawerSections.settings ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Container(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.profile;
            } else if (id == 3) {
              currentPage = DrawerSections.about;
            } else if (id == 4) {
              currentPage = DrawerSections.appointment;
            } else if (id == 5) {
              currentPage = DrawerSections.message;
            } else if (id == 6) {
              currentPage = DrawerSections.purchase;
            } else if (id == 7) {
              currentPage = DrawerSections.schedule;
            } else if (id == 8) {
              currentPage = DrawerSections.cart;
            } else if (id == 9) {
              currentPage = DrawerSections.promotion;
            } else if (id == 10) {
              currentPage = DrawerSections.support;
            } else if (id == 11) {
              currentPage = DrawerSections.settings;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  profile,
  about,
  appointment,
  message,
  purchase,
  schedule,
  cart,
  promotion,
  support,
  settings,
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Image.asset('assets/background.jpg', height: 160.0,width: double.infinity,),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 105.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    elevation: 5.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/img.png'),
                    ),
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Jeniffer Winget',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.facebook_outlined),
                          Icon(Icons.whatsapp_outlined),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: <Widget>[
                          Text('+91123412349',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0,
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          Text('jenny@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home Page"),
      ),
    );
  }
}