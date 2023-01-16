// ignore_for_file: prefer_const_constructors, camel_case_types, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class latestSquads_matches extends StatefulWidget {
  const latestSquads_matches({super.key});

  @override
  State<latestSquads_matches> createState() => _latestSquads_matchesState();
}

class _latestSquads_matchesState extends State<latestSquads_matches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 5,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpeg',
                  ),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high),
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
                      // ignore: sized_box_for_whitespace
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
                  color: Color.fromARGB(255, 108, 105, 105),
                ),
                DefaultTabController(
                  length: 4,
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 8),
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
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 15),
                          child: Text(
                            '10 Dec 2022,Saturday',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 14, top: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Opacity(
                              opacity: 0.8,
                              child: Container(
                                height: 120,
                                width: 330,
                                color: Colors.blueGrey[900],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        '3rd ODI, Melbourne Cricket Ground,Australia',
                                        style: TextStyle(
                                            color: Color(0xFFFF4D00),
                                            fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),

                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundImage: AssetImage(
                                                        'assets/india.png'),
                                                  ),
                                                ),
                                                Container(
                                                  width: 125,
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 10),
                                                  child: Text(
                                                    'INDIA',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'assets/pakistan.jpg'),
                                                  ),
                                                ),
                                                Container(
                                                  width: 125,
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 10),
                                                  child: Text(
                                                    'PAKISTAN',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 5, top: 13),
                                          height: 60,
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 30),
                                                  child: Text(
                                                    'Starts from',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 50, top: 30),
                                                  child: Icon(
                                                    Icons.notifications,
                                                    color: Color.fromARGB(
                                                        255, 73, 157, 226),
                                                    size: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 18),
                                              child: Text(
                                                '11:30 AM',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 18),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       margin: EdgeInsets.only(left: 10, top: 10),
                                    //       child: CircleAvatar(
                                    //         radius: 10,
                                    //         backgroundImage: AssetImage('assets/indialogo.png'),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       margin: EdgeInsets.only(left: 5, top: 10),
                                    //       child: Text(
                                    //         'PAK',
                                    //         style: TextStyle(color: Colors.white, fontSize: 11),
                                    //       ),
                                    //     ),

                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
