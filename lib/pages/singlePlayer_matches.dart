// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';

class singlePlayer_matches extends StatefulWidget {
  const singlePlayer_matches({super.key});

  @override
  State<singlePlayer_matches> createState() => _singlePlayer_matchesState();
}

class _singlePlayer_matchesState extends State<singlePlayer_matches> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 4,
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
                          margin: EdgeInsets.only(left: 30, top: 50),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTabController(
                      length: 4,
                      child: TabBar(
                          //padding: EdgeInsets.only(right: 70),
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
                              width: 45,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                              // ignore: prefer_const_constructors
                              child: Tab(
                                text: ('ALL'),
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(left: 10),
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                              // ignore: prefer_const_constructors
                              child: Tab(
                                text: ('ODI'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(left: 10),
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                              // ignore: prefer_const_constructors
                              child: Tab(
                                text: ('TEST'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(left: 10),
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                              // ignore: prefer_const_constructors
                              child: Tab(
                                text: ('PLS'),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18, top: 25),
                      height: 50,
                      width: 40,
                      color: Colors.grey,
                      child: Image.asset('assets/matchlogo 1.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20),
                          child: Text(
                            'Royal ODI 2022',
                            style: TextStyle(
                                color: Color.fromARGB(255, 244, 240, 240),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 5),
                              child: Text(
                                '02 Aug - 17 Sep . played for WORCS',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 235, 229, 229),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 15),
                      height: 90,
                      width: 70,
                      color: Color.fromARGB(255, 73, 72, 72),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Wkts',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 80,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 70,
                      color: Color.fromARGB(255, 73, 72, 72),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            '5',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Inns',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 80,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 90,
                      color: Color.fromARGB(255, 73, 72, 72),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 18,
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
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 80,
                      width: 1,
                      color: Color.fromARGB(255, 115, 114, 114),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 90,
                      width: 100,
                      color: Color.fromARGB(255, 73, 72, 72),
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
                            'Strike Rate',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 40,
                          width: 333,
                          color: Color.fromARGB(255, 115, 114, 114),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  'SCORE',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 244, 240, 240),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 60),
                                child: Text(
                                  'DATE',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 244, 240, 240),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 90),
                                child: Text(
                                  'MATCH',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 244, 240, 240),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 333,
                          color: Color.fromARGB(255, 180, 177, 177),
                        ),
                      ],
                    );
                  },
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 18, top: 25),
                              height: 50,
                              width: 40,
                              color: Colors.grey,
                              child: Image.asset('assets/matchlogo 1.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 30, left: 20),
                                  child: Text(
                                    'Royal ODI 2022',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 244, 240, 240),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 5),
                                      child: Text(
                                        '02 Aug - 17 Sep . played for WORCS',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 235, 229, 229),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 70),
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: 380,
                          color: Color.fromARGB(255, 221, 214, 214),
                        ),
                      ],
                    );
                  },
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
