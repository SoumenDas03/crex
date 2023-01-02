// ignore_for_file: camel_case_types, duplicate_ignore, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/fixtures.dart';
// ignore: unused_import
import 'package:crex/pages/football_home.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/series.dart';
// ignore: unused_import
import 'package:crex/pages/tennis_home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class dashboardpage extends StatefulWidget {
  const dashboardpage({super.key});

  @override
  State<dashboardpage> createState() => _dashboardpageState();
}

class _dashboardpageState extends State<dashboardpage> {
  String? selected = "First";
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    cricket_home(),
    trendingseriespage(),
    matches(),
    fixtures(),
  ];

  // ignore: unused_element
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
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
                    onTap: null,
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
                    onTap: null,
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
                  Container(
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
                  Container(
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
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
