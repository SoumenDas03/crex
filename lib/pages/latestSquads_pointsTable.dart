// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class latestSquads_pointsTable extends StatefulWidget {
  const latestSquads_pointsTable({super.key});

  @override
  State<latestSquads_pointsTable> createState() =>
      _latestSquads_pointsTableState();
}

class _latestSquads_pointsTableState extends State<latestSquads_pointsTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
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
                        'assets/virat.png',
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
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'ODI Matches',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 125,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 79, 78, 78),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40, top: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage("assets/india.png"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2, top: 5),
                                  child: Text(
                                    'INDIA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50, top: 15),
                            child: Column(
                              children: [
                                Text(
                                  '0 - 0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2, top: 5),
                                  child: Text(
                                    '7/7 played',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40, top: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage("assets/india.png"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2, top: 5),
                                  child: Text(
                                    'PAKISTAN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        width: 350,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1st Test is live now.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'TEST Matches',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 125,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 79, 78, 78),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40, top: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage("assets/india.png"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2, top: 5),
                                  child: Text(
                                    'INIA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50, top: 15),
                            child: Column(
                              children: [
                                Text(
                                  '0 - 0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2, top: 5),
                                  child: Text(
                                    '7/7 played',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40, top: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage("assets/india.png"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2, top: 5),
                                  child: Text(
                                    'PAKISTAN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        width: 350,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1st Test is live now.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 11),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'WTC 2021 -23 points Table',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: 350,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 54,
                    width: 350,
                    color: Color(0xFFFF4D00),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          child: Text(
                            'Team',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 45,
                          child: Text(
                            'Series',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          child: Text(
                            'P',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          child: Text(
                            'W',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          child: Text(
                            'L',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          child: Text(
                            'T',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          child: Text(
                            'D',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          child: Text(
                            'NRR',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          child: Text(
                            'Pts',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'PCT%',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundImage:
                                          AssetImage("assets/india.png"),
                                    ),
                                    SizedBox(
                                      width: 2.5,
                                    ),
                                    Text(
                                      'IND',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Text(
                                  '26',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  '60',
                                  style: TextStyle(
                                      color: Color(0xFFFF4D00),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 1,
                            width: 350,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
