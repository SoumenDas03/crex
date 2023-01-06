// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';

class fantasypage extends StatefulWidget {
  const fantasypage({super.key});

  @override
  State<fantasypage> createState() => _fantasypageState();
}

class _fantasypageState extends State<fantasypage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpeg',
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: 380,
                  color: Colors.white,
                ),
                Container(
                  height: 90,
                  width: 380,
                  color: Color.fromARGB(255, 33, 33, 33),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 30),
                        child: Image.asset('assets/india.png'),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 30),
                            child: Text(
                              'IND',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text(
                              '29-0',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 32),
                            child: Text(
                              '1st inn',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              '2.3',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 20),
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 45, top: 15),
                          child: Image.asset('assets/volume.png'))
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Color.fromARGB(255, 105, 104, 104),
                ),
                Container(
                  height: 35,
                  width: 380,
                  color: Color.fromARGB(255, 33, 33, 33),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'CRR : 9.58',
                          style: TextStyle(
                              color: Color.fromARGB(255, 208, 206, 206),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 55),
                        child: Text(
                          'RRR : 8.58',
                          style: TextStyle(
                              color: Color.fromARGB(255, 209, 208, 208),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Image.asset(
                          'assets/live_tv.png',
                          scale: 1.2,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 6),
                      child: Text(
                        'Over 2',
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 175, 175),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 9),
                      child: Text(
                        '= 10',
                        style: TextStyle(
                            color: Color.fromARGB(255, 201, 200, 200),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 8),
                      height: 15,
                      width: 1,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 10),
                      child: Text(
                        'Over 3',
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 175, 175),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 9),
                      child: Text(
                        '= 6',
                        style: TextStyle(
                            color: Color.fromARGB(255, 201, 200, 200),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 9, left: 20),
                      child: Text(
                        'Top Fantasy Points',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, left: 10),
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, left: 8),
                      child: Text(
                        'LIVE',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150, top: 6),
                      child: Text(
                        'See All  >',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 600,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/virat.jpg',
                                scale: 4,
                              ),
                              Column(
                                children: [
                                  Positioned(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 55, top: 12),
                                      child: Text(
                                        'Virat',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 56),
                                      child: Text(
                                        '200.0',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 50),
                                      child: Text(
                                        'pts',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 240),
                  child: Text(
                    'Match Updates',
                    style: TextStyle(color: Colors.white),
                  ),
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
                    itemCount: 2,
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
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Good news!Pakistan-india test match to commence today',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'Player Stats in Series',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 150),
                      child: Text(
                        'Analysis >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 14, top: 15),
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Fantasy Points',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14, top: 15),
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Most Runs',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14, top: 15),
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Most Wickets',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          width: 330,
                          color: Colors.white,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 28, top: 15),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 8, top: 13),
                                      child: Text(
                                        'Zak Crawley',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      margin:
                                          EdgeInsets.only(left: 140, top: 13),
                                      child: Text(
                                        '155 pts',
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'PAK.Batter',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 140),
                                      child: Text(
                                        '1Inns',
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'Fantasy Top Picks',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 170),
                      child: Text(
                        'See All >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 140,
                  width: 320,
                  color: Color.fromARGB(255, 25, 25, 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 17, top: 15),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Oliver Edward Robinson',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset(
                              'assets/pakistan.jpg',
                              scale: 6,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 65),
                            child: Text(
                              'Bowfer',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text(
                              'Pakistan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 340,
                        color: Colors.white,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, top: 20),
                            child: Text(
                              'Test Recent Form >',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            height: 35,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  '158(168)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'vs SA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            height: 35,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  '158(168)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'vs SA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            height: 35,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  '158(168)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'vs SA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 140,
                  width: 320,
                  color: Color.fromARGB(255, 46, 45, 45),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 17, top: 15),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Oliver Edward Robinson',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset(
                              'assets/pakistan.jpg',
                              scale: 6,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 65),
                            child: Text(
                              'Bowfer',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text(
                              'Pakistan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 340,
                        color: Colors.white,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, top: 20),
                            child: Text(
                              'Test Recent Form >',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            height: 35,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  '158(168)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'vs SA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            height: 35,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  '158(168)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'vs SA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            height: 35,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  '158(168)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'vs SA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(left: 30, top: 30),
                //       child: Text(
                //         'Team Analysis',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ),
                //     Container(
                //       margin: EdgeInsets.only(left: 5, top: 33),
                //       child: Text(
                //         '(Bested on Last 5 matches)',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 10,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: 150,
                //   width: 320,
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(5)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
