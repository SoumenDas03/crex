// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, duplicate_ignore, use_full_hex_values_for_flutter_colors

import 'package:crex/pages/fixtures_addTeam.dart';
import 'package:crex/pages/fixtures_calender.dart';
import 'package:crex/pages/fixtures_home.dart';
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
      body: ClipRRect(
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 10, left: 20),
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
                              // InkWell(
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const fixtures_series(),
                              //           ));
                              //     },
                              //     child: Text("Series")),

                              Tab(
                                text: "Series",
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               const fixtures_addTeam(),
                              //         ));
                              //   },
                              //   child: Text("My Team"),
                              // ),

                              Tab(
                                text: "My Team",
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
                            child: Image.asset("assets/three_line.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DefaultTabController(
                    length: 9,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      //margin: EdgeInsets.only(left: 10),
                      width: 335,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TabBar(
                            isScrollable: true,
                            indicatorColor: Color(0xFFFF4D00),
                            indicatorWeight: 3,
                            // indicatorSize: TabBarIndicatorSize.label,
                            padding: EdgeInsets.only(right: 10),
                            labelPadding: EdgeInsets.all(5),
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
                                text: ('Women'),
                              ),
                              Tab(
                                text: ('Domestic'),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 450,
                      color: Colors.amber,
                      child: TabBarView(children: [
                        fixtures1(),
                        fixtures_series(),
                        fixtures_addTeam()
                      ]))
                ],
              ),
            ),
          ]),
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
