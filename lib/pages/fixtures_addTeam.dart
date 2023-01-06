// ignore_for_file: file_names

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/fixtures_selectteam.dart';
import 'package:crex/pages/football_home.dart';
import 'package:crex/pages/tennis_home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class fixtures_addTeam extends StatefulWidget {
  const fixtures_addTeam({super.key});

  @override
  State<fixtures_addTeam> createState() => _fixtures_addTeamState();
}

// ignore: camel_case_types
class _fixtures_addTeamState extends State<fixtures_addTeam> {
  @override
  Widget build(BuildContext context) {
    String? selected = "First";
    // ignore: prefer_const_constructors
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        // ignore: prefer_const_constructors

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
                      Navigator.of(context).push(MaterialPageRoute(
                          // ignore: prefer_const_constructors
                          builder: (context) => cricket_home()));
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
                          // ignore: prefer_const_constructors
                          builder: (context) => football_home()));
                    },
                    child: Container(
                      // ignore: prefer_const_constructors
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
                      Navigator.of(context).push(MaterialPageRoute(
                          // ignore: prefer_const_constructors
                          builder: (context) => tennis_home()));
                      setState(() {
                        selected = "Third";
                      });
                    },
                    child: Container(
                      // ignore: prefer_const_constructors
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
        body: Container(
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              image: DecorationImage(
            // ignore: prefer_const_constructors
            image: AssetImage(
              "assets/background.jpeg",
            ),
            fit: BoxFit.cover,
          )),
          // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                // ignore: prefer_const_constructors
                                minimumSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  //border radius equal to or more than 50% of width
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const favouriteteampage(),
                                  ));
                            },
                            // ignore: prefer_const_constructors
                            child: Text(
                              "Add teams",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                      ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
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
                    Container(
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
                              color: const Color(0xFFFF4D00),
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
                    Container(
                      // ignore: prefer_const_constructors
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
                    Container(
                      // ignore: prefer_const_constructors
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
                    Container(
                      // ignore: prefer_const_constructors
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
                    Container(
                      // ignore: prefer_const_constructors
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
