import 'package:flutter/material.dart';

class menRankingPage extends StatefulWidget {
  const menRankingPage({super.key});

  @override
  State<menRankingPage> createState() => _menRankingPageState();
}

class _menRankingPageState extends State<menRankingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mens Ranking',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Column(
              children: [
                DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        labelPadding: EdgeInsets.all(5),
                        tabs: [
                          Text(
                            "Team",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            "Batter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            "Bowler",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            "All Rounder",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
