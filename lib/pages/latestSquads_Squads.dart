// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class latestSquards_squards extends StatefulWidget {
  const latestSquards_squards({super.key});

  @override
  State<latestSquards_squards> createState() => _latestSquards_squardsState();
}

class _latestSquards_squardsState extends State<latestSquards_squards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background.jpeg",
                ),
                fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          'IND vs PAK,2022',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 246, 242, 242)),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6, left: 20),
                            child: Text(
                              '06 Dec to 24 Dec 2022',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 246, 242, 242)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 120),
                    child: Image.asset(
                      'assets/matchlogo 1.png',
                      height: 60,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 45,

                      // ignore: prefer_const_constructors
                      child: TabBar(
                        labelStyle: TextStyle(fontSize: 12),
                        labelPadding: EdgeInsets.only(right: 10),
                        indicatorPadding: EdgeInsets.only(
                            left: 5, top: 5, bottom: 5, right: 5),
                        indicatorColor: Colors.black,
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
                          Tab(text: 'Matches'),
                          Tab(
                            text: 'Squads',
                          ),
                          Tab(
                            text: 'Points Table',
                          ),
                          Tab(
                            text: 'News',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: 380,
                color: Color.fromARGB(255, 92, 90, 90),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'ODI Matches',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 325,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Color.fromARGB(255, 39, 38, 38),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/india.png'),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      'INDIA',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 246, 242, 242)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 190, top: 14),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 325,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Color.fromARGB(255, 39, 38, 38),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/pakistan.jpg'),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      'PAKISTAN',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 246, 242, 242)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 160, top: 14),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: 380,
                color: Color.fromARGB(255, 92, 90, 90),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'TEST Matches',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 325,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Color.fromARGB(255, 39, 38, 38),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/india.png'),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      'INDIA',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 246, 242, 242)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 190, top: 14),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 325,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Color.fromARGB(255, 39, 38, 38),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/pakistan.jpg'),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      'PAKISTAN',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 246, 242, 242)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 160, top: 14),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: 380,
                color: Color.fromARGB(255, 92, 90, 90),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
