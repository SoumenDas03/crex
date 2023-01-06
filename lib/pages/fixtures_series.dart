import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/football_home.dart';
import 'package:crex/pages/tennis_home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class fixtures_series extends StatefulWidget {
  const fixtures_series({super.key});

  @override
  State<fixtures_series> createState() => _fixtures_seriesState();
}

// ignore: camel_case_types
class _fixtures_seriesState extends State<fixtures_series> {
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
          child: Column(
            children: [
              DefaultTabController(
                initialIndex: 1,
                length: 3,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.only(left: 20),
                      // alignment: Alignment.center,

                      width: 200,
                      height: 45,

                      // ignore: prefer_const_constructors
                      child: TabBar(
                          // ignore: prefer_const_constructors
                          indicatorColor: Color(0xFFFF4D00),
                          indicatorWeight: 2,
                          // indicatorSize: TabBarIndicatorSize.label,
                          // padding: EdgeInsets.only(right: 2),
                          // ignore: prefer_const_constructors
                          labelPadding: EdgeInsets.all(0),
                          unselectedLabelColor: Colors.white,
                          // ignore: prefer_const_constructors
                          labelColor: Color(0xFFFF4D00),
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                          // ignore: prefer_const_literals_to_create_immutables
                          tabs: [
                            // ignore: prefer_const_constructors
                            Tab(
                              text: ('Day'),
                            ),
                            // ignore: prefer_const_constructors
                            Tab(
                              text: ('Series'),
                            ),
                            // ignore: prefer_const_constructors
                            Tab(
                              text: ('My Team'),
                            ),
                          ]),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 90,
                    ),
                    Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset("assets/three_line.png"))
                  ],
                ),
              ),
              Container(
                height: 1,
                width: 350,
                color: Colors.greenAccent,
              ),
              DefaultTabController(

                length: 7,
                child: Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(left: 10),
                  width: 320,
                  height: 45,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_constructors
                      borderRadius: BorderRadius.only(
                          // ignore: prefer_const_constructors
                          topRight: Radius.circular(10),
                          // ignore: prefer_const_constructors
                          topLeft: Radius.circular(10))),
                  // ignore: prefer_const_constructors
                  child: TabBar(
                      // ignore: prefer_const_constructors
                      indicatorColor: Color(0xFFFF4D00),
                      indicatorWeight: 3,
                      // indicatorSize: TabBarIndicatorSize.label,
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(right: 10),
                      // ignore: prefer_const_constructors
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelColor: Colors.black,
                      // ignore: prefer_const_constructors
                      labelColor: Color(0xFFFF4D00),
                      labelStyle:
                          // ignore: prefer_const_constructors
                          TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('All'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Men'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('T20'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('ODI'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('International'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Test'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('League'),
                        ),
                      ]),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 25,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 430,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            CircleAvatar(
                              radius: 25,
                              // ignore: prefer_const_constructors
                              backgroundImage: AssetImage('assets/matchlogo 1.png'),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  "India Women tour of Pakistan, 2022",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  height: 5,
                                ),
                                // ignore: prefer_const_constructors
                                Text(
                                  "2nd Dec - 18 Dec",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
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
                      margin: const EdgeInsets.only(left: 17),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
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
                      margin: const EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/series.jpeg',
                              scale: 1.2,
                            ),
                          ),
                          const Text(
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
                      margin: const EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/matches.jpeg',
                              scale: 1.2,
                            ),
                          ),
                          const Text(
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
                      margin: const EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/fixtures_crex.png',
                              scale: 1.2,
                            ),
                          ),
                          const Text(
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
                      margin: const EdgeInsets.only(left: 23),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/more.jpeg',
                              scale: 1.2,
                            ),
                          ),
                          const Text(
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
