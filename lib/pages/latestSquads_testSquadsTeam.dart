// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class latestSquads_testSquadsTeam extends StatefulWidget {
  const latestSquads_testSquadsTeam({super.key});

  @override
  State<latestSquads_testSquadsTeam> createState() =>
      _latestSquads_testSquadsTeamState();
}

class _latestSquads_testSquadsTeamState
    extends State<latestSquads_testSquadsTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    'Test Squads',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 170, top: 40),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            DefaultTabController(
              length: 2,
              child: TabBar(
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // ignore: prefer_const_literals_to_create_immutables
                    stops: [
                      0.4,
                      0.8,
                    ],
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Color.fromARGB(255, 230, 105, 52),
                      Color.fromARGB(255, 222, 68, 2),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Container(
                        height: 40,
                        width: 150,
                        // decoration: BoxDecoration(
                        //   gradient: LinearGradient(
                        //     begin: Alignment.topRight,
                        //     end: Alignment.bottomLeft,
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     stops: [
                        //       0.1,
                        //       0.8,
                        //     ],
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     colors: [
                        //       Color.fromARGB(255, 35, 35, 35),
                        //       Color.fromARGB(255, 114, 112, 112),
                        //     ],
                        //   ),
                        // ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage("assets/india.png"),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'INDIA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // ignore: prefer_const_literals_to_create_immutables
                            stops: [
                              0.1,
                              0.8,
                            ],
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Color.fromARGB(255, 35, 35, 35),
                              Color.fromARGB(255, 114, 112, 112),
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage("assets/pakistan.jpg"),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'PAKISTAN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,

                  // ignore: prefer_const_constructors
                  child: DefaultTabController(
                    length: 4,
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 12),
                      labelPadding: EdgeInsets.only(right: 10),
                      indicatorPadding:
                          EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                      indicatorColor: Colors.black,
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
                        Tab(
                          text: 'ALL(16)',
                        ),
                        Tab(text: 'BAT(6)'),
                        Tab(
                          text: 'BOWI(4)',
                        ),
                        Tab(
                          text: 'AR(6)',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: 380,
              color: Color.fromARGB(255, 115, 114, 114),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / .4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 97, 96, 96),
                          child: Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Demo Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 38, top: 4),
                            child: Text(
                              'Batter',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
