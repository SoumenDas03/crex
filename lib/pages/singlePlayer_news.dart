// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class singlePlayer_news extends StatefulWidget {
  const singlePlayer_news({super.key});

  @override
  State<singlePlayer_news> createState() => _singlePlayer_newsState();
}

class _singlePlayer_newsState extends State<singlePlayer_news> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                DefaultTabController(
                  length: 4,
                  child: SizedBox(
                    height: 45,
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 12),
                      labelPadding: EdgeInsets.only(right: 10),
                      indicatorPadding:
                          EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
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
                ),
              ],
            ),
            Container(
              height: 1,
              width: 380,
              color: Colors.white,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: 250,
                        width: 320,
                        color: Color.fromARGB(255, 50, 49, 49),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 335,
                              child: Image.asset(
                                'assets/cricket3.jpg',
                                fit: BoxFit.fill,
                                scale: 5,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 5),
                              child: Text(
                                'Good news!Pakistan-india test match to commence today',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 3),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '2 sep, 2022',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
    );
  }
}
