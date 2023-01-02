// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers

import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/football_home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class tennis_home extends StatefulWidget {
  const tennis_home({super.key});

  @override
  State<tennis_home> createState() => _tennis_homeState();
}

// ignore: camel_case_types
class _tennis_homeState extends State<tennis_home> {
  @override
  Widget build(BuildContext context) {
    String? selected = "Third";
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
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
                          builder: (context) => football_home()));
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => tennis_home()));
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
            margin: EdgeInsets.only(top: 5),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/tennis_background.jpeg',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/background.jpeg",
                      ),
                      fit: BoxFit.cover,
                    )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                        Container(
                          margin: EdgeInsets.only(bottom: 20, top: 10),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 50,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(50)),
                                          child: Container(
                                            height: 65,
                                            width: 330,
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundImage: AssetImage(
                                                          'assets/novak.jpeg'),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Novak Djokovic',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Text(
                                                      'Andy Murraly',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundImage: AssetImage(
                                                          'assets/andy.jpeg'),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.green,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.lightGreen,
                                                    ),
                                                    Icon(Icons.circle,
                                                        size: 10,
                                                        color: Colors.amber),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.green,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.lightGreen,
                                                    ),
                                                    Icon(Icons.circle,
                                                        size: 10,
                                                        color: Colors.amber),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.greenAccent,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15)),
                                          child: Container(
                                            height: 35,
                                            width: 300,
                                            color: Colors.white,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Novak Djokovic',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 22,
                                                    width: 42,
                                                    color: Colors.black54,
                                                    child: Text(
                                                      '96',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 22,
                                                    width: 42,
                                                    color: Colors.black12,
                                                    child: Text(
                                                      '22',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.live_tv,
                                                  size: 18,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Live TV.',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
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
                    Container(
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
                    Container(
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
                    Container(
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
                    Container(
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
                    Container(
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
