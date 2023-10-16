// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class bowler_Ranking extends StatefulWidget {
  const bowler_Ranking({super.key, required this.link, required this.bowler});
  final String link;
  final String bowler;

  @override
  State<bowler_Ranking> createState() => _bowler_RankingState();
}

// ignore: camel_case_types
class _bowler_RankingState extends State<bowler_Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          image: DecorationImage(
        // ignore: prefer_const_constructors
        image: AssetImage(
          "assets/background.jpeg",
        ),
        fit: BoxFit.fill,
      )),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
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

                  height: 30, width: 75,
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
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 10),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  // ignore: prefer_const_constructors
                  child: Tab(
                    text: ('T 20'),
                  ),
                ),
                // ignore: prefer_const_constructors
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 10),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  // ignore: prefer_const_constructors
                  child: Tab(
                    text: ('TEST'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              // ignore: prefer_const_constructors
              margin: EdgeInsets.only(left: 10),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    "Rank",
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.white70),
                  ),

                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 15,
                  ),
                  // ignore: prefer_const_constructors, sized_box_for_whitespace
                  Container(
                    width: 200,
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Player",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Ratings",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: TabBarView(children: [
                //ODI
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  // ignore: prefer_const_constructors

                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: 1,
                              width: 360,
                              color: Colors.blueGrey,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Container(
                                  alignment: Alignment.center,

                                  width: 40,
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    (index + 1).toString(),
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                // ignore: prefer_const_constructors
                                SizedBox(
                                  width: 10,
                                ),
                                // ignore: prefer_const_constructors, sized_box_for_whitespace
                                Container(
                                  width: 210,

                                  // ignore: prefer_const_constructors
                                  child: Row(
                                    children: [
                                      // ignore: prefer_const_constructors
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        radius: 17,
                                        // ignore: prefer_const_constructors
                                        backgroundImage: NetworkImage(
                                          widget.link),
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // ignore: prefer_const_constructors
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.bowler,
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "India",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),

                                Container(
                                  width: 45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "716",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                //T20
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  // ignore: prefer_const_constructors

                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: 1,
                              width: 360,
                              color: Colors.blueGrey,
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 210,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        radius: 17,
                                        backgroundImage: NetworkImage(
                                            "https://www.mydraw.com/NIMG.axd?i=Shape-Libraries/Clipart/Sports/Basketball/Basketball-Referee.png"),
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // ignore: prefer_const_constructors
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Jasprit Bumrah",
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "India",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "716",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                //Test
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  // ignore: prefer_const_constructors

                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: 1,
                              width: 360,
                              color: Colors.blueGrey,
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 210,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        radius: 17,
                                        backgroundImage: NetworkImage(
                                            "https://www.mydraw.com/NIMG.axd?i=Shape-Libraries/Clipart/Sports/Basketball/Basketball-Referee.png"),
                                      ),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // ignore: prefer_const_constructors
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Jasprit Bumrah",
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "India",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "716",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
