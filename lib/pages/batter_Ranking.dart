// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class batter_Ranking extends StatefulWidget {
  const batter_Ranking({super.key});

  @override
  State<batter_Ranking> createState() => _batter_RankingState();
}

// ignore: camel_case_types
class _batter_RankingState extends State<batter_Ranking> {
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Icon(Icons.arrow_back, color: Colors.white),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 10,
              ),
              // ignore: prefer_const_constructors
              Text(
                "ICC Men's Ranking",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 15,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            // ignore: prefer_const_constructors

            // alignment: Alignment.topLeft,
            //margin: EdgeInsets.only(left: 10),
            width: 350,
            height: 50,

            // ignore: prefer_const_constructors
            child: DefaultTabController(
              initialIndex: 1,
              length: 4,
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
                  labelStyle:
                      // ignore: prefer_const_constructors
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    // ignore: prefer_const_constructors

                    // ignore: prefer_const_constructors
                    Tab(
                      text: ('Team'),
                    ),
                    // ignore: prefer_const_constructors
                    Tab(
                      text: ('Batter'),
                    ),
                    // ignore: prefer_const_constructors
                    Tab(
                      text: ('Bowler'),
                    ),
                    // ignore: prefer_const_constructors
                    Tab(
                      text: ('All Rounder'),
                    ),
                  ]),
            ),
          ),
          Container(
            height: 1,
            width: 350,
            color: Colors.blueGrey,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 25,
          ),
          DefaultTabController(
            length: 3,
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
                ]),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 25,
          ),
          Container(
            height: 1,
            width: 360,
            color: Colors.blueGrey,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 25,
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
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 10,
                ),

                Container(
                  alignment: Alignment.topRight,
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

          // ignore: prefer_const_constructors
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: 360,
            color: Colors.blueGrey,
          ),
          // ignore: prefer_const_constructors

          SizedBox(
            height: 450,
            // ignore: prefer_const_constructors

            child: ListView.builder(
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Container(
                            alignment: Alignment.center,

                            width: 40,
                            // ignore: prefer_const_constructors
                            child: Text(
                              "1",
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
                                  radius: 12,
                                  // ignore: prefer_const_constructors
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  width: 15,
                                ),
                                // ignore: prefer_const_constructors
                                Text(
                                  "Virat Kohli",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // ignore: prefer_const_constructors
                                  margin: EdgeInsets.only(top: 5),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "India",
                                    style:
                                        // ignore: prefer_const_constructors
                                        TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 5,
                          ),

                          Container(
                            width: 45,

                            alignment: Alignment.center,
                            // ignore: prefer_const_constructors
                            child: Text(
                              "716",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 1,
                        width: 360,
                        color: Colors.blueGrey,
                      )
                    ],
                  );
                }),
          ),
        ]),
      ),
    ));
  }
}
