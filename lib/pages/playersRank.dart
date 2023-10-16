// ignore_for_file: file_names

import 'package:crex/pages/allRounder_Ranking.dart';
import 'package:crex/pages/batter_Ranking.dart';
import 'package:crex/pages/bowler_Ranking.dart';
import 'package:crex/dashboard/rankingpage.dart';
import 'package:crex/pages/team_ranking.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class playersRank extends StatefulWidget {
  const playersRank(
      {super.key,
      required this.players,
      required this.link,
      required this.battter,
      required this.bowler,
      required this.allRounder});
  final String players;
  final String link;
  final String battter;
  final String bowler;
  final String allRounder;

  @override
  State<playersRank> createState() => _playersRankState();
}

// ignore: camel_case_types
class _playersRankState extends State<playersRank> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          widget.players + " Ranking",
          style:
              // ignore: prefer_const_constructors
              TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          image: DecorationImage(
            // ignore: prefer_const_constructors
            image: AssetImage(
              "assets/background.jpeg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: DefaultTabController(
              initialIndex: 0,
              length: 4,
              // ignore: prefer_const_constructors
              child: Column(
                children: [
                  TabBar(
                      // ignore: prefer_const_constructors
                      indicatorColor: Color(0xFFFF4D00),
                      // indicatorWeight: 3,
                      // indicatorSize: TabBarIndicatorSize.label,
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(left: 10),
                      // ignore: prefer_const_constructors
                      labelPadding: EdgeInsets.only(right: 0),
                      unselectedLabelColor: Colors.white,
                      // ignore: prefer_const_constructors
                      labelColor: Color(0xFFFF4D00),
                      // ignore: prefer_const_constructors
                      labelStyle:
                          // ignore: prefer_const_constructors
                          TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        // ignore: prefer_const_constructors

                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Team'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Batter'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Bowler'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('All Rounder'),
                        ),
                      ]),
                  Container(
                    height: 1,
                    width: 350,
                    color: Colors.blueGrey,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: TabBarView(
                      children: [
                        team_Ranking(),
                        batter_Ranking(link: widget.link, batter: widget.battter,),
                        bowler_Ranking(
                          link: widget.link,
                          bowler: widget.bowler,
                        ),
                        allRounder_Ranking(allRounder: widget.allRounder,
                          link: widget.link,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
