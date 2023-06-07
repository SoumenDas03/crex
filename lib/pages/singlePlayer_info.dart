// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore, file_names, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class singlePlayer_info extends StatefulWidget {
  const singlePlayer_info({Key? key, required this.playerId}) : super(key: key);

  final String playerId;

  @override
  State<singlePlayer_info> createState() => _singlePlayer_infoState();
}

class _singlePlayer_infoState extends State<singlePlayer_info> {
  Future<void> apiFetch() async {
    var status = true;

    await Future.wait([
      getPlayerInfo(),
    ]).then((v) {
      for (var item in v) {
        print('$item \n');
      }
    }).whenComplete(() {
      status = false;
    });

    print(status == true ? 'Loading' : 'FINISHED');
  }

  // ignore: prefer_typing_uninitialized_variables
  var map,
      data,
      totalRunList,
      highestScoreList,
      odiMatchListBatting,
      odiMatchListBowling,
      testMatchListBatting,
      testMatchListBowling,
      t20MatchListBatting,
      t20MatchListBowling;

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future getPlayerInfo() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/players_info?apikey=f1a40d68-eacd-40dd-bd92-d2506957493d&id=${widget.playerId}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      totalRunList = data["stats"]
          .where(
              (element) => element["stat"] == "runs" && element["value"] != "-")
          .toList();
      highestScoreList = data["stats"]
          .where(
              (element) => element["stat"] == "hs" && element["value"] != "-")
          .toList();
      highestScoreList.sort((a, b) {
        return (int.parse(b['value'])).compareTo(int.parse(a['value']));
      });
      odiMatchListBatting = data["stats"]
          .where((element) =>
              element["matchtype"] == "odi" &&
              element["value"] != "-" &&
              element["fn"] == "batting")
          .toList();
      odiMatchListBowling = data["stats"]
          .where((element) =>
              element["matchtype"] == "odi" &&
              element["value"] != "-" &&
              element["fn"] == "bowling")
          .toList();
      testMatchListBatting = data["stats"]
          .where((element) =>
              element["matchtype"] == "test" &&
              element["value"] != "-" &&
              element["fn"] == "batting")
          .toList();
      testMatchListBowling = data["stats"]
          .where((element) =>
              element["matchtype"] == "test" &&
              element["value"] != "-" &&
              element["fn"] == "bowling")
          .toList();
      t20MatchListBatting = data["stats"]
          .where((element) =>
              element["matchtype"] == "t20i" &&
              element["value"] != "-" &&
              element["fn"] == "batting")
          .toList();
      t20MatchListBowling = data["stats"]
          .where((element) =>
              element["matchtype"] == "t20i" &&
              element["value"] != "-" &&
              element["fn"] == "bowling")
          .toList();
      if (response.statusCode == 200) {
        return data;
        // ignore: use_build_context_synchronously
      } else {
        // ignore: avoid_print
        print('failed');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(163, 17, 17, 17),
        title: Text("Player Info"),
      ),
      body: FutureBuilder(
        future: apiFetch(),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/background.jpeg",
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                NetworkImage(data["playerImg"].toString()),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["name"].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'DOB: ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 184, 184),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    DateFormat('yMMMEd').format(
                                      DateTime.parse(data["dateOfBirth"]),
                                    ),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 184, 184),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Runs : ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 184, 184),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 6, top: 3),
                                    child: Text(
                                      totalRunList != null
                                          ? (int.parse(totalRunList[0]
                                                      ["value"]) +
                                                  int.parse(totalRunList[1]
                                                      ["value"]) +
                                                  int.parse(
                                                      totalRunList[2]["value"]))
                                              .toString()
                                          : "No Data to show",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 189, 184, 184),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Highest Score : ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 184, 184),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    highestScoreList != null
                                        ? "${"${highestScoreList[0]["value"]} (" + highestScoreList[0]["matchtype"].toUpperCase()})"
                                        : "No Data to show",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 184, 184),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 1,
                      width: 380,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                // ignore: prefer_const_constructors
                                child: TabBar(
                                  labelStyle: TextStyle(fontSize: 12),
                                  labelPadding: EdgeInsets.only(right: 10),

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
                                    Tab(
                                      text: 'Playes Info',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 720,
                                child: TabBarView(
                                    physics: ClampingScrollPhysics(),
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 30, top: 25),
                                                  child: Image.asset(
                                                      'assets/matches.png',
                                                      scale: 4,
                                                      color:
                                                          Color(0xFFFF4D00))),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, top: 25),
                                                child: Text(
                                                  data["role"].toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18),
                                                ),
                                              )
                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Container(
                                          //       margin: EdgeInsets.only(
                                          //           top: 30, left: 10),
                                          //       child: Text(
                                          //         'Recent Form(last played on 01 Nov)',
                                          //         style: TextStyle(
                                          //             color: Colors.white,
                                          //             fontWeight:
                                          //                 FontWeight.w400,
                                          //             fontSize: 16),
                                          //       ),
                                          //     ),
                                          //     Container(
                                          //       margin: EdgeInsets.only(
                                          //           top: 28, left: 10),
                                          //       child: Text(
                                          //         'See More >',
                                          //         style: TextStyle(
                                          //             color: Colors.blue,
                                          //             fontWeight:
                                          //                 FontWeight.w400,
                                          //             fontSize: 12),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   height: 25,
                                          // ),
                                          // Container(
                                          //   height: 100,
                                          //   child: ListView.builder(
                                          //     scrollDirection: Axis.horizontal,
                                          //     physics:
                                          //         const ClampingScrollPhysics(),
                                          //     shrinkWrap: true,
                                          //     itemCount: 10,
                                          //     itemBuilder:
                                          //         (BuildContext context,
                                          //             int index) {
                                          //       return Padding(
                                          //         padding:
                                          //             const EdgeInsets.all(3.0),
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           child: Container(
                                          //             height: 60,
                                          //             width: 80,
                                          //             color: Color.fromARGB(
                                          //                 255, 73, 72, 72),
                                          //             child: Column(
                                          //               // ignore: prefer_const_literals_to_create_immutables
                                          //               children: [
                                          //                 SizedBox(
                                          //                   height: 25,
                                          //                 ),
                                          //                 Text(
                                          //                   '18(28)',
                                          //                   style: TextStyle(
                                          //                       color: Colors
                                          //                           .white,
                                          //                       fontSize: 18,
                                          //                       fontWeight:
                                          //                           FontWeight
                                          //                               .w600),
                                          //                 ),
                                          //                 Container(
                                          //                   margin:
                                          //                       EdgeInsets.only(
                                          //                           top: 5),
                                          //                   child: Text(
                                          //                     'vs KPK,F.CLS',
                                          //                     style: TextStyle(
                                          //                         color: Colors
                                          //                             .white,
                                          //                         fontSize: 10,
                                          //                         fontWeight:
                                          //                             FontWeight
                                          //                                 .w600),
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.only(
                                                top: 25, left: 20),
                                            child: Text(
                                              data["role"] == "WK-Batsman" ||
                                                      data["role"] == "Batsman"
                                                  ? 'Batting Career' +
                                                      '(' +
                                                      data["battingStyle"] +
                                                      ')'
                                                  : "Bowling Career" +
                                                      '(' +
                                                      data["bowlingStyle"] +
                                                      ')',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          DefaultTabController(
                                            length: 3,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  alignment: Alignment.center,
                                                  // margin: EdgeInsets.only(left: 10),
                                                  width: 320,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFFF4D00),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.5),
                                                    child: TabBar(
                                                        labelPadding:
                                                            EdgeInsets.all(5),
                                                        indicator: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        unselectedLabelColor:
                                                            Colors.white,
                                                        labelColor:
                                                            Colors.white,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        tabs: [
                                                          Tab(
                                                            text: ('ODI'),
                                                          ),
                                                          Tab(
                                                            text: ('TEST'),
                                                          ),
                                                          Tab(
                                                            text: ('T20I'),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                                //batting stats
                                                Container(
                                                  height: 200,
                                                  child: TabBarView(children: [
                                                    //batting stats
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30,
                                                                      left: 13),
                                                              height: 90,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? odiMatchListBatting[0]["value"]
                                                                            .toString()
                                                                        : "No Data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Matches',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? odiMatchListBatting[1]["value"]
                                                                            .toString()
                                                                        : "No Data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Innings',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 90,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? odiMatchListBatting[3]["value"].toString()
                                                                            : odiMatchListBowling[4]["value"].toString())
                                                                        : "No Data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'Runs'
                                                                        : "Wickets",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 100,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? odiMatchListBatting[4]["value"].toString()
                                                                            : odiMatchListBowling[5]["value"].toString())
                                                                        : "No Data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'Highest Score'
                                                                        : "Best Figure",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 13),
                                                              height: 75,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? odiMatchListBatting[8]["value"].toString()
                                                                            : odiMatchListBowling[11]["value"].toString())
                                                                        : "No Data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? '100s'
                                                                        : '10 Wickets',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? odiMatchListBatting[10]["value"].toString()
                                                                            : odiMatchListBowling[10]["value"].toString())
                                                                        : "No data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? '50s'
                                                                        : '5 Wickets',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 90,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBowling !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? odiMatchListBatting[7]["value"].toString()
                                                                            : odiMatchListBowling[7]["value"].toString())
                                                                        : "no data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'SR'
                                                                        : 'Econ',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 100,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    odiMatchListBatting !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? odiMatchListBatting[5]["value"].toString()
                                                                            : odiMatchListBowling[8]["value"].toString())
                                                                        : "No data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Avg',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30,
                                                                      left: 13),
                                                              height: 90,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    testMatchListBatting !=
                                                                            null
                                                                        ? testMatchListBatting[0]["value"]
                                                                            .toString()
                                                                        : "No data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Matches',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    testMatchListBatting !=
                                                                            null
                                                                        ? testMatchListBatting[1]["value"]
                                                                            .toString()
                                                                        : "No data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Innings',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 90,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    testMatchListBatting !=
                                                                            null
                                                                        ? (data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? testMatchListBatting[3]["value"].toString()
                                                                            : testMatchListBowling[4]["value"].toString())
                                                                        : "No data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'Runs'
                                                                        : "Wickets",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 100,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    testMatchListBatting !=
                                                                            null
                                                                        ? data["role"] == "WK-Batsman" ||
                                                                                data["role"] == "Batsman"
                                                                            ? testMatchListBatting[4]["value"].toString()
                                                                            : testMatchListBowling[5]["value"].toString()
                                                                        : "No data to show",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'Highest Score'
                                                                        : "Best Figure",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 13),
                                                              height: 75,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? testMatchListBatting[8]["value"]
                                                                            .toString()
                                                                        : testMatchListBowling[11]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? '100s'
                                                                        : '10 Wickets',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? testMatchListBatting[10]["value"]
                                                                            .toString()
                                                                        : testMatchListBowling[10]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? '50s'
                                                                        : '5 Wickets',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 90,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? testMatchListBatting[7]["value"]
                                                                            .toString()
                                                                        : testMatchListBowling[7]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'SR'
                                                                        : 'Econ',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 100,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? testMatchListBatting[5]["value"]
                                                                            .toString()
                                                                        : testMatchListBowling[8]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Avg',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30,
                                                                      left: 13),
                                                              height: 90,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    t20MatchListBatting[0]
                                                                            [
                                                                            "value"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Matches',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    t20MatchListBatting[1]
                                                                            [
                                                                            "value"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Innings',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 90,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? t20MatchListBatting[3]["value"]
                                                                            .toString()
                                                                        : t20MatchListBowling[4]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'Runs'
                                                                        : "Wickets",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              height: 90,
                                                              width: 100,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? t20MatchListBatting[4]["value"]
                                                                            .toString()
                                                                        : t20MatchListBowling[5]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'Highest Score'
                                                                        : "Best Figure",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 13),
                                                              height: 75,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? t20MatchListBatting[8]["value"]
                                                                            .toString()
                                                                        : t20MatchListBowling[11]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? '100s'
                                                                        : '10 Wickets',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 70,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? t20MatchListBatting[10]["value"]
                                                                            .toString()
                                                                        : t20MatchListBowling[10]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? '50s'
                                                                        : '5 Wickets',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 90,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? t20MatchListBatting[7]["value"]
                                                                            .toString()
                                                                        : t20MatchListBowling[7]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? 'SR'
                                                                        : 'Econ',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 1,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      115,
                                                                      114,
                                                                      114),
                                                            ),
                                                            Container(
                                                              height: 75,
                                                              width: 100,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      37,
                                                                      36,
                                                                      36),
                                                              child: Column(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  SizedBox(
                                                                    height: 18,
                                                                  ),
                                                                  Text(
                                                                    data["role"] ==
                                                                                "WK-Batsman" ||
                                                                            data["role"] ==
                                                                                "Batsman"
                                                                        ? t20MatchListBatting[5]["value"]
                                                                            .toString()
                                                                        : t20MatchListBowling[8]["value"]
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Text(
                                                                    'Avg',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Container(
                                          //   height: 1,
                                          //   width: 380,
                                          //   color:
                                          //       Color.fromARGB(255, 92, 90, 90),
                                          // ),

                                          // Container(
                                          //   height: 160,
                                          //   child: ListView.builder(
                                          //     scrollDirection: Axis.horizontal,
                                          //     physics:
                                          //         const ClampingScrollPhysics(),
                                          //     shrinkWrap: true,
                                          //     itemCount: 3,
                                          //     itemBuilder:
                                          //         (BuildContext context,
                                          //             int index) {
                                          //       return Padding(
                                          //         padding:
                                          //             const EdgeInsets.all(8.0),
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   5),
                                          //           child: Container(
                                          //             alignment:
                                          //                 Alignment.topCenter,
                                          //             height: 100,
                                          //             width: 170,
                                          //             color: Color.fromARGB(
                                          //                 255, 50, 49, 49),
                                          //             child: Column(
                                          //               children: [
                                          //                 Image.asset(
                                          //                     'assets/cricket3.jpg'),
                                          //                 Padding(
                                          //                   padding:
                                          //                       const EdgeInsets
                                          //                           .all(8.0),
                                          //                   child: Text(
                                          //                     'Rahul power India to win',
                                          //                     style: TextStyle(
                                          //                         color: Colors
                                          //                             .white,
                                          //                         fontSize: 14),
                                          //                   ),
                                          //                 ),
                                          //                 Container(
                                          //                   margin:
                                          //                       EdgeInsets.only(
                                          //                           left: 10),
                                          //                   alignment: Alignment
                                          //                       .topLeft,
                                          //                   child: Text(
                                          //                     'Today at 9:35 am',
                                          //                     style: TextStyle(
                                          //                         color: Color
                                          //                             .fromARGB(
                                          //                                 255,
                                          //                                 172,
                                          //                                 168,
                                          //                                 168),
                                          //                         fontSize: 10),
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       );
                                          //     },
                                          //   ),
                                          // ),

                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, top: 25),
                                                child: Text(
                                                  data["name"] + ' Info',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 30),
                                                child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                width: 170,
                                                margin: EdgeInsets.only(
                                                    left: 90, top: 30),
                                                child: Text(
                                                  data["name"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'Age :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 130, top: 10),
                                                child: Text(
                                                  (int.parse(daysBetween(
                                                                      DateTime.parse(
                                                                          data[
                                                                              "dateOfBirth"]),
                                                                      DateTime
                                                                          .now())
                                                                  .toString()) ~/
                                                              365)
                                                          .toString() +
                                                      ' year',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'DOB :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 130, top: 10),
                                                child: Text(
                                                  DateFormat('yMMMEd').format(
                                                      DateTime.parse(
                                                          data["dateOfBirth"])),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'Height :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 115, top: 10),
                                                child: Text(
                                                  '5.7"',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'Country :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 90, top: 10),
                                                child: Text(
                                                  data["country"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(right: 25),
                                            child: DefaultTabController(
                                              // initialIndex: 0,
                                              length: 2,
                                              child: Container(
                                                alignment: Alignment.center,
                                                // margin: EdgeInsets.only(left: 10),
                                                width: 80,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: TabBar(
                                                    labelPadding:
                                                        EdgeInsets.all(8),
                                                    indicator: BoxDecoration(
                                                        color: Colors.grey[350],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    unselectedLabelColor:
                                                        Colors.white,
                                                    labelColor: Colors.white,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    tabs: [
                                                      Image.asset(
                                                        "assets/ball.png",
                                                        scale: 1,
                                                      ),
                                                      Image.asset(
                                                        "assets/bat.png",
                                                        scale: 1,
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, top: 30),
                                                child: Text(
                                                  data["name"] + ' Info',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 30),
                                                child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 100, top: 30),
                                                child: Text(
                                                  data["name"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'Age :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 118, top: 10),
                                                child: Text(
                                                  (int.parse(daysBetween(
                                                                      DateTime.parse(
                                                                          data[
                                                                              "dateOfBirth"]),
                                                                      DateTime
                                                                          .now())
                                                                  .toString()) ~/
                                                              365)
                                                          .toString() +
                                                      ' year',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'DOB :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 115, top: 10),
                                                child: Text(
                                                  DateFormat('yMMMEd').format(
                                                      DateTime.parse(
                                                          data["dateOfBirth"])),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'Height :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 100, top: 10),
                                                child: Text(
                                                  '5.7"',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 28, top: 10),
                                                child: Text(
                                                  'Nationality :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 75, top: 10),
                                                child: Text(
                                                  data["country"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 150,
                                            width: 380,
                                            color:
                                                Color.fromARGB(255, 54, 53, 53),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 35, top: 25),
                                                      child: Text(
                                                        'Role :',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 25, top: 25),
                                                      child: Text(
                                                        data["role"],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 35, top: 25),
                                                      child: Text(
                                                        'Bats :',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 25, top: 25),
                                                      child: Text(
                                                        data["battingStyle"] ??
                                                            "Right Handed Bat",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 35, top: 25),
                                                      child: Text(
                                                        'Bowl :',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 25, top: 25),
                                                      child: Text(
                                                        data["bowlingStyle"] ??
                                                            "Right Handed Bowl",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(right: 25),
                                            child: DefaultTabController(
                                              // initialIndex: 0,
                                              length: 2,
                                              child: Container(
                                                alignment: Alignment.center,
                                                // margin: EdgeInsets.only(left: 10),
                                                width: 80,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: TabBar(
                                                    labelPadding:
                                                        EdgeInsets.all(8),
                                                    indicator: BoxDecoration(
                                                        color: Colors.grey[350],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    unselectedLabelColor:
                                                        Colors.white,
                                                    labelColor: Colors.white,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    tabs: [
                                                      Image.asset(
                                                        "assets/ball.png",
                                                        scale: 1,
                                                      ),
                                                      Image.asset(
                                                        "assets/bat.png",
                                                        scale: 1,
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          )
                                        ],
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: 380,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
