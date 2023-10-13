import 'package:crex/dashboard/ranking_dashboard.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/more.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Series_details extends StatefulWidget {
  const Series_details({super.key});

  @override
  State<Series_details> createState() => _Series_detailsState();
}

// ignore: camel_case_types
class _Series_detailsState extends State<Series_details> {
  String? selected = "Third";
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

      /* appBar: AppBar(
        backgroundColor: const Color(0xFFFF4D00),
        automaticallyImplyLeading: false,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 600,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const cricket_home()));
                    setState(() {
                      selected = "First";
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 35,
                      width: 80,
                      color: selected == "First"
                          ? Colors.white
                          : Colors.transparent,
                      child: Container(
                        margin: const EdgeInsets.only(left: 14, top: 8),
                        child: selected == "First"
                            ? const Text(
                                'Cricket',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              )
                            : const Text(
                                'Cricket',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = "Second";
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const football_home()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 35,
                        width: 80,
                        color: selected == "Second"
                            ? Colors.white
                            : Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(left: 14, top: 8),
                          child: selected == "Second"
                              ? const Text(
                                  'Football',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              : const Text(
                                  'Football',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const tennis_home()));
                    setState(() {
                      selected = "Third";
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 35,
                        width: 80,
                        color: selected == "Third"
                            ? Colors.white
                            : Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(left: 14, top: 8),
                          child: selected == "Third"
                              ? const Text(
                                  'Tennis',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              : const Text(
                                  'Tennis',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/background.jpeg",
            ),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 20, left: 15),
                child: const Text(
                  'Series Info',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                height: 70,
                width: 360,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.5,
                      0.8,
                    ],
                    colors: [
                      Color.fromARGB(255, 230, 98, 42),
                      Color.fromARGB(255, 246, 75, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(33),
                      bottomLeft: Radius.circular(33)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 5),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  '6',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  'Matches',
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 8),
                              child: const Text(
                                'England tour of Pakistan, 2022',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 246, 242, 242)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 8, right: 85),
                              child: const Text(
                                '20 Nov -12 Dec 2022',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 246, 242, 242)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 60,
                width: 330,
                color: const Color.fromARGB(255, 91, 85, 85),
                child: Container(
                  margin: const EdgeInsets.only(left: 30, top: 00),
                  child: Row(
                    children: [
                      const Text(
                        'Series',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 90),
                        child: const Text(
                          'England tour of Pakistan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30),
                  height: 1,
                  width: 330,
                  color: Colors.white),
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 60,
                width: 330,
                color: const Color.fromARGB(255, 91, 85, 85),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 00),
                      child: const Text(
                        'Duration',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 90),
                      child: const Text(
                        '20 Nov - 12 Dec 2022',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30),
                  height: 1,
                  width: 330,
                  color: Colors.white),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(20)),
                  child: Container(
                    height: 60,
                    width: 330,
                    color: const Color.fromARGB(255, 91, 85, 85),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: const Text(
                            'Format',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 150),
                          child: const Text(
                            '3 ODIs,3T20s',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 30,
                width: 310,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5)),
                child: const DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelStyle: TextStyle(fontSize: 15),
                    labelPadding: EdgeInsets.only(right: 10),
                    indicatorPadding:
                        EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
                    indicatorColor: Color(0xFFFF4D00),
                    labelColor: Color(0xFFFF4D00),
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    // ignore: prefer_const_literals_to_create_immutables

                    tabs: [
                      Tab(
                        text: 'Team',
                      ),
                      Tab(
                        text: 'Batter',
                      ),
                      Tab(
                        text: 'Bowler',
                      ),
                      Tab(
                        text: 'All',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemExtent: 70,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Container(
                          height: 50,
                          width: 310,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 10,
                                alignment: Alignment.bottomLeft,
                                color: Colors.orange,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Text(
                                  'TOP RUNS',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 40, top: 5),
                                    child: const Text('Mohammad Rizwan'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 80),
                                    child: const Text(
                                      '316 RUNS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 10,
                                alignment: Alignment.bottomRight,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
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
                              scale: 4,
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
                        builder: (context) => const ranking_dashboard(),
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
    );
  }
}
