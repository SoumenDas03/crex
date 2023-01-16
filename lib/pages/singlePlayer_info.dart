// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class singlePlayer_info extends StatefulWidget {
  const singlePlayer_info({super.key});

  @override
  State<singlePlayer_info> createState() => _singlePlayer_infoState();
}

class _singlePlayer_infoState extends State<singlePlayer_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
              Container(
                margin: EdgeInsets.only(top: 50, left: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/virat.jpg"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Virat Kohli',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              'Age: ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 189, 184, 184),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '34 year ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 189, 184, 184),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Runs : ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 189, 184, 184),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6, top: 3),
                              child: Text(
                                '8074 ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 184, 184),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Strike Rate : ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 189, 184, 184),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '143 ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 189, 184, 184),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
                children: [
                  DefaultTabController(
                    length: 4,
                    child: Container(
                      height: 45,

                      // ignore: prefer_const_constructors
                      child: TabBar(
                        labelStyle: TextStyle(fontSize: 12),
                        labelPadding: EdgeInsets.only(right: 10),

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 30),
                    child: Text(
                      'Virat Kohli Info',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 30, right: 10),
                    child: Text(
                      'Player Info >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28, top: 30),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100, top: 30),
                    child: Text(
                      'Virat Kohli',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28, top: 10),
                    child: Text(
                      'Age :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 118, top: 10),
                    child: Text(
                      '34 year',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28, top: 10),
                    child: Text(
                      'DOB :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 115, top: 10),
                    child: Text(
                      '05 Nov 1988',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28, top: 10),
                    child: Text(
                      'Height :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100, top: 10),
                    child: Text(
                      '5.7"',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28, top: 10),
                    child: Text(
                      'Nationality :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 75, top: 10),
                    child: Text(
                      'Indian',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 380,
                color: Color.fromARGB(255, 54, 53, 53),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, top: 25),
                          child: Text(
                            'Role :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, top: 25),
                          child: Text(
                            'Batter',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, top: 25),
                          child: Text(
                            'Bats :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, top: 25),
                          child: Text(
                            'right handed',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, top: 25),
                          child: Text(
                            'Bowl :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, top: 25),
                          child: Text(
                            'Lorem Ipsum Dolor Sit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: 320,
                color: Color.fromARGB(255, 54, 53, 53),
                child: Container(
                  margin: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/twitter.png"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 125,
                    child: Text(
                      'demo@twitter.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 3.5,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/instagram.png"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 125,
                    child: Text(
                      'demo@insta.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
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
    );
  }
}
