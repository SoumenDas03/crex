// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, duplicate_ignore, use_full_hex_values_for_flutter_colors

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/more.dart';
import 'package:flutter/material.dart';

import 'series.dart';

class fixtures extends StatefulWidget {
  const fixtures({super.key});

  @override
  State<fixtures> createState() => _fixturesState();
}

class _fixturesState extends State<fixtures> {
  @override
  Widget build(BuildContext context) {
    String? selected = "First";
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFF4D00),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 600,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => cricket_home()));
                    setState(() {
                      selected = "First";
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 35,
                      width: 80,
                      color: selected == "First"
                          ? Colors.white
                          : Colors.transparent,
                      child: Container(
                        margin: const EdgeInsets.only(left: 14, top: 8),
                        child: selected == "First"
                            ? const Text(
                                'Cricket',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              )
                            : const Text(
                                'Cricket',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = "Second";
                    });
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => football_home()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 35,
                        width: 80,
                        color: selected == "Second"
                            ? Colors.white
                            : Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(left: 14, top: 8),
                          child: selected == "Second"
                              ? const Text(
                                  'Football',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              : const Text(
                                  'Football',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => tennis_home()));
                    setState(() {
                      selected = "Third";
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 35,
                        width: 80,
                        color: selected == "Third"
                            ? Colors.white
                            : Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(left: 14, top: 8),
                          child: selected == "Third"
                              ? const Text(
                                  'Tennis',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              : const Text(
                                  'Tennis',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ClipRRect(
          child: Container(
            alignment: Alignment.center,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/background.jpeg",
              ),
              fit: BoxFit.cover,
            )),
            child: Column(children: [
              DefaultTabController(
                length: 3,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20, left: 20),
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
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(left: 10),
                  width: 335,
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
                      labelStyle: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
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
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1 Dec 2022',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(45)),
                    child: Container(
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFFFF4D00),
                              Colors.orange,
                              Color(0xFF7A00)
                            ],
                            end: Alignment.bottomRight,
                            stops: [
                              0.4,
                              1,
                              1,
                            ]),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Calender',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: Container(
                            height: 160,
                            width: 400,
                            color: Colors.blueGrey[900],
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25, top: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 230,
                                        child: Text(
                                          '2nd ODI, Pakistan Vs Australia',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Image.asset("assets/pin.png")
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage(
                                                    'assets/australia.jpg'),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'AUSTRALIA',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              SizedBox(
                                                  width: 80,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '289-8',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 8),
                                                        child: Text('48.2',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10)),
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage(
                                                    'assets/pakistan.jpg'),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'PAKISTAN',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: Colors.grey[700],
                                        height: 80,
                                        width: 1,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/live_tv.png')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                width: 400,
                color: Colors.blueGrey,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tomorrow',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 2,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '2 Dec 2022',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 160,
                        width: 400,
                        color: Colors.blueGrey[900],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   margin: EdgeInsets.only(left: 20),
                              //   child: Text(
                              //     'T10 League, Pakistan Vs Australia',
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 15),
                              //   ),
                              // ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 260,
                                    child: Text(
                                      'T10 League, Pakistan Vs Australia',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Image.asset("assets/pin.png")
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundImage: AssetImage(
                                                'assets/australia.jpg'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'AUSTRALIA',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundImage: AssetImage(
                                                'assets/pakistan.jpg'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'PAKISTAN',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Container(
                                    color: Colors.grey[700],
                                    height: 80,
                                    width: 1,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Start from',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '03:00 PM',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Opacity(
                            opacity: 0.8,
                            child: Container(
                              height: 160,
                              width: 400,
                              color: Colors.blueGrey[900],
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'T20 League, Pakistan Vs Australia',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 18,
                                                  backgroundImage: AssetImage(
                                                      'assets/australia.jpg'),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'AUSTRALIA',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 18,
                                                  backgroundImage: AssetImage(
                                                      'assets/pakistan.jpg'),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'PAKISTAN',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Container(
                                          color: Colors.grey[700],
                                          height: 80,
                                          width: 1,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Start from',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '04:00 PM',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ]),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black.withOpacity(0.9),
        height: 80,
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const cricket_home(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 17),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.home,
                              color: const Color(0xFFFF4D00),
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
                  InkWell(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const trendingseriespage(),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/series.jpeg',
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
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const matches(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/matches.jpeg',
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
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const fixtures(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/fixtures.jpeg',
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
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const morepage(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/more.jpeg',
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
