import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/manRankingPage.dart';
import 'package:crex/pages/more.dart';
import 'package:crex/pages/playersRank.dart';
import 'package:crex/pages/team_ranking.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class rankingPage extends StatefulWidget {
  const rankingPage({super.key});

  @override
  State<rankingPage> createState() => _rankingPageState();
}

class _rankingPageState extends State<rankingPage> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ranking Details',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                height: 1,
                width: 360,
                color: Colors.blueGrey,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => playersRank(
                                  players: index == 0 ? "Men's" : "Women's",
                                  link: index == 0
                                      ? "https://www.mydraw.com/NIMG.axd?i=Shape-Libraries/Clipart/Sports/Basketball/Basketball-Referee.png"
                                      : "https://www.pngrepo.com/png/35047/512/businesswoman.png",
                                  battter: index == 0
                                      ? "Virat Kohli"
                                      : "Smriti Mandana",
                                  bowler: index == 0
                                      ? "Jasprit Bumrah"
                                      : "Deepti Sharma",
                                  allRounder: index == 0
                                      ? "Hardik Panya"
                                      : "Meghna Singh")),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(index == 0
                                  ? "https://www.mydraw.com/NIMG.axd?i=Shape-Libraries/Clipart/Sports/Basketball/Basketball-Referee.png"
                                  : "https://www.pngrepo.com/png/35047/512/businesswoman.png"),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  index == 0
                                      ? "Men's Cricket Ranking"
                                      : "Women's Cricket Ranking",
                                  style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(),
                                child: Text(
                                  'Teams & Players',
                                  style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: isDarkMode ? Colors.white60 : Colors.black54,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          // color: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                // ignore: prefer_const_constructors
                topRight: Radius.circular(20),
                // ignore: prefer_const_constructors
                topLeft: Radius.circular(20),
              ),
              color: isDarkMode
                  ? const Color(0xFFFF2E00)
                  : const Color(0xFFDFDFDF),
            ),
            height: 60,
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
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
                                child: Icon(Icons.home,
                                    // color: Colors.black,
                                    color: Colors.black),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Home',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                  scale: 4,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Series',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.only(left: 23),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.leaderboard,
                                  color: isDarkMode
                                      ? const Color(0xFFFF2E00)
                                      : const Color(0xFFFF4D00),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Ranking',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
