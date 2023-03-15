// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'dart:convert';

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class matches extends StatefulWidget {
  const matches({super.key});

  @override
  State<matches> createState() => _matchesState();
}

class _matchesState extends State<matches> {
  var map, data, newData, upcomingData, upcomingMap;
  getCricketDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/currentMatches?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&offset=0'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"]
          .where((element) =>
              element["matchEnded"] == false &&
              element["status"] != "Match not started" &&
              element["teamInfo"].length > 1 &&
              element["bbbEnabled"] == true)
          .toList();
      newData = map["data"]
          .where((element) => element["matchEnded"] == true)
          .toList();
      if (response.statusCode == 200) {
        return data;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getUpcomingMatches() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/matches?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&offset=0'),
      );

      upcomingMap = jsonDecode(response.body.toString());
      upcomingData = upcomingMap["data"]
          .where((element) =>
              element["matchStarted"] == false &&
              element["teams"][0] != "Tbc" &&
              element["teamInfo"].length > 1)
          .toList();
      if (response.statusCode == 200) {
        return upcomingData;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getCricketDetails(),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder(
              future: getUpcomingMatches(),
              builder: (context, snapshot) {
                if (upcomingData == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return DefaultTabController(
                    length: 4,
                    child: SingleChildScrollView(
                      child: Container(
                        alignment: Alignment.center,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: isDarkMode
                                  ? AssetImage('assets/background.jpeg')
                                  : AssetImage("assets/bgLightMode.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: 10),
                            width: 340,
                            height: 40,
                            decoration: BoxDecoration(
                                color: isDarkMode
                                    ? const Color(0xFFFF2E00)
                                    : const Color(0xFFDFDFDF),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: TabBar(
                                  labelPadding: EdgeInsets.all(5),
                                  indicator: BoxDecoration(
                                      color: isDarkMode
                                          ? Colors.black
                                          : Color(0xFF494949),
                                      borderRadius: BorderRadius.circular(25)),
                                  unselectedLabelColor:
                                      isDarkMode ? Colors.white : Colors.black,
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
                            height: 525,
                            child: TabBarView(children: [
                              ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 10),
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                data[index]["name"].toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),

                                          Stack(children: [
                                            Image.asset(
                                              'assets/matches_back.jpeg',
                                              // color: Colors.amber,
                                            ),
                                            Positioned(
                                              top: 30,
                                              left: 10,
                                              right: 10,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 18,
                                                        backgroundImage:
                                                            NetworkImage(data[
                                                                            index]
                                                                        [
                                                                        "teamInfo"]
                                                                    [0]["img"]
                                                                .toString()),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        data[index]["teamInfo"]
                                                                [0]["shortname"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 135,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 18,
                                                        backgroundImage:
                                                            NetworkImage(data[
                                                                            index]
                                                                        [
                                                                        "teamInfo"]
                                                                    [1]["img"]
                                                                .toString()),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        data[index]["teamInfo"]
                                                                [1]["shortname"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    width: 350,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Visibility(
                                                          visible: true,
                                                          child: Container(
                                                            width: 150,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    right: 25),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '29-0/',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              12),
                                                                  child: Text(
                                                                    '2.3',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Visibility(
                                                          visible: false,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            width: 155,
                                                            margin:
                                                                EdgeInsets.only(
                                                              top: 10,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  '29-0/',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              12),
                                                                  child: Text(
                                                                    '2.3',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 225),
                                                      child: Image.asset(
                                                        'assets/live_tv.png',
                                                        scale: 1.2,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ]),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              data[index]["status"],
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white70
                                                      : Colors.black38,
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                          // Row(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.center,
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     ClipRRect(
                                          //       borderRadius: BorderRadius.only(
                                          //         topLeft: Radius.circular(25),
                                          //         bottomLeft:
                                          //             Radius.circular(25),
                                          //         topRight: Radius.circular(25),
                                          //         bottomRight:
                                          //             Radius.circular(5),
                                          //       ),
                                          //       child: Container(
                                          //         height: 40,
                                          //         width: 155,
                                          //         decoration: BoxDecoration(
                                          //           gradient: LinearGradient(
                                          //               colors: [
                                          //                 Color(0xFFFF4D00),
                                          //                 Colors.orange,
                                          //                 Color(0xFF7A00)
                                          //               ],
                                          //               end: Alignment
                                          //                   .bottomRight,
                                          //               stops: [
                                          //                 0.4,
                                          //                 1,
                                          //                 1,
                                          //               ]),
                                          //         ),
                                          //         child: Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             Icon(
                                          //               Icons.play_circle,
                                          //               color: Colors.white,
                                          //               size: 32,
                                          //             ),
                                          //             SizedBox(
                                          //               width: 10,
                                          //             ),
                                          //             Text(
                                          //               'VIEW PREDICTION',
                                          //               style: TextStyle(
                                          //                   fontWeight:
                                          //                       FontWeight.bold,
                                          //                   fontSize: 12,
                                          //                   color:
                                          //                       Colors.white),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       width: 15,
                                          //     ),
                                          //     ClipRRect(
                                          //       borderRadius: BorderRadius.only(
                                          //         topLeft: Radius.circular(25),
                                          //         bottomLeft:
                                          //             Radius.circular(25),
                                          //         topRight: Radius.circular(25),
                                          //         bottomRight:
                                          //             Radius.circular(5),
                                          //       ),
                                          //       child: Container(
                                          //         height: 40,
                                          //         width: 155,
                                          //         // color: Color(0xFFFF4D00),
                                          //         decoration: BoxDecoration(
                                          //           gradient: LinearGradient(
                                          //               colors: [
                                          //                 Color(0xFFFF4D00),
                                          //                 Colors.orange,
                                          //                 Color(0xFF7A00)
                                          //               ],
                                          //               end: Alignment
                                          //                   .bottomRight,
                                          //               stops: [
                                          //                 0.4,
                                          //                 1,
                                          //                 1,
                                          //               ]),
                                          //         ),
                                          //         child: Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             Icon(
                                          //               Icons.play_circle,
                                          //               color: Colors.white,
                                          //               size: 32,
                                          //             ),
                                          //             SizedBox(
                                          //               width: 10,
                                          //             ),
                                          //             Text(
                                          //               'VIEW LIVE MATCH',
                                          //               style: TextStyle(
                                          //                   fontWeight:
                                          //                       FontWeight.bold,
                                          //                   fontSize: 12,
                                          //                   color:
                                          //                       Colors.white),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                          SizedBox(
                                            height: 5,
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
                                  }),
                              Center(
                                  child: Text(
                                "data 1",
                                style: TextStyle(color: Colors.white),
                              )),
                              Center(
                                  child: Text("data 2",
                                      style: TextStyle(color: Colors.white))),
                              Center(
                                  child: Text("data 3",
                                      style: TextStyle(color: Colors.white))),
                            ]),
                          ),
                        ]),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
