import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';

// ignore: camel_case_types
class fixtures_pin extends StatefulWidget {
  const fixtures_pin({super.key});

  @override
  State<fixtures_pin> createState() => _fixtures_pinState();
}

// ignore: camel_case_types
class _fixtures_pinState extends State<fixtures_pin> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              image: DecorationImage(
                  // ignore: prefer_const_constructors
                  image: AssetImage(
                    "assets/background.jpeg",
                  ),
                  fit: BoxFit.fill)),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 150,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        height: 90,
                        width: 150,
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(0.06),
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            // ignore: prefer_const_constructors
                            border: Border.all(color: Color(0xFFFF4D00)),
                            color: Colors.white,
                            // ignore: prefer_const_constructors
                            borderRadius: BorderRadius.only(
                                // ignore: prefer_const_constructors
                                bottomLeft: Radius.circular(25),
                                // ignore: prefer_const_constructors
                                bottomRight: Radius.circular(15))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // ignore: prefer_const_constructors
                                margin: EdgeInsets.only(left: 25, top: 10),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "247-8",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 18,
                                              color: Colors.purple),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "46.4",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          // ignore: prefer_const_constructors
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundImage:
                                                // ignore: prefer_const_constructors
                                                AssetImage("assets/india.png"),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 5,
                                          ),
                                          // ignore: prefer_const_constructors
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundImage:
                                                // ignore: prefer_const_constructors
                                                AssetImage("assets/india.png"),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 5,
                              ),
                              // ignore: sized_box_for_whitespace
                              Container(
                                // ignore: prefer_const_constructors
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                width: 100,
                                // ignore: prefer_const_constructors
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "IND need 32 runs in 20 balls",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black38),
                                ),
                              )
                            ])),
                    Positioned(
                      bottom: 75,
                      left: 75,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 75,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            // ignore: prefer_const_constructors
                            borderRadius: BorderRadius.only(
                              // ignore: prefer_const_constructors
                              topLeft: Radius.circular(15),
                              // ignore: prefer_const_constructors
                              bottomLeft: Radius.circular(15),
                              // ignore: prefer_const_constructors
                              topRight: Radius.circular(15),
                            ),
                            // ignore: prefer_const_constructors
                            color: Color(0xFFFF4D00)),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "SIX",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,

                  height: 50,
                  width: 250,
                  // ignore: prefer_const_constructors
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enjoy LIVE Scores while multitasking Allow to display",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),

                Container(
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back)),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 25,
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              "Display over other apps",
                              // ignore: prefer_const_constructors
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 300,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                              color: Colors.blueGrey[50],
                              height: 50,
                              width: 50,
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  "LOGO",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                // ignore: prefer_const_constructors
                                Text(
                                  "Version 19.8.1",
                                  style:
                                      // ignore: prefer_const_constructors
                                      TextStyle(
                                          fontSize: 10, color: Colors.black45),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 300,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              "Draw over other apps",
                              // ignore: prefer_const_constructors
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 80,
                            ),
                            Switch(
                              activeColor: Colors.blueGrey,
                              activeTrackColor: Colors.grey,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              value: status,
                              onChanged: (value) {
                                // ignore: avoid_print
                                print("VALUE : $value");
                                setState(() {
                                  status = value;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 35,
                ),

                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          // ignore: prefer_const_constructors
                          minimumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //border radius equal to or more than 50% of width
                          )),
                      onPressed: () {},
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Continue",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),

                // ignore: prefer_const_constructors
                Text(
                  "Not Now",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ])),
    );
  }
}
