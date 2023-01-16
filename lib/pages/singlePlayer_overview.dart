// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';

class singlePlayer_overview extends StatefulWidget {
  const singlePlayer_overview({super.key});

  @override
  State<singlePlayer_overview> createState() => _singlePlayer_overviewState();
}

class _singlePlayer_overviewState extends State<singlePlayer_overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background.jpeg",
                ),
                fit: BoxFit.fill),
          ),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 50),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/virat.jpg"),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25, top: 50),
                          child: Text(
                            'Virat Kohli',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 3),
                              child: Text(
                                'Age: ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 3),
                              child: Text(
                                '34 year ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25, top: 3),
                              child: Text(
                                'Total Runs : ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 3),
                              child: Text(
                                '8074 ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 3),
                              child: Text(
                                'Strike Rate',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 3),
                              child: Text(
                                '143 ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 45,

                        // ignore: prefer_co
                        //
                        //
                        // nst_constructors
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
                              text: 'News',
                            ),
                            Tab(
                              text: 'Playes Info',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Colors.white,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 30, top: 25),
                        child: Image.asset('assets/matches.png')),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 25),
                      child: Text(
                        'Right handed Batter',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: EdgeInsets.only(left: 12, top: 8),
                          child: Text(
                            '# 25 Batter in Test',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: EdgeInsets.only(left: 9, top: 8),
                          child: Text(
                            '# 76 All Rounder in Test',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 10),
                      child: Text(
                        'Recent Form(last played on01 Nov)',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 28, left: 10),
                      child: Text(
                        'See More >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 60,
                            width: 80,
                            color: Color.fromARGB(255, 73, 72, 72),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  '18(28)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'vs KPK,F.CLS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 25, left: 20),
                  child: Text(
                    'Batting Career(right handed)',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                DefaultTabController(
                  length: 3,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 10),
                    width: 320,
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
                          // ignore: prefer_const_literals_to_create_immutables
                          tabs: [
                            Tab(
                              text: ('ODI'),
                            ),
                            Tab(
                              text: ('TEST'),
                            ),
                            Tab(
                              text: ('PSL'),
                            ),
                          ]),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 13),
                      height: 90,
                      width: 70,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          Text(
                            '95',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Matches',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 70,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          Text(
                            '176',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Innings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 90,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          Text(
                            '7090',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Runs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 100,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          Text(
                            '408',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Highest Score',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 13),
                      height: 75,
                      width: 70,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            '15',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '100s',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      height: 75,
                      width: 70,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            '35',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '50',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      height: 75,
                      width: 90,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            '49.88',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'SR',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      height: 75,
                      width: 100,
                      color: Color.fromARGB(255, 37, 36, 36),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            '65.98',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Avg',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: 332,
                  color: Color.fromARGB(255, 92, 90, 90),
                ),
                Container(
                  height: 30,
                  width: 332,
                  color: Color.fromARGB(255, 46, 45, 45),
                  child: Center(
                    child: Text(
                      'SHOW MORE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      'Debut: v Pak at Lords,Jun 12 - 20,2020',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Color.fromARGB(255, 92, 90, 90),
                ),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 60,
                    width: 345,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 5),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/virat.jpg'),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                'See All Matches',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    'Series wise,team wise & more',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 70),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Latest Updates',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20, right: 10),
                      child: Text(
                        'View All>',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 100,
                            width: 170,
                            color: Color.fromARGB(255, 50, 49, 49),
                            child: Column(
                              children: [
                                Image.asset('assets/cricket3.jpg'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Rahul power India to win',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Today at 9:35 am',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 172, 168, 168),
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Teams Played for',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 332,
                  color: Color.fromARGB(255, 46, 45, 45),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Text(
                      'Pakistan,Lahore Qalandars,Somerset,Central Punjub,Worcestershire',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 25),
                      child: Text(
                        'Virat Kohli Info',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 30, right: 10),
                      child: Text(
                        'Player Info >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28, top: 30),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 90, top: 30),
                      child: Text(
                        'Virat Kohli',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28, top: 10),
                      child: Text(
                        'Age :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 130, top: 10),
                      child: Text(
                        '34 year',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28, top: 10),
                      child: Text(
                        'DOB :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 130, top: 10),
                      child: Text(
                        '05 Nov 1988',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28, top: 10),
                      child: Text(
                        'Height :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 115, top: 10),
                      child: Text(
                        '5.7"',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28, top: 10),
                      child: Text(
                        'Nationality :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 90, top: 10),
                      child: Text(
                        'Indian',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 280,
                  width: 320,
                  color: Color.fromARGB(255, 54, 53, 53),
                  child: Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/twitter.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 125,
                      child: Text(
                        'demo@twitter.com',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 3.5,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/instagram.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 125,
                      child: Text(
                        'demo@insta.com',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 25),
                  child: DefaultTabController(
                    // initialIndex: 0,
                    length: 2,
                    child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(left: 10),
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TabBar(
                          labelPadding: EdgeInsets.all(8),
                          indicator: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(25)),
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          tabs: [
                            Image.asset(
                              "assets/ball.png",
                              scale: 1,
                            ),
                            Image.asset(
                              "assets/bat.png",
                              scale: 1,
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
