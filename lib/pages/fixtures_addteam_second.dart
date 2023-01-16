// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class fixtures_addteam_second extends StatefulWidget {
  const fixtures_addteam_second({super.key});

  @override
  State<fixtures_addteam_second> createState() =>
      _fixtures_addteam_secondState();
}

class _fixtures_addteam_secondState extends State<fixtures_addteam_second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFF4D00),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 325,
            height: 50,
            child: DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TabBar(
                    labelPadding: EdgeInsets.all(5),
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.black,
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      Text(
                        "Cricket",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Football",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Tennis",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/background.jpeg",
          ),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            DefaultTabController(
              initialIndex: 1,
              length: 3,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,

                    margin: EdgeInsets.only(left: 20),
                    // alignment: Alignment.center,

                    width: 200,
                    height: 45,

                    child: TabBar(
                        indicatorColor: Color(0xFFFF4D00),
                        indicatorWeight: 2,
                        // indicatorSize: TabBarIndicatorSize.label,
                        // padding: EdgeInsets.only(right: 2),

                        labelPadding: EdgeInsets.all(0),
                        unselectedLabelColor: Colors.white,
                        labelColor: Color(0xFFFF4D00),
                        labelStyle: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                        // ignore: prefer_const_literals_to_create_immutables
                        tabs: [
                          Tab(
                            text: ('Day'),
                          ),
                          Tab(
                            text: ('Series'),
                          ),
                          Tab(
                            text: ('My Team'),
                          ),
                        ]),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset("assets/three_line.png"))
                ],
              ),
            ),
            Container(
              height: 1,
              width: 350,
              color: Colors.greenAccent,
            ),
            DefaultTabController(
              length: 7,
              child: Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                alignment: Alignment.center,
                //margin: EdgeInsets.only(left: 10),
                width: 320,
                height: 45,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),

                child: TabBar(
                    indicatorColor: Color(0xFFFF4D00),
                    indicatorWeight: 3,
                    // indicatorSize: TabBarIndicatorSize.label,

                    padding: EdgeInsets.only(right: 10),
                    labelPadding: EdgeInsets.all(0),
                    unselectedLabelColor: Colors.black,
                    labelColor: Color(0xFFFF4D00),
                    labelStyle:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      Tab(
                        text: ('All'),
                      ),
                      Tab(
                        text: ('Men'),
                      ),
                      Tab(
                        text: ('T20'),
                      ),
                      Tab(
                        text: ('ODI'),
                      ),
                      Tab(
                        text: ('International'),
                      ),
                      Tab(
                        text: ('Test'),
                      ),
                      Tab(
                        text: ('League'),
                      ),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 25, right: 25),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset('assets/india.png'),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                'IND',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              height: 1,
              width: 380,
              color: Color.fromARGB(255, 136, 133, 133),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'This Months',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 120),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // ignore: prefer_const_literals_to_create_immutables
                            stops: [
                              0.4,
                              0.8,
                            ],
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Color.fromARGB(255, 230, 105, 52),
                              Color.fromARGB(255, 222, 68, 2),
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 15, top: 6),
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 16,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 5, top: 6),
                              child: Text(
                                'Calender',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Container(
              height: 290,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 5,
                            width: 330,
                            color: Color.fromARGB(255, 222, 68, 2),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Container(
                                height: 60,
                                width: 330,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    stops: [
                                      0.2,
                                      0.8,
                                    ],
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      Color.fromARGB(255, 108, 101, 101),
                                      Color.fromARGB(255, 81, 80, 80),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/matchlogo 1.png"),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            'Premier League,2022',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 3, right: 18),
                                          child: Text(
                                            '2nd Dec - 18th Dec',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 74,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFFFF4D00),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Row(
                children: [
                  InkWell(
                    onTap: null,
                    child: Container(
                      margin: EdgeInsets.only(left: 17),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/series.png',
                            color: Colors.black,
                            scale: 1.2,
                          ),
                        ),
                        Text(
                          'Series',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/matches.png',
                            color: Colors.black,
                            scale: 1.2,
                          ),
                        ),
                        Text(
                          'Matches',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/fixtures.png',
                            scale: 1.2,
                          ),
                        ),
                        Text(
                          'Fixtures',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/more.png',
                            color: Colors.black,
                            scale: 1.2,
                          ),
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
