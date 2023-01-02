// ignore_for_file: prefer_const_constructors

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/fixtures.dart';
// ignore: unused_import
import 'package:crex/pages/football_home.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/more.dart';
// ignore: unused_import
import 'package:crex/pages/tennis_home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class trendingseriespage extends StatefulWidget {
  const trendingseriespage({super.key});

  @override
  State<trendingseriespage> createState() => _trendingseriespageState();
}

// ignore: camel_case_types
class _trendingseriespageState extends State<trendingseriespage> {
  String? selected = "First";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFF4D00),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // ignore: sized_box_for_whitespace
          child: Container(
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
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => tennis_home()));
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
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/background.jpeg",
            ),
            fit: BoxFit.cover,
          )),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Trending Series',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // ignore: prefer_const_literals_to_create_immutables
                      stops: [
                        0.5,
                        0.8,
                      ],
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color.fromARGB(255, 230, 98, 42),
                        Color.fromARGB(255, 246, 75, 1),
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '6',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Matches',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'England tour of Pakistan, 2022',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 246, 242, 242)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6, right: 85),
                            child: Text(
                              '20 Nov -12 Dec 2022',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 246, 242, 242)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 60,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Color.fromARGB(255, 39, 38, 38),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '18',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Matches',
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  'T10 League, 2022',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 246, 242, 242)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Text(
                                  '15 Dec-18 Dec 2022',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 246, 242, 242)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const cricket_home(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 17),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
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
    );
  }
}
