// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/fixtures.dart';
import 'package:crex/pages/more.dart';
import 'package:flutter/material.dart';

import 'series.dart';

class matches extends StatefulWidget {
  const matches({super.key});

  @override
  State<matches> createState() => _matchesState();
}

class _matchesState extends State<matches> {
  @override
  Widget build(BuildContext context) {
    String? selected = "First";
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFFF4D00),
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 600,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => cricket_home()));
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
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => football_home()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 40),
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
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => tennis_home()));
                      setState(() {
                        selected = "Third";
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 40),
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
        ),
        body: SingleChildScrollView(
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
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                // margin: EdgeInsets.only(left: 10),
                width: 340,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFFFF4D00),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: TabBar(
                      labelPadding: EdgeInsets.all(5),
                      indicator: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(
                          text: ('Live'),
                        ),
                        Tab(
                          text: ('Today'),
                        ),
                        Tab(
                          text: ('Upcoming'),
                        ),
                        Tab(
                          text: ('Finished'),
                        )
                      ]),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Text(
                            'INDIA VS PAKISTAN TOURNAMENT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Stack(children: [
                            Image.asset(
                              'assets/matches_back.jpeg',
                              // color: Colors.amber,
                            ),
                            Positioned(
                              top: 30,
                              left: 30,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundImage:
                                            AssetImage('assets/india.jpg'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'IND',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 135,
                                      ),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundImage:
                                            AssetImage('assets/pakistan.jpg'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'PAK',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, right: 200),
                                    child: Row(
                                      children: [
                                        Text(
                                          '29-0/',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text(
                                            '2.3',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 225),
                                      child: Image.asset('assets/live_tv.png'))
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'India won the toss and will Bat first',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(5),
                                ),
                                child: Container(
                                  height: 40,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF4D00),
                                          Colors.orange,
                                          Color(0xFF7A00)
                                        ],
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.4,
                                          1,
                                          1,
                                        ]),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.play_circle,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'VIEW PREDICTION',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(5),
                                ),
                                child: Container(
                                  height: 40,
                                  width: 155,
                                  // color: Color(0xFFFF4D00),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF4D00),
                                          Colors.orange,
                                          Color(0xFF7A00)
                                        ],
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.4,
                                          1,
                                          1,
                                        ]),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.play_circle,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'VIEW LIVE MATCH',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: Colors.grey[700],
                            height: 1.5,
                            width: 360,
                          )
                        ],
                      ),
                    );
                  })
            ]),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black.withOpacity(0.9),
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const cricket_home(),
                        ));
                      },
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const trendingseriespage(),
                        ));
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const trendingseriespage(),
                          ));
                        },
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
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const matches(),
                        ));
                      },
                      child: Container(
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
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const fixtures(),
                        ));
                      },
                      child: Container(
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
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const morepage(),
                        ));
                      },
                      child: Container(
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
