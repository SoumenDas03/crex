// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';

// ignore: camel_case_types
class football_home extends StatefulWidget {
  const football_home({super.key});

  @override
  State<football_home> createState() => _football_homeState();
}

// ignore: camel_case_types
class _football_homeState extends State<football_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/football.png',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/background.jpeg",
                    ),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      DefaultTabController(
                        length: 4,
                        child: Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 10),
                          width: 340,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF4D00),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: TabBar(
                                labelPadding: EdgeInsets.all(5),
                                indicator: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25)),
                                unselectedLabelColor: Colors.white,
                                labelColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: ('Live'),
                                  ),
                                  Tab(
                                    text: ('Today'),
                                  ),
                                  Tab(
                                    text: ('Upcoming'),
                                  ),
                                  Tab(
                                    text: ('Finished'),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20, top: 10),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50)),
                                        child: Container(
                                          height: 60,
                                          width: 330,
                                          color: Colors.white,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    'assets/germany.jpeg'),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'GER',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 55,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '2 - 1',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    '00:38:50',
                                                    style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 55,
                                              ),
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    'assets/portugal.jpeg'),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'POR',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15)),
                                        child: Container(
                                          height: 35,
                                          width: 300,
                                          color: Colors.white,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'GER',
                                                style: TextStyle(
                                                    color: Color(0xFFFF4D00),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 22,
                                                  width: 42,
                                                  color: Colors.black54,
                                                  child: Text(
                                                    '96',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 22,
                                                  width: 42,
                                                  color: Colors.black12,
                                                  child: Text(
                                                    '22',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Image.asset(
                                                "assets/live_tv.png",
                                                scale: 1.3,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
