// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: camel_case_types
class matches_players extends StatefulWidget {
  const matches_players({super.key});

  @override
  State<matches_players> createState() => _matches_playersState();
}

// ignore: camel_case_types
class _matches_playersState extends State<matches_players> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpeg',
                  ),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high),
            ),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/players.png'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage("assets/india.png"),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: const Text(
                      'INDIA',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 45,
                    child: DefaultTabController(
                      initialIndex: 1,
                      length: 5,
                      child: TabBar(
                        labelStyle: TextStyle(fontSize: 12),
                        labelPadding: EdgeInsets.only(right: 10),
                        indicatorPadding: EdgeInsets.only(
                            left: 5, top: 5, bottom: 5, right: 5),
                        indicatorColor: Color(0xFFFF4D00),
                        labelColor: Color(0xFFFF4D00),
                        unselectedLabelColor: Colors.white,
                        // indicator: BoxDecoration(
                        //   color: Color.fromARGB(255, 41, 39, 39),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(20),
                        //   ),
                        // ),
                        // ignore: prefer_const_literals_to_create_immutables
                        tabs: [
                          Tab(
                            text: 'Overview',
                          ),
                          Tab(text: 'matches'),
                          Tab(
                            text: 'Player',
                          ),
                          Tab(
                            text: 'News',
                          ),
                          Tab(
                            text: 'Info',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                width: 350,
                color: Colors.white,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 15),
                              height: 45,
                              width: 40,
                              child: Image.asset(
                                'assets/matchlogo 1.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 180,
                                          margin: EdgeInsets.only(
                                              left: 10, top: 14),
                                          child: Text(
                                            'PAK vs IND 2022',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          margin:
                                              EdgeInsets.only(left: 10, top: 6),
                                          child: Text(
                                            '15 Apr - 7 may',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 12, left: 50),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          width: 350,
                          color: Colors.white,
                        ),
                      ],
                    );
                  }),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Opacity(
                        opacity: 0.8,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5, left: 8, right: 8),
                          height: 125,
                          width: 300,
                          color: Colors.blueGrey[900],
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 230,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 15, top: 8),
                                    child: Text(
                                      '20th Test, ',
                                      style: TextStyle(
                                          fontSize: 12.5, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Icon(
                                    Icons.notifications,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 225,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, left: 25),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    "assets/india.png"),
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                child: Text(
                                                  'INDIA',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 225,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, left: 25),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    "assets/pakistan.jpg"),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Text(
                                                'PAKISTAN',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 60,
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 45,
                                        margin: EdgeInsets.only(left: 30),
                                        child: Text(
                                          '08:00 PM',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        width: 45,
                                        margin:
                                            EdgeInsets.only(left: 30, top: 3),
                                        child: Text(
                                          '13 Apr',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }
}
