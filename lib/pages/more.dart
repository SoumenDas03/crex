// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/fixtures.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/series.dart';
import 'package:flutter/material.dart';

class morepage extends StatefulWidget {
  const morepage({super.key});

  @override
  State<morepage> createState() => _morepageState();
}

class _morepageState extends State<morepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.jpeg'))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, right: 290),
                  child: Text(
                    'More',
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 152, 152),
                        fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFF4D00),
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Join as Expert',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 260),
                  child: Text(
                    'Ranking',
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 152, 152),
                        fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Players Ranking',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/team_ranking.png',
                            color: Colors.white,
                            scale: 1.3,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Team Ranking',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 260),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 152, 152),
                        fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset('assets/language.png')),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Language',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Notification',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 260),
                  child: Text(
                    'Support',
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 152, 152),
                        fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/support.png',
                            scale: 1.1,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Feedback',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 260),
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 152, 152),
                        fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/contact.png',
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Contact',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/privacy.png',
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: Color.fromARGB(255, 26, 26, 26),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/terms.png',
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 150),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Follow Us On:',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/facebook.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/twitter.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/instagram.png'),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
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
                          Icon(
                            Icons.home,
                            color: const Color(0xFFFF4D00),
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
