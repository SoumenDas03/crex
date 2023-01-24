// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, duplicate_ignore, use_full_hex_values_for_flutter_colors

import 'package:crex/pages/fixtures_addTeam.dart';
import 'package:crex/pages/fixtures_calender.dart';
import 'package:crex/pages/fixtures_pin.dart';
import 'package:crex/pages/fixtures_series.dart';
import 'package:flutter/material.dart';

class fixtures extends StatefulWidget {
  const fixtures({super.key});

  @override
  State<fixtures> createState() => _fixturesState();
}

class _fixturesState extends State<fixtures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const fixtures_series(),
                                      ));
                                },
                                child: Text("Series")),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const fixtures_addTeam(),
                                    ));
                              },
                              child: Text("My Team"),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 90),
                      child: InkWell(
                        onTap: () {
                          _show(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Image.asset("assets/three_line.png")),
                      ),
                    )
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
                      child: InkWell(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const fixtures_calender(),
                          ));
                        }),
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
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const fixtures_pin(),
                                                ));
                                          },
                                          child: Image.asset("assets/pin.png"))
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
    );
  }
}

void _show(BuildContext ctx) {
  showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      context: ctx,
      builder: (ctx) => Opacity(
            opacity: 0.8,
            child: Container(
              height: 350.0,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
                // ignore: prefer_const_constructors
              ),

              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            'Filter Matches',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 175,
                          ),
                          // ignore: prefer_const_constructors
                          InkWell(
                            onTap: () {
                              Navigator.pop(ctx);
                            },
                            child: Icon(
                              Icons.close_sharp,
                              color: Colors.white,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        width: 360,
                        color: Colors.greenAccent,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              "Team",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 10,
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
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('All'),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('Men'),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('Women'),
                                      ),
                                    ),
                                  ]),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 25,
                            ),

                            // ignore: prefer_const_constructors
                            Text(
                              "Format",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 25,
                            ),
                            DefaultTabController(
                              length: 5,
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

                                      height: 30, width: 75,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('All'),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('T 20'),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('ODI'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('Test'),
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('T 10'),
                                      ),
                                    ),
                                  ]),
                            ),

                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 25,
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              "Format",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic),
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
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('All'),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 150,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('International'),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 75,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      // ignore: prefer_const_constructors
                                      child: Tab(
                                        text: ('Domestic'),
                                      ),
                                    ),
                                  ]),
                            ),

                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                // ignore: prefer_const_constructors
                                minimumSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  //border radius equal to or more than 50% of width
                                )),
                            onPressed: () {},
                            // ignore: prefer_const_constructors
                            child: Text(
                              "Apply Filters",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}
