// ignore: unused_import
import 'package:crex/dashboard/fixtures_dashboard.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';

// ignore: unused_import
import 'package:crex/pages/fixtures.dart';

// ignore: unused_import
import 'package:crex/pages/football_home.dart';

// ignore: unused_import
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/more.dart';

// ignore: unused_import
import 'package:crex/pages/series.dart';

// ignore: unused_import
import 'package:crex/pages/tennis_home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class series_dashboard extends StatefulWidget {
  const series_dashboard({super.key});

  @override
  State<series_dashboard> createState() => _series_dashboardState();
}

// ignore: camel_case_types
class _series_dashboardState extends State<series_dashboard> {
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
                    // ignore: prefer_const_constructors
                    labelPadding: EdgeInsets.all(5),
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.black,
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      // ignore: prefer_const_constructors
                      Text(
                        "Cricket",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Football",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Tennis",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
      // ignore: prefer_const_constructors

      // ignore: prefer_const_constructors
      body: series(),

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                // ignore: prefer_const_constructors
                topRight: Radius.circular(20),
                // ignore: prefer_const_constructors
                topLeft: Radius.circular(20)),
            color: Color(0xFFFF4D00),
          ),
          height: 60,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFFFF4D00),
                ),
              ),
              Positioned(
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
    );
  }
}
