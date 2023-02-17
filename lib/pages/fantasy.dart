// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fantasy extends StatefulWidget {
  const fantasy({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<fantasy> createState() => _fantasyState();
}

class _fantasyState extends State<fantasy> {
  var map,
      data,
      fantasyMap,
      fantasyData,
      sugam,
      pointsOrderData,
      scoreOrderData,
      wicketOrderData,
      scoreMap,
      scoreData,
      sugamScore,
      sugamWicket;
  getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
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

  getFantasyPoints() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_points?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}&ruleset=0'),
      );

      fantasyMap = jsonDecode(response.body.toString());
      fantasyData = fantasyMap["data"];
      sugam = fantasyData["totals"];
      sugam.sort((a, b) {
        return a['points'].compareTo(b['points']) as int;
      });
      pointsOrderData = sugam.reversed.toList();
      if (response.statusCode == 200) {
        return fantasyData;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getMatchScores() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}'),
      );

      scoreMap = jsonDecode(response.body.toString());
      scoreData = scoreMap["data"];
      sugamScore = scoreData["scorecard"].length > 1?(scoreData["scorecard"][0]["batting"] +
          scoreData["scorecard"][1]["batting"]):scoreData["scorecard"][0]["batting"];
      sugamScore.sort((a, b) {
        return a['r'].compareTo(b['r']) as int;
      });
      sugamWicket = scoreData["scorecard"].length > 1?(scoreData["scorecard"][0]["bowling"] +
          scoreData["scorecard"][1]["bowling"]): scoreData["scorecard"][0]["bowling"];
      sugamWicket.sort((a, b) {
        return a['w'].compareTo(b['w']) as int;
      });
      scoreOrderData = sugamScore.reversed.toList();
      wicketOrderData = sugamWicket.reversed.toList();
      if (response.statusCode == 200) {
        return scoreData;
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
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: FutureBuilder(
            future: getSingleCricketMatchDetails(),
            builder: (context, snapshot) {
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return FutureBuilder(
                  future: getFantasyPoints(),
                  builder: (context, snapshot) {
                    if (fantasyData == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return FutureBuilder(
                        future: getMatchScores(),
                        builder: (context, snapshot) {
                          if (scoreData == null) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return SingleChildScrollView(
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
                                    Container(
                                      height: 1,
                                      width: 350,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        height: 160,
                                        width: 400,
                                        color: Colors.blueGrey[900],
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  alignment: Alignment.topRight,
                                                  margin: EdgeInsets.only(
                                                      right: 25),
                                                  child: Image.asset(
                                                      "assets/volume.png")),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 25),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 25,
                                                              backgroundImage: NetworkImage(data["score"][data["score"].length - 1]["inning"].substring(0, (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1) ? data["score"][data["score"].length - 1]["inning"].indexOf(" ") : data["score"][data["score"].length - 1]["inning"].length) ==
                                                                      data["teamInfo"][0]["name"].substring(
                                                                          0,
                                                                          (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                                              ? data["teamInfo"][0]["name"].indexOf(
                                                                                  " ")
                                                                              : data["teamInfo"][0]["name"]
                                                                                  .length)
                                                                  ? data["teamInfo"]
                                                                      [0]["img"]
                                                                  : data["teamInfo"]
                                                                          [1]
                                                                      ["img"]),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              // ignore: prefer_const_literals_to_create_immutables
                                                              children: [
                                                                Text(
                                                                  data["score"][data["score"].length - 1]["inning"].substring(0, (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1) ? data["score"][data["score"].length - 1]["inning"].indexOf(" ") : data["score"][data["score"].length - 1]["inning"].length) == data["teamInfo"][0]["name"].substring(0, (data["teamInfo"][0]["name"].indexOf(" ") != -1) ? data["teamInfo"][0]["name"].indexOf(" ") : data["teamInfo"][0]["name"].length)
                                                                      ? data["teamInfo"]
                                                                              [
                                                                              0]
                                                                          [
                                                                          "shortname"]
                                                                      : data["teamInfo"]
                                                                              [
                                                                              1]
                                                                          [
                                                                          "shortname"],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  '${data["score"][(data["score"].length) - 1]["r"]}-${data["score"][(data["score"].length) - 1]["w"]}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              // ignore: prefer_const_literals_to_create_immutables
                                                              children: [
                                                                Text(
                                                                  ((data["score"].length / 2)
                                                                              .round()) ==
                                                                          1
                                                                      ? '${(data["score"].length / 2).round()}st inn'
                                                                      : '${(data["score"].length / 2).round()}nd inn',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  data["score"][
                                                                          (data["score"].length) -
                                                                              1]["o"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 80,
                                                    ),
                                                    Text(
                                                      '4',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.amber,
                                                          fontSize: 50),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                height: 2,
                                                width: 400,
                                                color: Colors.blueGrey[500],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    'CCR : ' +
                                                        (data["score"][(data[
                                                                            "score"]
                                                                        .length) -
                                                                    1]["r"] /
                                                                data["score"][
                                                                    (data["score"]
                                                                            .length) -
                                                                        1]["o"])
                                                            .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.5),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    data["matchType"] != "test"
                                                        ? 'RRR : 8.58'
                                                        : "",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.5),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                  ),
                                                  Image.asset(
                                                      'assets/live_tv.png')
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                'Over 2',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '4',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '4',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '=',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                '10',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 1,
                                          color: Colors.blueGrey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                'Over 3',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '2',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '4',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 5,
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '=',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                '6',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 9, left: 20),
                                          child: Text(
                                            'Top Fantasy Points',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 12, left: 10),
                                          child: CircleAvatar(
                                            radius: 2,
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 6, left: 8),
                                          child: Text(
                                            'LIVE',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.only(left: 145, top: 6),
                                        //   child: Text(
                                        //     'See All  >',
                                        //     style: TextStyle(
                                        //         color: Colors.white, fontSize: 12),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(left: 25),
                                      width: 320,
                                      height: 100,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: fantasyData["totals"].length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Opacity(
                                            opacity: 0.8,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.blueGrey[900],
                                              ),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    right: -6,
                                                    child: Image.network(
                                                      "https://cdn.dribbble.com/users/1519354/screenshots/9237401/media/bfdbbc44670c08055e05e6edee9774a9.jpg",
                                                      height: 125,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Positioned(
                                                      left: 28,
                                                      top: 25,
                                                      child: Column(
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          Container(
                                                            width: 55,
                                                            child: Center(
                                                              child: Text(
                                                                fantasyData["totals"]
                                                                            [
                                                                            index]
                                                                        ["name"]
                                                                    .substring(
                                                                        0,
                                                                        fantasyData["totals"][index]["name"]
                                                                            .indexOf(" "))
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            fantasyData["totals"]
                                                                        [index]
                                                                    ["points"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            "Pts",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.only(left: 25),
                                    //   alignment: Alignment.bottomLeft,
                                    //   child: Text(
                                    //     'Match Updates',
                                    //     style: TextStyle(color: Colors.white),
                                    //   ),
                                    // ),
                                    // Container(
                                    //   margin: EdgeInsets.only(left: 10, right: 10),
                                    //   height: 160,
                                    //   child: ListView.builder(
                                    //     scrollDirection: Axis.horizontal,
                                    //     physics: const ClampingScrollPhysics(),
                                    //     shrinkWrap: true,
                                    //     itemCount: 5,
                                    //     itemBuilder:
                                    //         (BuildContext context, int index) {
                                    //       return Opacity(
                                    //         opacity: 0.8,
                                    //         child: Container(
                                    //           margin:
                                    //               EdgeInsets.only(left: 15, top: 10),
                                    //           child: ClipRRect(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(5),
                                    //             child: Container(
                                    //               alignment: Alignment.topCenter,
                                    //               height: 80,
                                    //               width: 150,
                                    //               color: Colors.blueGrey[900],
                                    //               child: Column(
                                    //                 children: [
                                    //                   Image.asset(
                                    //                       'assets/cricket3.jpg'),
                                    //                   SizedBox(
                                    //                     height: 5,
                                    //                   ),
                                    //                   Padding(
                                    //                     padding:
                                    //                         const EdgeInsets.all(8.0),
                                    //                     child: Text(
                                    //                       'Good news!Pakistan-india test match to commence today',
                                    //                       style: TextStyle(
                                    //                           color: Colors.white,
                                    //                           fontSize: 11),
                                    //                     ),
                                    //                   )
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 20),
                                          child: Text(
                                            'Player Stats in Series',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 145),
                                          child: Text(
                                            'Analysis >',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    DefaultTabController(
                                      length: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 35,
                                            child: TabBar(
                                                isScrollable: true,
                                                indicatorSize:
                                                    TabBarIndicatorSize.label,
                                                indicator: BoxDecoration(
                                                    // ignore: prefer_const_constructors
                                                    color: Color(0xFFFF4D00),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                unselectedLabelColor:
                                                    Colors.white,
                                                labelColor: Colors.white,
                                                tabs: [
                                                  Container(
                                                    alignment: Alignment.center,

                                                    height: 30, width: 100,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    // ignore: prefer_const_constructors
                                                    child: Tab(
                                                      text: ('Fantasy Points'),
                                                    ),
                                                  ),
                                                  // ignore: prefer_const_constructors
                                                  Container(
                                                    alignment: Alignment.center,
                                                    // margin: EdgeInsets.only(left: 10),
                                                    width: 80,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    // ignore: prefer_const_constructors
                                                    child: Tab(
                                                      text: ('Most Runs'),
                                                    ),
                                                  ),
                                                  // ignore: prefer_const_constructors
                                                  Container(
                                                    alignment: Alignment.center,
                                                    // margin: EdgeInsets.only(left: 10),
                                                    width: 95,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    // ignore: prefer_const_constructors
                                                    child: Tab(
                                                      text: ('Most Wickets'),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 15, top: 15, right: 10),
                                            height: 1,
                                            width: 330,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 220,
                                            child: TabBarView(
                                                children: <Widget>[
                                                  ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: 3,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                            left: 25),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  height: 35,
                                                                  width: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 35,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  children: [
                                                                    Text(
                                                                      pointsOrderData[
                                                                              index]
                                                                          [
                                                                          "name"],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 25,
                                                                ),
                                                                Spacer(),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              35),
                                                                  child: Column(
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    children: [
                                                                      Text(
                                                                        pointsOrderData[index]["points"]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontSize: 12),
                                                                      ),
                                                                      Text(
                                                                        'Points',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontSize: 12),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              height: 1,
                                                              width: 320,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: 3,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                            left: 25),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  height: 35,
                                                                  width: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 35,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  children: [
                                                                    Text(
                                                                      scoreOrderData[index]
                                                                              [
                                                                              "batsman"]
                                                                          [
                                                                          "name"],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      scoreOrderData[
                                                                              index]
                                                                          [
                                                                          "dismissal-text"],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 25,
                                                                ),
                                                                Spacer(),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              35),
                                                                  child: Column(
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    children: [
                                                                      Text(
                                                                        scoreOrderData[index]["r"]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontSize: 12),
                                                                      ),
                                                                      Text(
                                                                        'Runs',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontSize: 12),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              height: 1,
                                                              width: 320,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: 3,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                            left: 25),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  height: 35,
                                                                  width: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 35,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  children: [
                                                                    Text(
                                                                      wicketOrderData[index]
                                                                              [
                                                                              "bowler"]
                                                                          [
                                                                          "name"],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      "${wicketOrderData[
                                                                              index]
                                                                          [
                                                                          "o"]} Overs",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 25,
                                                                ),
                                                                Spacer(),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              35),
                                                                  child: Column(
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    children: [
                                                                      Text(
                                                                        wicketOrderData[index]["w"]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontSize: 15),
                                                                      ),
                                                                      Text(
                                                                        'Wickets',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontSize: 12),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              height: 1,
                                                              width: 320,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ]),
                                          )
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       margin: EdgeInsets.only(
                                    //           left: 15, top: 20),
                                    //       child: Text(
                                    //         'Fantasy Top Picks',
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontWeight: FontWeight.w500,
                                    //             fontSize: 13),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       margin: EdgeInsets.only(
                                    //           top: 20, left: 170),
                                    //       child: Text(
                                    //         'See All >',
                                    //         style: TextStyle(
                                    //             color: Colors.blue,
                                    //             fontWeight: FontWeight.w500,
                                    //             fontSize: 13),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Opacity(
                                    //   opacity: 0.8,
                                    //   child: Container(
                                    //     height: 140,
                                    //     width: 320,
                                    //     color: Colors.blueGrey[900],
                                    //     child: Column(
                                    //       children: [
                                    //         Row(
                                    //           children: [
                                    //             Container(
                                    //               margin: EdgeInsets.only(
                                    //                   left: 17, top: 15),
                                    //               height: 35,
                                    //               width: 35,
                                    //               decoration: BoxDecoration(
                                    //                   border: Border.all(
                                    //                       color: Colors.white)),
                                    //               child: Icon(
                                    //                 Icons.person,
                                    //                 color: Colors.white,
                                    //                 size: 35,
                                    //               ),
                                    //             ),
                                    //             Container(
                                    //               margin:
                                    //                   EdgeInsets.only(left: 10),
                                    //               child: Text(
                                    //                 'Oliver Edward Robinson',
                                    //                 style: TextStyle(
                                    //                     color: Colors.white,
                                    //                     fontWeight:
                                    //                         FontWeight.w500,
                                    //                     fontSize: 13),
                                    //               ),
                                    //             ),
                                    //             Container(
                                    //               margin:
                                    //                   EdgeInsets.only(left: 10),
                                    //               child: CircleAvatar(
                                    //                 backgroundImage: AssetImage(
                                    //                     "assets/pakistan.jpg"),
                                    //               ),
                                    //             )
                                    //           ],
                                    //         ),
                                    //         Row(
                                    //           children: [
                                    //             Container(
                                    //               margin:
                                    //                   EdgeInsets.only(left: 65),
                                    //               child: Text(
                                    //                 'Bowler',
                                    //                 style: TextStyle(
                                    //                     color: Colors.white,
                                    //                     fontSize: 12),
                                    //               ),
                                    //             ),
                                    //             Container(
                                    //               margin:
                                    //                   EdgeInsets.only(left: 30),
                                    //               child: Text(
                                    //                 'Pakistan',
                                    //                 style: TextStyle(
                                    //                     color: Colors.white,
                                    //                     fontSize: 12),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //         Container(
                                    //           height: 1,
                                    //           width: 340,
                                    //           color: Colors.white,
                                    //         ),
                                    //         Row(
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.start,
                                    //           children: [
                                    //             Container(
                                    //               width: 75,
                                    //               margin: EdgeInsets.only(
                                    //                   left: 5, top: 20),
                                    //               child: Text(
                                    //                 'Test Recent Form >',
                                    //                 style: TextStyle(
                                    //                     color: Colors.white,
                                    //                     fontSize: 11),
                                    //               ),
                                    //             ),
                                    //             Container(
                                    //               margin: EdgeInsets.only(
                                    //                   left: 10, top: 15),
                                    //               height: 35,
                                    //               width: 1,
                                    //               color: Colors.white,
                                    //             ),
                                    //             Column(
                                    //               children: [
                                    //                 Container(
                                    //                   width: 50,
                                    //                   margin: EdgeInsets.only(
                                    //                       left: 5, top: 20),
                                    //                   child: Text(
                                    //                     '158(168)',
                                    //                     style: TextStyle(
                                    //                         color: Colors.white,
                                    //                         fontSize: 11,
                                    //                         fontWeight:
                                    //                             FontWeight
                                    //                                 .w500),
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   'vs SA',
                                    //                   style: TextStyle(
                                    //                       color: Colors.white,
                                    //                       fontSize: 11,
                                    //                       fontWeight:
                                    //                           FontWeight.w500),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //             Container(
                                    //               margin: EdgeInsets.only(
                                    //                   left: 10, top: 15),
                                    //               height: 35,
                                    //               width: 1,
                                    //               color: Colors.white,
                                    //             ),
                                    //             Column(
                                    //               children: [
                                    //                 Container(
                                    //                   width: 50,
                                    //                   margin: EdgeInsets.only(
                                    //                       left: 5, top: 20),
                                    //                   child: Text(
                                    //                     '158(168)',
                                    //                     style: TextStyle(
                                    //                         color: Colors.white,
                                    //                         fontSize: 11,
                                    //                         fontWeight:
                                    //                             FontWeight
                                    //                                 .w500),
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   'vs SA',
                                    //                   style: TextStyle(
                                    //                       color: Colors.white,
                                    //                       fontSize: 11,
                                    //                       fontWeight:
                                    //                           FontWeight.w500),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //             Container(
                                    //               margin: EdgeInsets.only(
                                    //                   left: 10, top: 15),
                                    //               height: 35,
                                    //               width: 1,
                                    //               color: Colors.white,
                                    //             ),
                                    //             Column(
                                    //               children: [
                                    //                 Container(
                                    //                   width: 50,
                                    //                   margin: EdgeInsets.only(
                                    //                       left: 5, top: 20),
                                    //                   child: Text(
                                    //                     '158(168)',
                                    //                     style: TextStyle(
                                    //                         color: Colors.white,
                                    //                         fontSize: 11,
                                    //                         fontWeight:
                                    //                             FontWeight
                                    //                                 .w500),
                                    //                   ),
                                    //                 ),
                                    //                 Text(
                                    //                   'vs SA',
                                    //                   style: TextStyle(
                                    //                       color: Colors.white,
                                    //                       fontSize: 11,
                                    //                       fontWeight:
                                    //                           FontWeight.w500),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   // ignore: prefer_const_literals_to_create_immutables
                                    //   children: [
                                    //     Icon(
                                    //       Icons.circle,
                                    //       color: Colors.white,
                                    //       size: 8,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 2,
                                    //     ),
                                    //     Icon(
                                    //       Icons.circle,
                                    //       color: Colors.red,
                                    //       size: 8,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 2,
                                    //     ),
                                    //     Icon(
                                    //       Icons.circle,
                                    //       color: Colors.white,
                                    //       size: 8,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 2,
                                    //     ),
                                    //     Icon(
                                    //       Icons.circle,
                                    //       color: Colors.white,
                                    //       size: 8,
                                    //     ),
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "Team Analysis",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              "(Based on last 5 matches)",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 15, left: 25, right: 25),
                                        child: Table(
                                          border: TableBorder.all(
                                              width: 1,
                                              color:
                                                  Colors.white), //table border
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            // ignore: prefer_const_literals_to_create_immutables
                                            TableRow(children: [
                                              TableCell(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                child: Text(
                                                  "Bat/ Bowl Fronts",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin: EdgeInsets.only(top: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage: AssetImage(
                                                          "assets/pakistan.jpg"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      "PAK",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin: EdgeInsets.only(top: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage: AssetImage(
                                                          "assets/india.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      "IND",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]),
                                            // ignore: prefer_const_literals_to_create_immutables
                                            TableRow(children: [
                                              TableCell(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                child: Text(
                                                  "Team Opening",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]),
                                            // ignore: prefer_const_literals_to_create_immutables
                                            TableRow(children: [
                                              TableCell(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                child: Text(
                                                  "Middle Order",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]),
                                            // ignore: prefer_const_literals_to_create_immutables
                                            TableRow(children: [
                                              TableCell(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                child: Text(
                                                  "Batting Depth",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                child: Text(
                                                  "Pace Bowling",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                height: 42,
                                                child: Text(
                                                  "Spin Bowling",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                              TableCell(
                                                  child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1),
                                                        color: Colors.amber,
                                                      ),
                                                      height: 8,
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ]),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "Pace vs Spain",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              "(Last 10 matches)",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 60),
                                            child: Text(
                                              'Venue Details >',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        color: Colors.blueGrey[900],
                                        width: 300,
                                        height: 75,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  "Pace",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  height: 3.5,
                                                  width: 65,
                                                  color: Colors.amber,
                                                ),
                                                Container(
                                                  height: 3.5,
                                                  width: 65,
                                                  color: Colors.orange,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Spain",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  "156 Wkts",
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontSize: 13),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                    "67%",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                    "33%",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "77 Wkts",
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                );
              }
            },
          )),
    );
  }
}
