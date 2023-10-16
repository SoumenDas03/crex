// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class team_Ranking extends StatefulWidget {
  const team_Ranking({super.key});

  @override
  State<team_Ranking> createState() => _team_RankingState();
}

// ignore: camel_case_types
class _team_RankingState extends State<team_Ranking> {
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
      child: Column(
        children: [
          DefaultTabController(
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
                  height: 25,
                ),
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(left: 0),
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
                        width: 100,
                        // ignore: prefer_const_constructors
                        child: Container(
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.only(left: 10),
                          // ignore: prefer_const_constructors
                          child: Text(
                            "Team",
                            // ignore: prefer_const_constructors
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 5,
                      ),

                      Container(
                        width: 60,

                        alignment: Alignment.center,
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Matches",
                          // ignore: prefer_const_constructors
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 5,
                      ),

                      Container(
                        width: 50,

                        alignment: Alignment.center,
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Points",
                          // ignore: prefer_const_constructors
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 10,
                      ),

                      Container(
                        width: 50,

                        alignment: Alignment.center,

                        // ignore: prefer_const_constructors
                        child: Text(
                          "Ratings",
                          // ignore: prefer_const_constructors
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: TabBarView(
                    children: [
                      //ODI
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.6,
                            // ignore: prefer_const_constructors

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 5),
                                itemCount: 25,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                                            width: 100,
                                            // ignore: prefer_const_constructors
                                            child: Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                // ignore: prefer_const_constructors
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.blueGrey,
                                                    radius: 12,
                                                    // ignore: prefer_const_constructors
                                                    child: Image.asset(
                                                        "assets/india.png")),
                                                // ignore: prefer_const_constructors
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                // ignore: prefer_const_constructors
                                                Text(
                                                  "IND",
                                                  // ignore: prefer_const_constructors
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                // ignore: prefer_const_constructors
                                              ],
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Container(
                                            width: 55,
                                            alignment: Alignment.center,
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "23",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 5,
                                          ),

                                          Container(
                                            width: 50,

                                            alignment: Alignment.center,
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "2670",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Container(
                                            width: 50,

                                            alignment: Alignment.center,

                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "116",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),

                      //T20

                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.6,
                            // ignore: prefer_const_constructors

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 5),
                                itemCount: 25,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                                            width: 100,
                                            // ignore: prefer_const_constructors
                                            child: Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                // ignore: prefer_const_constructors
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.blueGrey,
                                                    radius: 12,
                                                    // ignore: prefer_const_constructors
                                                    child: Image.asset(
                                                        "assets/india.png")),
                                                // ignore: prefer_const_constructors
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                // ignore: prefer_const_constructors
                                                Text(
                                                  "IND",
                                                  // ignore: prefer_const_constructors
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                // ignore: prefer_const_constructors
                                              ],
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Container(
                                            width: 55,
                                            alignment: Alignment.center,
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "23",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 5,
                                          ),

                                          Container(
                                            width: 50,

                                            alignment: Alignment.center,
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "2670",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Container(
                                            width: 50,

                                            alignment: Alignment.center,

                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "116",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),

                      //Test
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.6,
                            // ignore: prefer_const_constructors

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 5),
                                itemCount: 25,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                                            width: 100,
                                            // ignore: prefer_const_constructors
                                            child: Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                // ignore: prefer_const_constructors
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.blueGrey,
                                                    radius: 12,
                                                    // ignore: prefer_const_constructors
                                                    child: Image.asset(
                                                        "assets/india.png")),
                                                // ignore: prefer_const_constructors
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                // ignore: prefer_const_constructors
                                                Text(
                                                  "IND",
                                                  // ignore: prefer_const_constructors
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                // ignore: prefer_const_constructors
                                              ],
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Container(
                                            width: 55,
                                            alignment: Alignment.center,
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "23",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 5,
                                          ),

                                          Container(
                                            width: 50,

                                            alignment: Alignment.center,
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "2670",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          SizedBox(
                                            width: 10,
                                          ),

                                          Container(
                                            width: 50,

                                            alignment: Alignment.center,

                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "116",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
