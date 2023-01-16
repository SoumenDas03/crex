// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class squadsinfopage extends StatefulWidget {
  const squadsinfopage({super.key});

  @override
  State<squadsinfopage> createState() => _squadsinfopageState();
}

class _squadsinfopageState extends State<squadsinfopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background.png',
                ),
                fit: BoxFit.cover,
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
                      'assets/virat.png',
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
                            text: 'Matches',
                          ),
                          Tab(text: 'Squads'),
                          Tab(
                            text: 'Points Table',
                          ),
                          Tab(
                            text: 'News',
                          ),
                          Tab(
                            text: 'Info',
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
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Container(
                    height: 220,
                    width: 320,
                    color: Color.fromARGB(255, 44, 44, 44),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30, top: 30),
                              child: Text(
                                'Series',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 175,
                              margin: EdgeInsets.only(left: 50, top: 30),
                              child: Text(
                                'India tour of Pakistan',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          width: 380,
                          color: Color.fromARGB(255, 90, 88, 88),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25, top: 30),
                              child: Text(
                                'Duration',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 175,
                              margin: EdgeInsets.only(left: 50, top: 30),
                              child: Text(
                                '06 Dec to 24 Dec 2022',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          width: 380,
                          color: Color.fromARGB(255, 90, 88, 88),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25, top: 30),
                              child: Text(
                                'Format',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 175,
                              margin: EdgeInsets.only(left: 50, top: 30),
                              child: Text(
                                '3 ODIs, 3Tests',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
