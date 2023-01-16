

import 'package:flutter/material.dart';

// ignore: camel_case_types
class live_match extends StatefulWidget {
  const live_match({Key? key}) : super(key: key);

  @override
  State<live_match> createState() => _live_matchState();
}

// ignore: camel_case_types
class _live_matchState extends State<live_match> {
  bool status = false;
  bool status1 = false;
  void _show(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadiusDirectional.only(
        //       topStart: Radius.circular(45), topEnd: Radius.circular(45)),
        // ),
        elevation: 5,
        context: ctx,
        builder: (BuildContext context) {
          return SizedBox(
            height: 375,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  // ignore: prefer_const_constructors
                  title: TabBar(
                    // labelColor: Colors.amber,
                    // ignore: prefer_const_constructors
                    indicatorColor: Color(0xFFFF4D00),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      // ignore: prefer_const_constructors
                      Tab(
                        text: "Live Match",
                      ),
                      // ignore: prefer_const_constructors
                      Tab(text: "Series Updates"),
                    ],
                  ),

                  // ignore: prefer_const_literals_to_create_immutables
                  actions: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(10),
                      // ignore: prefer_const_constructors
                      child: Icon(Icons.close),
                    )
                  ],

                  // title: Text('TutorialKart - TabBar & TabBarView'),
                ),
                body: Container(
                  color: Colors.black,
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              Container(
                                // ignore: prefer_const_constructors
                                margin: EdgeInsets.only(left: 25),
                                width: 200,
                                // ignore: prefer_const_constructors
                                child: Text(
                                  "IND vs PAK Notifications",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 75,
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

                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            alignment: Alignment.center,
                            height: 200,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 50,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.only(
                                            left: 20, right: 10, top: 25),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              transform: Matrix4.rotationX(0),
                                              height: 125,
                                              width: 125,
                                              // padding: EdgeInsets.symmetric(
                                              //     vertical: 1, horizontal: 1),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue),
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white38
                                                        .withOpacity(0.5),
                                                    // ignore: prefer_const_constructors
                                                    offset: Offset(0, -5),
                                                    // blurRadius: 5,
                                                    spreadRadius: 1,
                                                  )
                                                ],
                                              ),
                                              child: Container(
                                                // ignore: prefer_const_constructors
                                                margin: EdgeInsets.all(12),
                                                child: Image.asset(
                                                  'assets/tennis_background.jpeg',
                                                ),
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                            Positioned(
                                              bottom: 120,
                                              left: 85,
                                              // ignore: prefer_const_constructors
                                              child: CircleAvatar(
                                                backgroundColor: Colors.amber,
                                                radius: 12,
                                                // ignore: prefer_const_constructors
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // ignore: sized_box_for_whitespace
                                      Container(
                                        width: 100,

                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "Weckets",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              Container(
                                // ignore: prefer_const_constructors
                                margin: EdgeInsets.only(left: 25),
                                width: 200,
                                // ignore: prefer_const_constructors
                                child: Text(
                                  "INDIA tour of PAKISTAN 2022 Notifications",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 75,
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

                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            alignment: Alignment.center,
                            height: 200,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 50,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.only(
                                            left: 20, right: 10, top: 25),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              transform: Matrix4.rotationX(0),
                                              height: 125,
                                              width: 125,
                                              // padding: EdgeInsets.symmetric(
                                              //     vertical: 1, horizontal: 1),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue),
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white38
                                                        .withOpacity(0.5),
                                                    // ignore: prefer_const_constructors
                                                    offset: Offset(0, -5),
                                                    // blurRadius: 5,
                                                    spreadRadius: 1,
                                                  )
                                                ],
                                              ),
                                              child: Container(
                                                // ignore: prefer_const_constructors
                                                margin: EdgeInsets.all(12),
                                                child: Image.asset(
                                                  'assets/tennis_background.jpeg',
                                                ),
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                            Positioned(
                                              bottom: 120,
                                              left: 85,
                                              // ignore: prefer_const_constructors
                                              child: CircleAvatar(
                                                backgroundColor: Colors.amber,
                                                radius: 12,
                                                // ignore: prefer_const_constructors
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 100,

                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "Toss",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                         
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Click'),
          onPressed: () => _show(context),
        ),
      ),
    );
  }
}
