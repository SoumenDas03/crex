// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class notification_main extends StatefulWidget {
  const notification_main({super.key});

  @override
  State<notification_main> createState() => _notification_mainState();
}

class _notification_mainState extends State<notification_main> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                ' All Notifications',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: 380,
              color: Colors.orange,
            ),
            Container(
              width: 360,
              color: Color.fromARGB(255, 76, 74, 74),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        ' Allow Notifications',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Switch(
                        activeColor: Colors.blueGrey,
                        activeTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: status1,
                        onChanged: (value) {
                          // ignore: avoid_print
                          print("VALUE : $value");
                          setState(() {
                            status1 = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        ' Sound',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: 225,
                      ),
                      Switch(
                        activeColor: Colors.blueGrey,
                        activeTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: status2,
                        onChanged: (value) {
                          // ignore: avoid_print
                          print("VALUE : $value");
                          setState(
                            () {
                              status2 = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        ' Vibration',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                      SizedBox(
                        width: 210,
                      ),
                      Switch(
                        activeColor: Colors.blueGrey,
                        activeTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: status3,
                        onChanged: (value) {
                          // ignore: avoid_print
                          print("VALUE : $value");
                          setState(
                            () {
                              status3 = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                ' Your Notifications',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: 360,
              color: Colors.orange,
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 70,
              width: 380,
              color: Color.fromARGB(255, 72, 71, 71),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      ' Matches',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              width: 380,
              color: Color.fromARGB(255, 213, 152, 61),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      ' You are not subscribed to any matches',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 70,
              width: 380,
              color: Color.fromARGB(255, 72, 71, 71),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      ' Series',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      // size: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                ' Default Notifications',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: 380,
              color: Colors.orange,
            ),
            Container(
              height: 80,
              width: 380,
              color: Color.fromARGB(255, 72, 71, 71),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          ' Series Updates',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 10),
                        child: Text(
                          'Toss,Match Results,Innings',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Colors.orange,
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 80,
              width: 380,
              color: Color.fromARGB(255, 72, 71, 71),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Text(
                          ' Breaking News',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 10),
                        child: Text(
                          'Never miss a hot cricket news',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Colors.orange,
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
