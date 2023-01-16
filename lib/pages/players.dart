import 'package:flutter/material.dart';

// ignore: camel_case_types
class players extends StatefulWidget {
  const players({super.key});

  @override
  State<players> createState() => _playersState();
}

// ignore: camel_case_types
class _playersState extends State<players> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background.jpeg',
                ),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high),
          ),
          child: Column(children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            Image.asset('assets/players.png'),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  // ignore: prefer_const_constructors
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: const AssetImage("assets/india.png"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: const Text(
                    'INDIA',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(left: 10),
                  height: 45,
                  // ignore: prefer_const_constructors
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 5,
                    // ignore: prefer_const_constructors
                    child: TabBar(
                      // ignore: prefer_const_constructors
                      labelStyle: TextStyle(fontSize: 12),
                      // ignore: prefer_const_constructors
                      labelPadding: EdgeInsets.only(right: 10),
                      indicatorPadding:
                          // ignore: prefer_const_constructors
                          EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                      // ignore: prefer_const_constructors
                      indicatorColor: Color(0xFFFF4D00),
                      // ignore: prefer_const_constructors
                      labelColor: Color(0xFFFF4D00),
                      unselectedLabelColor: Colors.white,
                      // indicator: BoxDecoration(
                      //   color: Color.fromARGB(255, 41, 39, 39),
                      //   borderRadius: BorderRadius.all(
                      //     Radius.circular(20),
                      //   ),
                      // ),
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        // ignore: prefer_const_constructors
                        Tab(
                          text: 'Overview',
                        ),
                        // ignore: prefer_const_constructors
                        Tab(text: 'matches'),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: 'Player',
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: 'News',
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: 'Info',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: 350,
              color: Colors.blueGrey,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
              alignment: Alignment.topLeft,
              child: const Text(
                "Latest Squads",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: 275,
                  margin: const EdgeInsets.only(left: 25),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "PAK vs IND 2022 Squads",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 15,
                ),
                const Text(
                  ">",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: 320,
              color: Colors.grey,
            ),

            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 275,
                  margin: const EdgeInsets.only(left: 25),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "T20 wc 2022 Squads",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 15,
                ),
                const Text(
                  ">",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: 320,
              color: Colors.grey,
            ),

            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            // ignore: prefer_const_constructors
            Container(
              margin: const EdgeInsets.only(left: 25, bottom: 10),
              alignment: Alignment.topLeft,
              child: const Text(
                "All Players",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              alignment: Alignment.topLeft,
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      // ignore: prefer_const_constructors
                      border: Border.all(color: Color(0xFFFF4D00)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(left: 10),

                        height: 30, width: 75,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        // ignore: prefer_const_constructors
                        child: Tab(
                          text: ('Batter'),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(left: 10),
                        width: 75,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        // ignore: prefer_const_constructors
                        child: Tab(
                          text: ('Bowler'),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(left: 10),
                        width: 82,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        // ignore: prefer_const_constructors
                        child: Tab(
                          text: ('All Rounder'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(left: 10),
                        width: 75,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        // ignore: prefer_const_constructors
                        child: Tab(
                          text: ('Wickets'),
                        ),
                      ),
                    ]),
              ),
            ),

            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'V- Kohli',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const Text(
                                'Last Played : 2 weeks ago',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1,
                        width: 320,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
        )));
  }
}
