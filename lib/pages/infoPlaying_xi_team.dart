// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class infoPlaying_xi_team extends StatefulWidget {
  const infoPlaying_xi_team({super.key});

  @override
  State<infoPlaying_xi_team> createState() => _infoPlaying_xi_teamState();
}

class _infoPlaying_xi_teamState extends State<infoPlaying_xi_team> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpeg',
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 45,

                        // ignore: prefer_const_constructors
                        child: TabBar(
                          labelStyle: TextStyle(fontSize: 12),
                          labelPadding: EdgeInsets.only(right: 10),
                          indicatorPadding: EdgeInsets.only(
                              left: 50, top: 5, bottom: 5, right: 50),
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
                              text: 'PAK',
                            ),
                            Tab(text: 'IND'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 380,
                        color: Colors.white,
                      ),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 11,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  margin: EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Color.fromARGB(255, 97, 96, 96),
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
                                      margin:
                                          EdgeInsets.only(right: 38, top: 4),
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
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 20),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'On Bench',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  margin: EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Color.fromARGB(255, 97, 96, 96),
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
                                      margin:
                                          EdgeInsets.only(right: 38, top: 4),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
