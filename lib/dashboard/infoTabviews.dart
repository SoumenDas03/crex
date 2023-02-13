// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_const_constructors

import 'package:crex/dashboard/fixtures_dashboard.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/commentary.dart';
import 'package:crex/pages/fantasy.dart';
import 'package:crex/pages/graph.dart';
import 'package:crex/pages/info.dart';
import 'package:crex/pages/live_first.dart';
import 'package:crex/pages/more.dart';

import 'package:crex/pages/scorecard.dart';
import 'package:crex/pages/seriesstatus.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class infoTabViews extends StatefulWidget {
  const infoTabViews({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<infoTabViews> createState() => _infoTabViewsState();
}

// ignore: camel_case_types
class _infoTabViewsState extends State<infoTabViews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const TabBar(
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 12),
                labelPadding: EdgeInsets.only(right: 10),
                indicatorPadding:
                    EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                indicatorColor: Colors.black,
                labelColor: Color(0xFFFF4D00),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'Info',
                  ),
                  Tab(text: 'Fantasy'),
                  Tab(
                    text: 'Commentary',
                  ),
                  Tab(
                    text: 'Live',
                  ),
                  Tab(
                    text: 'Scorecard',
                  ),
                  Tab(
                    text: 'Grephs',
                  ),
                  Tab(
                    text: 'Series Status',
                  ),
                ]),
          ),
          body: TabBarView(
            children: <Widget>[
              info(
                id: widget.id,
              ),
              fantasy(
                id: widget.id,
              ),
              commententary(),
              live_first(),
              scorecard(),
              graph(),
              seriesstatus(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 75,
            color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                        // ignore: prefer_const_constructors
                        topRight: Radius.circular(20),
                        // ignore: prefer_const_constructors
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
                            builder: (context) => const home_dashboard(),
                          ));
                        },
                        child: Container(
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.only(left: 17),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                // ignore: prefer_const_constructors
                                child: Icon(
                                  Icons.home,
                                  color: Colors.black,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Home',
                                // ignore: prefer_const_constructors
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
                            builder: (context) => const series_dashboard(),
                          ));
                        },
                        child: Container(
                          // ignore: prefer_const_constructors
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
                              // ignore: prefer_const_constructors
                              Text(
                                'Series',
                                // ignore: prefer_const_constructors
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
                            builder: (context) => const matches_dashboard(),
                          ));
                        },
                        child: Container(
                          // ignore: prefer_const_constructors
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
                              // ignore: prefer_const_constructors
                              Text(
                                'Matches',
                                // ignore: prefer_const_constructors
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
                            builder: (context) => const fixtures_dashboard(),
                          ));
                        },
                        child: Container(
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.only(left: 23),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/fixtures.png',
                                  color: Colors.black,
                                  scale: 1.2,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Fixtures',
                                // ignore: prefer_const_constructors
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
                            builder: (context) => const more(),
                          ));
                        },
                        child: Container(
                          // ignore: prefer_const_constructors
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
                              // ignore: prefer_const_constructors
                              Text(
                                'More',
                                // ignore: prefer_const_constructors
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
        ),
      ),
    );
  }
}
