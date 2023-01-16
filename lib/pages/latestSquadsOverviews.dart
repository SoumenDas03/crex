// ignore_for_file: camel_case_types, prefer_const_constructors, dead_code, sized_box_for_whitespace, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class latestSquadsOverViews extends StatefulWidget {
  const latestSquadsOverViews({super.key});

  @override
  State<latestSquadsOverViews> createState() => _latestSquadsOverViewsState();
}

class _latestSquadsOverViewsState extends State<latestSquadsOverViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 5,
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Featured Matches',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 15, right: 10),
                    child: Text(
                      'All Matches >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    height: 70,
                    width: 400,
                    color: Color.fromARGB(255, 43, 42, 42),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 10, left: 10),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/india.png"),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  // width: 28,
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(
                                    top: 5,
                                    left: 10,
                                  ),
                                  child: Text(
                                    'IND',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Container(
                                  width: 40,
                                  margin: EdgeInsets.only(left: 45, top: 10),
                                  child: Text(
                                    'IND Won',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.orange),
                                  ),
                                ),
                                Container(
                                  width: 95,
                                  margin: EdgeInsets.only(left: 50),
                                  child: Text(
                                    '1st ODI by 1 wicket',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 28,
                                      margin: EdgeInsets.only(top: 5, left: 35),
                                      child: Text(
                                        'PAK',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 40,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/pakistan.jpg"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Series Status',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 15, right: 15),
                    child: Text(
                      'See All >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          // ignore: prefer_const_constructors
                          color: Color(0xFFFF4D00),
                          borderRadius: BorderRadius.circular(5)),
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      tabs: [
                        Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 10),

                          height: 30, width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          // ignore: prefer_const_constructors
                          child: Tab(
                            text: ('ODI'),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 10),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          // ignore: prefer_const_constructors
                          child: Tab(
                            text: ('TEST'),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 140,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 76, 75, 75),
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
                                backgroundImage: AssetImage("assets/india.png"),
                                radius: 25,
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
                                  '0 / 3 played',
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
                                backgroundImage:
                                    AssetImage("assets/pakistan.jpg"),
                                radius: 25,
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
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'TEST Series hasnt started yet!',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 11),
                    )
                  ],
                ),
              ),
              /*
              Container(
                margin: EdgeInsets.only(top: 50, left: 18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    height: 60,
                    width: 323,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10,
                          alignment: Alignment.bottomLeft,
                          color: Colors.orange,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Most Runs',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/virat.png'),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'KL Rahul',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 35),
                              child: Text(
                                'INDIA',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25, top: 10),
                              child: Text(
                                '101',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 24),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                'Runs',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 140,
                        width: 160,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Most Wickets',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/virat.png'),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Wickets',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Haris Rauf',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.orange),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'Pakistan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 140,
                        width: 160,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Most Wickets',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/virat.png'),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Wickets',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Haris Rauf',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.orange),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'Pakistan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    height: 65,
                    width: 323,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10,
                          alignment: Alignment.bottomLeft,
                          color: Colors.orange,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Highest Score >',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 4, left: 20),
                                  child: Text(
                                    'KL Rahul',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange,
                                        fontSize: 18),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    'INDIA',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 90, top: 10),
                              child: Text(
                                '101',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 25),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 90),
                              child: Text(
                                'Runs',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    height: 65,
                    width: 323,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10,
                          alignment: Alignment.bottomLeft,
                          color: Colors.orange,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Highest Sixes >',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 4, left: 20),
                                  child: Text(
                                    'KL Rahul',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange,
                                        fontSize: 18),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    'INDIA',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 90, top: 10),
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 25),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 90),
                              child: Text(
                                'Sixes',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              */
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Top Headlines',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 15, right: 15),
                    child: Text(
                      'View All >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                                      color: Color.fromARGB(255, 172, 168, 168),
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
                margin: EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'Team Squads',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          // ignore: prefer_const_constructors
                          color: Color(0xFFFF4D00),
                          borderRadius: BorderRadius.circular(5)),
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      tabs: [
                        Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 10),

                          height: 30, width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          // ignore: prefer_const_constructors
                          child: Tab(
                            text: ('ODI'),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 10),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          // ignore: prefer_const_constructors
                          child: Tab(
                            text: ('TEST'),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                      ]),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        // margin: EdgeInsets.only(left: 30, top: 20),
                        height: 140,
                        width: 140,
                        color: Color.fromARGB(255, 66, 64, 64),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage("assets/india.png"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'INDIA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        // margin: EdgeInsets.only(left: 30, top: 20),
                        height: 140,
                        width: 140,
                        color: Color.fromARGB(255, 66, 64, 64),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("assets/pakistan.jpg"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'PAKISTAN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'Series Info',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 380,
                color: Color.fromARGB(255, 61, 61, 61),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 25),
                          child: Text(
                            'Series ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 90),
                          child: Text(
                            'India tour of Pakistan,2022 ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 104, 104),
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: 320,
                      color: Color.fromARGB(255, 109, 107, 107),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 25),
                          child: Text(
                            'Duration ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 90),
                          child: Text(
                            '27 Nov - 12 Dec,2022 ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 104, 104),
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: 320,
                      color: Color.fromARGB(255, 109, 107, 107),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 25),
                          child: Text(
                            'Duration ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 90),
                          child: Text(
                            '27 Nov - 12 Dec,2022 ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 105, 104, 104),
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
