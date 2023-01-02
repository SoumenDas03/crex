// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class scorecard extends StatefulWidget {
  const scorecard({super.key});

  @override
  State<scorecard> createState() => _scorecardState();
}

// ignore: camel_case_types
class _scorecardState extends State<scorecard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                alignment: Alignment.center,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                  // ignore: prefer_const_constructors
                  image: AssetImage(
                    "assets/background.jpeg",
                  ),
                  fit: BoxFit.cover,
                )),
                child: Column(children: [
                  Container(
                    // ignore: prefer_const_constructors
                    margin: EdgeInsets.only(top: 20),
                    // alignment: Alignment.topLeft,
                    //margin: EdgeInsets.only(left: 10),
                    width: 350,
                    height: 50,

                    // ignore: prefer_const_constructors
                    child: DefaultTabController(
                      initialIndex: 2,
                      length: 6,
                      // ignore: prefer_const_constructors
                      child: TabBar(
                          // ignore: prefer_const_constructors
                          indicatorColor: Color(0xFFFF4D00),
                          // indicatorWeight: 3,
                          // indicatorSize: TabBarIndicatorSize.label,
                          // ignore: prefer_const_constructors
                          padding: EdgeInsets.only(left: 10),
                          // ignore: prefer_const_constructors
                          labelPadding: EdgeInsets.only(right: 0),
                          unselectedLabelColor: Colors.white,
                          // ignore: prefer_const_constructors
                          labelColor: Color(0xFFFF4D00),
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                          // ignore: prefer_const_literals_to_create_immutables
                          tabs: [
                            // ignore: prefer_const_constructors

                            // ignore: prefer_const_constructors
                            Tab(
                              text: ('Commentary'),
                            ),
                            Tab(
                              text: ('Live'),
                            ),
                            Tab(
                              text: ('Scorecard'),
                            ),
                            Tab(
                              text: ('Graph'),
                            ),
                            Tab(
                              text: ('Series'),
                            ),
                            Tab(
                              text: ('Status'),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 350,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      height: 160,
                      width: 350,
                      color: Colors.blueGrey[900],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 25),
                                child: Icon(
                                  Icons.volume_off,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(right: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage:
                                                AssetImage('assets/india.png'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                'IND',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '29-0',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '1st inn',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '2.3',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Text(
                                    '4',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                        fontSize: 50),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 2,
                              width: 400,
                              color: Colors.blueGrey[500],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CCR : ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.5),
                                ),
                                Text(
                                  '9.58',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.5),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'RRR : ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.5),
                                ),
                                Text(
                                  '8.58',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.5),
                                ),
                                SizedBox(
                                  width: 75,
                                ),
                                Image.asset(
                                  'assets/live_tv.png',
                                  width: 75,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Over 18',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '4',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '4',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '=',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.blueGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Over 19',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '4',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5,
                              child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '=',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '6',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  DefaultTabController(
                    // initialIndex: 0,
                    length: 2,
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
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              // ignore: prefer_const_constructors
                              Tab(
                                text: ('IND 1st Innings'),
                              ),
                              // ignore: prefer_const_constructors
                              Tab(
                                text: ('PAK 1st Innings'),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 1,
                    width: 360,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Batter',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 135,
                          ),
                          Text(
                            'R',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'B',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '4s',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '6s',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'SR',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 160,
                                child: Text(
                                  'Rohit Sharma (Captain)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '19',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '7',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '89.98',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // ignore: sized_box_for_whitespace
                                Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      child: Text(
                                        'Shikhar Dhawan',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Icon(Icons.sports_cricket)
                                  ],
                                ),

                                SizedBox(
                                  width: 10,
                                ),

                                Text(
                                  '10',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),

                                SizedBox(
                                  width: 15,
                                ),

                                Text(
                                  '8',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),

                                SizedBox(
                                  width: 25,
                                ),

                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),

                                SizedBox(
                                  width: 30,
                                ),

                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),

                                SizedBox(
                                  width: 15,
                                ),

                                Text(
                                  '49.98',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 1.5,
                          width: 350,
                          color: Colors.white54,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "P'ship : 58(30)",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]))));
  }
}
