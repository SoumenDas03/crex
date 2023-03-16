// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'dart:ui';

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// ignore: camel_case_types
class commententary extends StatefulWidget {
  const commententary({Key? key, required this.id, required this.theme}) : super(key: key);

  final String id;
  final String theme;

  @override
  State<commententary> createState() => _commententaryState();
}

// ignore: camel_case_types
class _commententaryState extends State<commententary> {
      var map,
        // ignore: prefer_typing_uninitialized_variables
        data,
        scoreMap,
        scoreData,
        wicketData,
        playerInfoMap,
        playerInfoData,
        bbbmap,
        bbbData,
        reversebbbData;
    getSingleCricketMatchDetails() async {
      try {
        http.Response response = await http.get(
          Uri.parse(
              'https://api.cricapi.com/v1/match_scorecard?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}'),
        );

        map = jsonDecode(response.body.toString());
        data = map["data"];
        if (response.statusCode == 200) {
          // ignore: avoid_print
          print("success");
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

    getBallByBall() async {
      try {
        http.Response response = await http.get(
          Uri.parse(
              'https://api.cricapi.com/v1/match_bbb?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}'),
        );

        bbbmap = jsonDecode(response.body.toString());
        bbbData = bbbmap["data"] != null ? bbbmap["data"] : bbbmap["status"];
        if (bbbData != "failure") {
          reversebbbData = bbbData["bbb"].reversed.toList();
        }
        if (response.statusCode == 200) {          
          return bbbData;
          // ignore: use_build_context_synchronously
        } else {
          print('failed');
        }
      } catch (e) {
        print(e.toString());
      }
    }

    getPlayerInfo(String id) async {
      try {
        http.Response response = await http.get(Uri.parse(
            'https://api.cricapi.com/v1/players_info?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=$id'));

        playerInfoMap = jsonDecode(response.body.toString());
        playerInfoData = playerInfoMap["data"];
        if (response.statusCode == 200) {
          return playerInfoData;
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
        scoreData = scoreMap["data"]["scorecard"].length > 1
            ? (scoreMap["data"]["scorecard"][0]["batting"] +
                    scoreMap["data"]["scorecard"][1]["batting"])
                .where((element) =>
                    element["dismissal-text"] == "batting" ||
                    element["dismissal-text"] == "not out")
                .toList()
            : scoreMap["data"]["scorecard"][0]["batting"]
                .where((element) =>
                    element["dismissal-text"] == "batting" ||
                    element["dismissal-text"] == "not out")
                .toList();

        wicketData = scoreMap["data"]["scorecard"].length > 1
            ? (scoreMap["data"]["scorecard"][0]["bowling"] +
                scoreMap["data"]["scorecard"][1]["bowling"])
            : (scoreMap["data"]["scorecard"][0]["bowling"]);

        wicketData.sort((a, b) {
          return a['w'].compareTo(b['w']) as int;
        });

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
    final isDarkMode = widget.theme == "dark";
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
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
              future: getMatchScores(),
              builder: (context, snapshot) {
                if (scoreData == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ),
                  );
                } else {
                  return FutureBuilder(
                    future: getBallByBall(),
                    builder: (context, snapshot) {
                      if (bbbData == null) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Container(
                            alignment: Alignment.center,
                            // ignore: prefer_const_constructors
                            decoration: BoxDecoration(
                              // ignore: prefer_const_constructors
                              image: DecorationImage(
                                // ignore: prefer_const_constructors
                                image: isDarkMode
                                    ? AssetImage('assets/background.jpeg')
                                    : AssetImage("assets/bgLightMode.png"),
                                fit: BoxFit.fill,
                              ),
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
                                Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: isDarkMode
                                      ? Color(0xff258D50)
                                      : const Color(0xFFDFDFDF),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(right: 25),
                                            child: isDarkMode
                                                ? Image.asset(
                                                    "assets/volume.png")
                                                : Image.asset(
                                                    "assets/volume.png",
                                                    color: Colors.grey,
                                                  )),
                                        Container(
                                          margin: EdgeInsets.only(right: 25),
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
                                                        backgroundImage: NetworkImage(data["score"][data["score"].length - 1]["inning"].substring(
                                                                    0,
                                                                    (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1)
                                                                        ? data["score"][data["score"].length - 1]["inning"].indexOf(
                                                                            " ")
                                                                        : data["score"][data["score"].length - 1]["inning"]
                                                                            .length) ==
                                                                data["teamInfo"][0]
                                                                        ["name"]
                                                                    .substring(
                                                                        0,
                                                                        (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                                            ? data["teamInfo"][0]["name"].indexOf(" ")
                                                                            : data["teamInfo"][0]["name"].length)
                                                            ? data["teamInfo"][0]["img"]
                                                            : data["teamInfo"][1]["img"]),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          Text(
                                                            data["score"][data["score"].length - 1]["inning"].substring(
                                                                        0,
                                                                        (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1)
                                                                            ? data["score"][data["score"].length - 1]["inning"].indexOf(
                                                                                " ")
                                                                            : data["score"][data["score"].length - 1]["inning"]
                                                                                .length) ==
                                                                    data["teamInfo"][0]["name"].substring(
                                                                        0,
                                                                        (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                                            ? data["teamInfo"][0]["name"].indexOf(
                                                                                " ")
                                                                            : data["teamInfo"][0]["name"]
                                                                                .length)
                                                                ? data["teamInfo"]
                                                                        [0]
                                                                    ["shortname"]
                                                                : data["teamInfo"][1]["shortname"],
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            '${data["score"][(data["score"].length) - 1]["r"]}-${data["score"][(data["score"].length) - 1]["w"]}',
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 20,
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
                                                            ((data["score"].length /
                                                                            2)
                                                                        .round()) ==
                                                                    1
                                                                ? '${(data["score"].length / 2).round()}st inn'
                                                                : '${(data["score"].length / 2).round()}nd inn',
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 12),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            data["score"][(data[
                                                                            "score"]
                                                                        .length) -
                                                                    1]["o"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 12,
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
                                               bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      1][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  1]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: isDarkMode
                                                        ? Colors.amber
                                                        : Colors.blueGrey,
                                                    fontSize: 50),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                            height: 1,
                                            width: 400,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.grey),
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
                                              'CCR : ' +
                                                  (data["score"][(data["score"]
                                                                  .length) -
                                                              1]["r"] /
                                                          data["score"][
                                                              (data["score"]
                                                                      .length) -
                                                                  1]["o"])
                                                      .toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
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
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 15.5),
                                            ),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Image.asset('assets/live_tv.png')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    bbbData != "failure"
                                                    ? ('Over ' +
                                                        bbbData["bbb"][bbbData[
                                                                        "bbb"]
                                                                    .length -
                                                                8]["over"]
                                                            .toString())
                                                    : "Over 15",
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  12]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  11]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  10]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  9]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  8]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  7]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
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
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    bbbData != "failure" ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      1][
                                                                  "dismissal"] ==
                                                              null ? (bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  7]["runs"] + 
                                                             bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  8]["runs"] + bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  9]["runs"] + 
                                                                  bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  10]["runs"] + 
                                                                  bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  11]["runs"] + 
                                                                  bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  12]["runs"]).toString()
                                                          : "8"
                                                      : "1",
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 1,
                                              color: Colors.blueGrey,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    bbbData != "failure"
                                                    ? ('Over ' +
                                                        bbbData["bbb"][bbbData[
                                                                        "bbb"]
                                                                    .length -
                                                                1]["over"]
                                                            .toString())
                                                    : "Over 15",
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      6][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  6]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  5]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      4][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  4]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      3][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  3]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                      bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      2][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  2]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    radius: 5,
                                                    child: Text(
                                                     bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      1][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  1]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.black
                                                              : Colors.white,
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
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(                                                    
                                                    bbbData != "failure" ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      1][
                                                                  "dismissal"] ==
                                                              null ? (bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  1]["runs"] + 
                                                             bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  2]["runs"] + bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  3]["runs"] + 
                                                                  bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  4]["runs"] + 
                                                                  bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  5]["runs"] + 
                                                                  bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  6]["runs"]).toString()
                                                          : "8"
                                                      : "1",
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                        border: Border.all(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                            width: 0.5)),
                                                    child: FutureBuilder(
                                                      future: getPlayerInfo(
                                                          scoreData[0][
                                                                      "batsman"]
                                                                  ["id"]
                                                              .toString()),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (playerInfoData ==
                                                            null) {
                                                          return CircleAvatar(
                                                            radius: 32,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    'https://cdn.dribbble.com/users/1519354/screenshots/9237401/media/bfdbbc44670c08055e05e6edee9774a9.jpg'),
                                                          );
                                                        } else {
                                                          return CircleAvatar(
                                                            radius: 32,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    playerInfoData[
                                                                        "playerImg"]),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      scoreData[0]["batsman"]
                                                          ["name"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    scoreData[0]["r"]
                                                            .toString() +
                                                        "(" +
                                                        scoreData[0]["b"]
                                                            .toString() +
                                                        ")" +
                                                        '*',
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 45,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                        border: Border.all(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                            width: 0.5)),
                                                    child: FutureBuilder(
                                                      future: getPlayerInfo(
                                                          scoreData.length > 1 ? scoreData[1][
                                                                      "batsman"]
                                                                  ["id"]
                                                              .toString(): scoreData[0][
                                                                      "batsman"]
                                                                  ["id"]
                                                              .toString()),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (playerInfoData ==
                                                            null) {
                                                          return CircleAvatar(
                                                            radius: 32,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    'https://cdn.dribbble.com/users/1519354/screenshots/9237401/media/bfdbbc44670c08055e05e6edee9774a9.jpg'),
                                                          );
                                                        } else {
                                                          return CircleAvatar(
                                                            radius: 32,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    playerInfoData[
                                                                        "playerImg"]),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      scoreData.length > 1 ? scoreData[1]["batsman"]
                                                          ["name"]: scoreData[0]["batsman"]
                                                          ["name"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    scoreData.length > 1? scoreData[1]["r"]
                                                            .toString() +
                                                        "(" +
                                                        scoreData[1]["b"]
                                                            .toString() +
                                                        ")": scoreData[0]["r"]
                                                            .toString() +
                                                        "(" +
                                                        scoreData[0]["b"]
                                                            .toString() +
                                                        ")",
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25, right: 25),
                                                child: Container(
                                                  height: 110,
                                                  width: 1,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                        border: Border.all(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                            width: 0.5)),
                                                    child: FutureBuilder(
                                                      future: getPlayerInfo(
                                                          wicketData[wicketData
                                                                      .indexOf(
                                                                          wicketData
                                                                              .last)]
                                                                  [
                                                                  "bowler"]["id"]
                                                              .toString()),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (playerInfoData ==
                                                            null) {
                                                          return CircleAvatar(
                                                            radius: 32,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    'https://cdn.dribbble.com/users/1519354/screenshots/9237401/media/bfdbbc44670c08055e05e6edee9774a9.jpg'),
                                                          );
                                                        } else {
                                                          return CircleAvatar(
                                                            radius: 32,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    playerInfoData[
                                                                        "playerImg"]),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      wicketData[wicketData
                                                              .indexOf(
                                                                  wicketData
                                                                      .last)]
                                                          ["bowler"]["name"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    wicketData[wicketData.indexOf(
                                                                wicketData
                                                                    .last)]["r"]
                                                            .toString() +
                                                        '-' +
                                                        wicketData[wicketData
                                                                .indexOf(wicketData
                                                                    .last)]["w"]
                                                            .toString() +
                                                        '(' +
                                                        wicketData[wicketData
                                                                .indexOf(wicketData
                                                                    .last)]["o"]
                                                            .toString() +
                                                        ')',
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        height: 1,
                                        width: 320,
                                        color: Colors.blueGrey[500],
                                      ),
                                      Row(
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
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: bbbData != "failure"
                                                      ? (bbbData["bbb"][bbbData["bbb"]
                                                                          .length -
                                                                      7][
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 7]
                                                                      [
                                                                      "runs"] ==
                                                                  4
                                                              ? Colors.amber
                                                              : bbbData["bbb"][bbbData["bbb"].length - 7]
                                                                          [
                                                                          "runs"] ==
                                                                      6
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .transparent)
                                                          : Colors.red)
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 0.5),
                                                ),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      7][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  7]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: bbbData != "failure"
                                                        ? bbbData["bbb"][bbbData["bbb"].length - 6]
                                                                    [
                                                                    "dismissal"] ==
                                                                null
                                                            ? (bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] ==
                                                                    4
                                                                ? Colors.amber
                                                                : bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] ==
                                                                        6
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .transparent)
                                                            : Colors.red
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        width: 0.5)),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      6][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  6]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '=',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '10',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              height: 28,
                                              width: 2,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                bbbData != "failure"
                                                    ? ('Over ' +
                                                        bbbData["bbb"][bbbData[
                                                                        "bbb"]
                                                                    .length -
                                                                1]["over"]
                                                            .toString())
                                                    : "Over 15",
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: bbbData != "failure"
                                                      ? (bbbData["bbb"][bbbData["bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 5]
                                                                      [
                                                                      "runs"] ==
                                                                  4
                                                              ? Colors.amber
                                                              : bbbData["bbb"][bbbData["bbb"].length - 5]
                                                                          [
                                                                          "runs"] ==
                                                                      6
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .transparent)
                                                          : Colors.red)
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 0.5),
                                                ),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      5][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  5]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: bbbData != "failure"
                                                        ? (bbbData["bbb"][bbbData["bbb"].length - 4][
                                                                    "dismissal"] ==
                                                                null
                                                            ? (bbbData["bbb"][bbbData["bbb"].length - 4][
                                                                        "runs"] ==
                                                                    4
                                                                ? Colors.amber
                                                                : bbbData["bbb"][bbbData["bbb"].length - 4]["runs"] ==
                                                                        6
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .transparent)
                                                            : Colors.red)
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        width: 0.5)),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      4][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  4]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData["bbb"]
                                                                          .length -
                                                                      3][
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 3]
                                                                      [
                                                                      "runs"] ==
                                                                  4
                                                              ? Colors.amber
                                                              : bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                          [
                                                                          "runs"] ==
                                                                      6
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .transparent)
                                                          : Colors.red
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 0.5),
                                                ),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      4][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  4]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData["bbb"]
                                                                          .length -
                                                                      3][
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 3]
                                                                      [
                                                                      "runs"] ==
                                                                  4
                                                              ? Colors.amber
                                                              : bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                          [
                                                                          "runs"] ==
                                                                      6
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .transparent)
                                                          : Colors.red
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 0.5),
                                                ),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      3][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  3]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData["bbb"]
                                                                          .length -
                                                                      2][
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 2]
                                                                      [
                                                                      "runs"] ==
                                                                  4
                                                              ? Colors.amber
                                                              : bbbData["bbb"][bbbData["bbb"].length - 2]
                                                                          [
                                                                          "runs"] ==
                                                                      6
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .transparent)
                                                          : Colors.red
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 0.5),
                                                ),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      2][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  2]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData["bbb"]
                                                                          .length -
                                                                      1][
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 1]
                                                                      [
                                                                      "runs"] ==
                                                                  4
                                                              ? Colors.amber
                                                              : bbbData["bbb"][bbbData["bbb"].length - 1]
                                                                          [
                                                                          "runs"] ==
                                                                      6
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .transparent)
                                                          : Colors.red
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 0.5),
                                                ),
                                                alignment: Alignment.center,
                                                height: 22,
                                                width: 22,
                                                child: Text(
                                                  bbbData != "failure"
                                                      ? bbbData["bbb"][bbbData[
                                                                              "bbb"]
                                                                          .length -
                                                                      1][
                                                                  "dismissal"] ==
                                                              null
                                                          ? bbbData[
                                                                  "bbb"][bbbData[
                                                                          "bbb"]
                                                                      .length -
                                                                  1]["runs"]
                                                              .toString()
                                                          : "W"
                                                      : "1",
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 1,
                                        width: 320,
                                        color: Colors.blueGrey[500],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                bbbData != "failure"? (reversebbbData.length > 50
                                                    ? 50
                                                    : reversebbbData.length): 5,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                        child: Text(
                                                          bbbData != "failure"
                                                              ? reversebbbData[
                                                                              index]
                                                                          [
                                                                          "over"]
                                                                      .toString() +
                                                                  "." +
                                                                  reversebbbData[
                                                                              index]
                                                                          [
                                                                          "ball"]
                                                                      .toString()
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: bbbData !=
                                                                  "failure"
                                                              ? reversebbbData[index]
                                                                          [
                                                                          "dismissal"] ==
                                                                      null
                                                                  ? (reversebbbData[index]
                                                                              [
                                                                              "runs"] ==
                                                                          4
                                                                      ? Colors
                                                                          .amber
                                                                      : reversebbbData[index]["runs"] ==
                                                                              6
                                                                          ? Colors
                                                                              .green
                                                                          : Colors
                                                                              .transparent)
                                                                  : Colors.red
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              width: 0.5),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 22,
                                                        width: 22,
                                                        child: Text(
                                                          bbbData != "failure"
                                                              ? reversebbbData[
                                                                              index]
                                                                          [
                                                                          "dismissal"] ==
                                                                      null
                                                                  ? reversebbbData[
                                                                              index]
                                                                          [
                                                                          "runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                      SizedBox(width: 30,),
                                                      Container(
                                                        width: 200,
                                                        child: Text(
                                                          bbbData != "failure"?  reversebbbData[index]["bowler"]["name"] + " to " + reversebbbData[index]["batsman"]["name"]:"Ball by ball data is not Available" 
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: 325,
                                                    color: Colors.blueGrey[500],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ], //hello
                                  ),
                                ),
                                // SizedBox(
                                //   height: 105,
                                // ),
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
      ),
    );
  }
}
