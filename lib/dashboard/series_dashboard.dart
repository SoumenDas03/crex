// ignore: unused_import
import 'package:crex/dashboard/ranking_dashboard.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';

// ignore: unused_import
import 'package:crex/pages/fixtures.dart';

// ignore: unused_import
import 'package:crex/pages/football_home.dart';

// ignore: unused_import
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/more.dart';
import 'package:crex/pages/rankingpage.dart';

// ignore: unused_import
import 'package:crex/pages/series.dart';

// ignore: unused_import
import 'package:crex/pages/tennis_home.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            isDarkMode ? const Color(0xFFFF2E00) : const Color(0xFFDFDFDF),

        //  isDarkMode ? const Color(0xFFFF2E00) : const Color(0xFFDFDFDF),
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
                        color: isDarkMode ? Colors.white : Color(0xFF494949),
                        borderRadius: BorderRadius.circular(25)),
                    unselectedLabelColor:
                        isDarkMode ? Colors.white : Colors.black,
                    labelColor: isDarkMode ? Colors.black : Colors.white,
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
        //  color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                // ignore: prefer_const_constructors
                topRight: Radius.circular(20),
                // ignore: prefer_const_constructors
                topLeft: Radius.circular(20)),
            color:
                isDarkMode ? const Color(0xFFFF2E00) : const Color(0xFFDFDFDF),
          ),
          height: 60,
          child: Stack(
            children: [
              // Positioned(
              //   bottom: 0,
              //   child: Container(
              //     height: 45,
              //     width: MediaQuery.of(context).size.width,
              //     color: isDarkMode
              //         ? const Color(0xFFFF2E00)
              //         : const Color(0xFFDFDFDF),
              //   ),
              // ),
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
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                                'assets/series.png',color: isDarkMode
                                      ? const Color(0xFFFF2E00)
                                      : const Color(0xFFFF4D00),
                                scale: 4,
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              'Series',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                                scale: 4,
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              'Matches',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const rankingPage(),
                        ));
                      },
                      child: Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                               Icons.leaderboard,
                                color: Colors.black,
                               
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              'Ranking',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                                scale: 4,
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              'More',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
