// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';

class news extends StatefulWidget {
  const news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          initialIndex: 3,
          length: 5,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpeg',
                  ),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/players.png',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("assets/india.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'INDIA',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,

                        // ignore: prefer_const_constructors
                        child: TabBar(
                          labelStyle: TextStyle(fontSize: 12),
                          labelPadding: EdgeInsets.only(right: 10),
                          indicatorPadding: EdgeInsets.only(
                              left: 5, top: 5, bottom: 5, right: 5),
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
                              text: 'Overview',
                            ),
                            Tab(text: 'Matches'),
                            Tab(
                              text: 'Players',
                            ),
                            Tab(
                              text: 'News',
                            ),
                            Tab(
                              text: 'Info',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 1, width: 380, color: Colors.blueGrey),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 240,
                            width: 300,
                            color: Colors.blueGrey[900],
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 350,
                                  child: Image.asset(
                                    'assets/cricket3.jpg',
                                    scale: 5,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 335,
                                  margin: EdgeInsets.only(top: 12),
                                  child: Text(
                                    'Good news!Pakistan-india test match to commence today',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 8),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '20 minutes ago',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
