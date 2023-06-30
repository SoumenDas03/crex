// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, avoid_print, unnecessary_null_comparison

import 'dart:convert';
import 'dart:ui';

import 'package:crex/pages/singlePlayer_info.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// ignore: camel_case_types
class commententary extends StatefulWidget {
  const commententary({Key? key, required this.id, required this.theme})
      : super(key: key);

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
      reversebbbData,
      mapBetting;

      Future<void> apiFetch() async {
    var status = true;

    await Future.wait([
     getSingleCricketMatchDetails(),
     getMatchScores(),
     getBallByBall()
    ]).then((v) {
      for (var item in v) {
        print('$item \n');
      }
    }).whenComplete(() {
      status = false;
    });

    print(status == true ? 'Loading' : 'FINISHED');
  }
  
  Future getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=a8ee5579-8994-41ba-af5d-4e2fcd2e9e91&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      if (response.statusCode == 200) {
        // ignore: avoid_print
        setState(() {
          print("refreshing commentary....");
        });
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

  Future getBallByBall() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_bbb?apikey=a8ee5579-8994-41ba-af5d-4e2fcd2e9e91&id=${widget.id}'),
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
          'https://api.cricapi.com/v1/players_info?apikey=a8ee5579-8994-41ba-af5d-4e2fcd2e9e91&id=$id'));

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

  Future getMatchScores() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=a8ee5579-8994-41ba-af5d-4e2fcd2e9e91&id=${widget.id}'),
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

  getBettingPoints(String match_name) async {
    try {
      http.Response response = await http
          .post(Uri.parse('https://playexch.us/api/get-match-details'), body: {
        "match_name": match_name,
      });

      mapBetting = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        return mapBetting;
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
        future: apiFetch(),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }  else {
                        return FutureBuilder(
                          future: getBettingPoints(data["teams"][0].toString()),
                          builder: (context, snapshot) {
                            if (mapBetting == null) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              );
                            } else {
                              return SingleChildScrollView(
                                child: Container(
                                   // ignore: prefer_const_constructors
                                  color: Colors.black,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            height: 35,
                                            alignment: Alignment.centerRight,
                                            margin: EdgeInsets.only(left: 25),
                                            child: Container(
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/liveStreaming.png"),
                                                      fit: BoxFit.cover)),
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(right: 25),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                width: 50,
                                              ),
                                              SizedBox(
                                                width: bbbData != "failure"
                                                    ? bbbData["bbb"][bbbData[
                                                                        "bbb"]
                                                                    .length -
                                                                1]["dismissal"] ==
                                                            null
                                                        ? 20
                                                        : 0
                                                    : 20,
                                              ),
                                              bbbData != "failure"
                                                  ? bbbData["bbb"][bbbData["bbb"]
                                                                      .length -
                                                                  1]["runs"]
                                                              .toString() ==
                                                          "null" ? Text("1",
                                                          style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .amber
                                                                          : Colors
                                                                              .blueGrey,
                                                                      fontSize:
                                                                          50))
                                                  : bbbData["bbb"][bbbData["bbb"]
                                                                      .length -
                                                                  1]["runs"]
                                                              .toString() ==
                                                          "6"
                                                      ? Image.asset(
                                                          "assets/6.gif",
                                                          scale: 5,
                                                        )
                                                      : bbbData["bbb"][bbbData["bbb"].length -
                                                                      1]["runs"]
                                                                  .toString() ==
                                                              "4"
                                                          ? Image.asset(
                                                              "assets/4.gif",
                                                              scale: 5)
                                                          : bbbData["bbb"][bbbData["bbb"].length - 1]
                                                                      ["dismissal"] ==
                                                                  null
                                                              ? Text(
                                                                  bbbData !=
                                                                          "failure"
                                                                      ? bbbData["bbb"][bbbData["bbb"].length - 1]["dismissal"] ==
                                                                              null
                                                                          ? bbbData["bbb"][bbbData["bbb"].length - 1]["runs"]
                                                                              .toString()
                                                                          : "W"
                                                                      : "1",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .amber
                                                                          : Colors
                                                                              .blueGrey,
                                                                      fontSize:
                                                                          50),
                                                                )
                                                              : Image.asset(
                                                                  "assets/wicket.gif",
                                                                  scale: 5,
                                                                  height: 50,
                                                                )
                                                  : Text(
                                                      "1",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isDarkMode
                                                              ? Colors.amber
                                                              : Colors.blueGrey,
                                                          fontSize: 50),
                                                    ),
                                              Container(
                                                alignment: Alignment.topRight,
                                                margin: EdgeInsets.only(
                                                    left: 5,
                                                    bottom: 12,
                                                    top: 10),
                                                child: isDarkMode
                                                    ? Image.asset(
                                                        "assets/volume.png")
                                                    : Image.asset(
                                                        "assets/volume.png",
                                                        color: Colors.grey,
                                                      ),
                                              ),
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
                                              // ignore: prefer_interpolation_to_compose_strings
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
                                              width: 50,
                                            ),
                                            Text(
                                              data["score"].length > 1
                                                  ? data["score"][data["score"].length - 1]["inning"].substring(0, (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1) ? data["score"][data["score"].length - 1]["inning"].indexOf(" ") : data["score"][data["score"].length - 1]["inning"].length) ==
                                                          data["teamInfo"][0]["name"].substring(
                                                              0,
                                                              (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                                  ? data["teamInfo"][0]["name"]
                                                                      .indexOf(
                                                                          " ")
                                                                  : data["teamInfo"][0]["name"]
                                                                      .length)
                                                      ? data["score"].length > 2
                                                          ? data["teamInfo"][data["score"].length - 3]["shortname"] +
                                                              " " +
                                                              data["score"][data["score"].length - 3]["r"]
                                                                  .toString() +
                                                              "-" +
                                                              data["score"][data["score"].length - 3]["w"]
                                                                  .toString() +
                                                              "(" +
                                                              data["score"][data["score"].length - 3]["o"]
                                                                  .toString() +
                                                              ")"
                                                          : data["teamInfo"][data["score"].length - 1]
                                                                  ["shortname"] +
                                                              " " +
                                                              data["score"][data["score"].length - 2]["r"].toString() +
                                                              "-" +
                                                              data["score"][data["score"].length - 2]["w"].toString() +
                                                              "(" +
                                                              data["score"][data["score"].length - 2]["o"].toString() +
                                                              ")"
                                                      : data["teamInfo"][data["score"].length - 2]["shortname"] + " " + data["score"][data["score"].length - 2]["r"].toString() + "-" + data["score"][data["score"].length - 2]["w"].toString() + "(" + data["score"][data["score"].length - 2]["o"].toString() + ")"
                                                  : "",
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
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
                                                        ? bbbData["bbb"][bbbData[
                                                                            "bbb"]
                                                                        .length -
                                                                    8] !=
                                                                null
                                                            ? ('Over ${bbbData["bbb"][bbbData["bbb"].length - 8]["over"]}')
                                                            : "Over 1"
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
                                                                              .length -
                                                                          5][
                                                                      "dismissal"] ==
                                                                  null
                                                              ? bbbData["bbb"][
                                                                          bbbData["bbb"].length -
                                                                              8] !=
                                                                      null
                                                                  ? bbbData[
                                                                          "bbb"][bbbData["bbb"]
                                                                              .length -
                                                                          12]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1"
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                    bbbData != "failure"
                                                        ? bbbData["bbb"][bbbData["bbb"]
                                                                            .length -
                                                                        1][
                                                                    "dismissal"] ==
                                                                null
                                                            ? (bbbData["bbb"][bbbData["bbb"].length - 7][
                                                                        "runs"] ??
                                                                    1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 8]
                                                                            [
                                                                            "runs"] ??
                                                                    1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 9]
                                                                            ["runs"] ??
                                                                    1 + bbbData["bbb"][bbbData["bbb"].length - 10]["runs"] ??
                                                                    1 + bbbData["bbb"][bbbData["bbb"].length - 11]["runs"] ??
                                                                    1 + bbbData["bbb"][bbbData["bbb"].length - 12]["runs"] ??
                                                                    1)
                                                                .toString()
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
                                                        ? ('Over ${bbbData["bbb"][bbbData["bbb"].length - 1]["over"]}')
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                          ? bbbData["bbb"][bbbData["bbb"]
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
                                                    bbbData != "failure"
                                                        ? bbbData["bbb"][bbbData["bbb"].length - 1][
                                                                    "dismissal"] ==
                                                                null
                                                            ? (bbbData["bbb"][bbbData["bbb"].length - 1][
                                                                        "runs"] ??
                                                                    1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 2]
                                                                            [
                                                                            "runs"] ??
                                                                    1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                            [
                                                                            "runs"] ??
                                                                    1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 4]
                                                                            ["runs"] +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 5]["runs"] ??
                                                                    1 + bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] ??
                                                                    1)
                                                                .toString()
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
                                        SizedBox(height: 5),
                                      ],
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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  singlePlayer_info(
                                                                      playerId: scoreData[0]["batsman"]
                                                                              [
                                                                              "id"]
                                                                          .toString()),
                                                            ));
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32),
                                                                border: Border.all(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    width:
                                                                        0.5)),
                                                            child:
                                                                FutureBuilder(
                                                              future: getPlayerInfo(
                                                                  scoreData[0][
                                                                              "batsman"]
                                                                          ["id"]
                                                                      .toString()),
                                                              builder: (context,
                                                                  snapshot) {
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
                                                                            playerInfoData["playerImg"]),
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
                                                              scoreData[0][
                                                                      "batsman"]
                                                                  ["name"],
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
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
                                                                scoreData[0]
                                                                        ["b"]
                                                                    .toString() +
                                                                ")" +
                                                                '*',
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 12),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 45,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => singlePlayer_info(
                                                                  playerId: scoreData
                                                                              .length >
                                                                          1
                                                                      ? scoreData[1]["batsman"]
                                                                              [
                                                                              "id"]
                                                                          .toString()
                                                                      : scoreData[0]["batsman"]
                                                                              [
                                                                              "id"]
                                                                          .toString()),
                                                            ));
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32),
                                                                border: Border.all(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    width:
                                                                        0.5)),
                                                            child:
                                                                FutureBuilder(
                                                              future: getPlayerInfo(scoreData
                                                                          .length >
                                                                      1
                                                                  ? scoreData[1]
                                                                              [
                                                                              "batsman"]
                                                                          ["id"]
                                                                      .toString()
                                                                  : scoreData[0]
                                                                              [
                                                                              "batsman"]
                                                                          ["id"]
                                                                      .toString()),
                                                              builder: (context,
                                                                  snapshot) {
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
                                                                            playerInfoData["playerImg"]),
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
                                                              scoreData.length >
                                                                      1
                                                                  ? scoreData[1]
                                                                          [
                                                                          "batsman"]
                                                                      ["name"]
                                                                  : scoreData[0]
                                                                          [
                                                                          "batsman"]
                                                                      ["name"],
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            scoreData.length > 1
                                                                ? scoreData[1][
                                                                            "r"]
                                                                        .toString() +
                                                                    "(" +
                                                                    scoreData[1]
                                                                            [
                                                                            "b"]
                                                                        .toString() +
                                                                    ")"
                                                                : scoreData[0][
                                                                            "r"]
                                                                        .toString() +
                                                                    "(" +
                                                                    scoreData[0]
                                                                            [
                                                                            "b"]
                                                                        .toString() +
                                                                    ")",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 12),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 25,
                                                              right: 25),
                                                      child: Container(
                                                        height: 110,
                                                        width: 1,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                singlePlayer_info(
                                                                    playerId: wicketData[wicketData.indexOf(wicketData.last)]["bowler"]
                                                                            [
                                                                            "id"]
                                                                        .toString()),
                                                          ),
                                                        );
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32),
                                                                border: Border.all(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    width:
                                                                        0.5)),
                                                            child:
                                                                FutureBuilder(
                                                              future: getPlayerInfo(
                                                                  wicketData[wicketData.indexOf(wicketData.last)]
                                                                              [
                                                                              "bowler"]
                                                                          ["id"]
                                                                      .toString()),
                                                              builder: (context,
                                                                  snapshot) {
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
                                                                            playerInfoData["playerImg"]),
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
                                                                  [
                                                                  "bowler"]["name"],
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            wicketData[wicketData
                                                                            .indexOf(wicketData.last)]
                                                                        ["r"]
                                                                    .toString() +
                                                                '-' +
                                                                wicketData[wicketData
                                                                            .indexOf(wicketData.last)]
                                                                        ["w"]
                                                                    .toString() +
                                                                '(' +
                                                                wicketData[wicketData
                                                                        .indexOf(
                                                                            wicketData.last)]["o"]
                                                                    .toString() +
                                                                ')',
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height: 1,
                                              width: 320,
                                              color: Colors.blueGrey[500],
                                            ),
                                            Container(
                                              width: 320,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          bbbData != "failure"
                                                              ? ('Over ' +
                                                                  bbbData["bbb"]
                                                                          [
                                                                          bbbData["bbb"].length -
                                                                              28]["over"]
                                                                      .toString())
                                                              : "Over 15",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 29]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 29]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 29]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                29]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            29]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 28]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 28]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 28]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                28]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            28]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 27]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 27]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 27]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                27]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            27]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 26]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 26]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 26]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                26]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            26]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 25]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 25]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 25]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                25]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            25]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 24]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 24]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 24]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                24]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            24]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
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
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? bbbData["bbb"]
                                                                                  [bbbData["bbb"].length - 24][
                                                                              "dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 25]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 26]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 27]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 28]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 29]["dismissal"] ==
                                                                          null
                                                                  ? (bbbData["bbb"][bbbData["bbb"].length - 24]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 25]
                                                                              [
                                                                              "runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 26]
                                                                              ["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 27]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 28]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 29]["runs"])
                                                                      .toString()
                                                                  : "5"
                                                              : "8",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Container(
                                                            height: 28,
                                                            width: 2,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? ('Over ' +
                                                                  bbbData["bbb"]
                                                                          [
                                                                          bbbData["bbb"].length -
                                                                              21]["over"]
                                                                      .toString())
                                                              : "Over 15",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 23]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 23]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 23]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                23]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            23]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 22]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 22]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 22]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                22]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            22]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 21]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 21]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 21]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                21]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            21]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 20]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 20]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 20]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                20]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            20]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 19]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 19]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 19]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                19]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            19]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 18]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 18]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 18]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                18]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            18]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
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
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? bbbData["bbb"]
                                                                                  [bbbData["bbb"].length - 18][
                                                                              "dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 19]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 20]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 21]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 22]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 23]["dismissal"] ==
                                                                          null
                                                                  ? (bbbData["bbb"][bbbData["bbb"].length - 18]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 19]
                                                                              [
                                                                              "runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 20]
                                                                              ["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 21]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 22]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 23]["runs"])
                                                                      .toString()
                                                                  : "5"
                                                              : "8",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Container(
                                                            height: 28,
                                                            width: 2,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? ('Over ' +
                                                                  bbbData["bbb"]
                                                                          [
                                                                          bbbData["bbb"].length -
                                                                              14]["over"]
                                                                      .toString())
                                                              : "Over 15",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 17]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 17]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 17]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                17]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            17]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 16]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 16]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 16]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                16]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            16]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 15]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 15]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 15]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                15]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            15]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 14]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 14]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 14]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                14]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            14]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 13]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 13]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 13]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                13]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            13]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 12]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 12]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 12]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                12]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            12]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
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
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? bbbData["bbb"]
                                                                                  [bbbData["bbb"].length - 12][
                                                                              "dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 13]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 14]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 15]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 16]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 17]["dismissal"] ==
                                                                          null
                                                                  ? (bbbData["bbb"][bbbData["bbb"].length - 12]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 13]
                                                                              [
                                                                              "runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 14]
                                                                              ["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 15]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 16]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 17]["runs"])
                                                                      .toString()
                                                                  : "5"
                                                              : "8",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Container(
                                                            height: 28,
                                                            width: 2,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? ('Over ' +
                                                                  bbbData["bbb"]
                                                                          [
                                                                          bbbData["bbb"].length -
                                                                              8]["over"]
                                                                      .toString())
                                                              : "Over 15",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 11]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 11]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 11]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                11]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            11]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 10]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 10]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 10]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                10]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            10]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 9]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 9]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 9]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                9]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            9]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 8]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 8]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 8]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                8]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            8]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 7]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 7]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 7]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                7]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            7]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: bbbData !=
                                                                          "failure"
                                                                      ? bbbData["bbb"][bbbData["bbb"].length - 6]["dismissal"] ==
                                                                              null
                                                                          ? (bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] ==
                                                                                  4
                                                                              ? Colors
                                                                                  .amber
                                                                              : bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] ==
                                                                                      6
                                                                                  ? Colors
                                                                                      .green
                                                                                  : Colors
                                                                                      .transparent)
                                                                          : Colors
                                                                              .red
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30),
                                                                  border: Border.all(
                                                                      color: isDarkMode
                                                                          ? Colors.white
                                                                          : Colors.black,
                                                                      width: 0.5)),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 22,
                                                          width: 22,
                                                          child: Text(
                                                            bbbData != "failure"
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                6]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            6]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
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
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? bbbData["bbb"]
                                                                                  [bbbData["bbb"].length - 6][
                                                                              "dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 7]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 8]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 9]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 10]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 11]["dismissal"] ==
                                                                          null
                                                                  ? (bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 7]
                                                                              [
                                                                              "runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 8]
                                                                              ["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 9]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 10]["runs"] +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 11]["runs"])
                                                                      .toString()
                                                                  : "5"
                                                              : "8",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Container(
                                                        height: 28,
                                                        width: 2,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          bbbData != "failure"
                                                              ? ('Over ' +
                                                                  bbbData["bbb"]
                                                                          [
                                                                          bbbData["bbb"].length -
                                                                              1]["over"]
                                                                      .toString())
                                                              : "Over 15",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 5]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 5]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 5]["runs"] ==
                                                                                6
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .transparent)
                                                                    : Colors
                                                                        .red)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                5]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            5]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: bbbData !=
                                                                          "failure"
                                                                      ? (bbbData["bbb"][bbbData["bbb"].length - 4]["dismissal"] ==
                                                                              null
                                                                          ? (bbbData["bbb"][bbbData["bbb"].length - 4]["runs"] ==
                                                                                  4
                                                                              ? Colors
                                                                                  .amber
                                                                              : bbbData["bbb"][bbbData["bbb"].length - 4]["runs"] ==
                                                                                      6
                                                                                  ? Colors
                                                                                      .green
                                                                                  : Colors
                                                                                      .transparent)
                                                                          : Colors
                                                                              .red)
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30),
                                                                  border: Border.all(
                                                                      color: isDarkMode
                                                                          ? Colors.white
                                                                          : Colors.black,
                                                                      width: 0.5)),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 22,
                                                          width: 22,
                                                          child: Text(
                                                            bbbData != "failure"
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                4]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            4]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 3]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 3]["runs"] ==
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
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                4]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            4]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 3]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 3]["runs"] ==
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
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                3]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            3]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? bbbData["bbb"][bbbData["bbb"].length - 2]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 2]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 2]["runs"] ==
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
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                2]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            2]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: bbbData !=
                                                                    "failure"
                                                                ? bbbData["bbb"][bbbData["bbb"].length - 1]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? (bbbData["bbb"][bbbData["bbb"].length - 1]["runs"] ==
                                                                            4
                                                                        ? Colors
                                                                            .amber
                                                                        : bbbData["bbb"][bbbData["bbb"].length - 1]["runs"] ==
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
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
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
                                                                ? bbbData["bbb"][bbbData["bbb"].length -
                                                                                1]
                                                                            [
                                                                            "dismissal"] ==
                                                                        null
                                                                    ? bbbData[
                                                                            "bbb"][bbbData["bbb"]
                                                                                .length -
                                                                            1]["runs"]
                                                                        .toString()
                                                                    : "W"
                                                                : "1",
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
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
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          bbbData != "failure"
                                                              ? bbbData["bbb"]
                                                                                  [bbbData["bbb"].length - 1][
                                                                              "dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 2]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 3]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 4]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 5]["dismissal"] ==
                                                                          null ||
                                                                      bbbData["bbb"][bbbData["bbb"].length - 6]["dismissal"] ==
                                                                          null
                                                                  ? (bbbData["bbb"][bbbData["bbb"].length - 1]["runs"] ?? 1 +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 2]
                                                                              [
                                                                              "runs"] ?? 1 +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                              ["runs"] ?? 1 +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 4]["runs"] ?? 1 +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 5]["runs"] ?? 1 +
                                                                          bbbData["bbb"][bbbData["bbb"].length - 6]["runs"] ?? 1)
                                                                      .toString()
                                                                  : "5"
                                                              : "8",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
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
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: bbbData !=
                                                          "failure"
                                                      ? (reversebbbData.length >
                                                              50
                                                          ? reversebbbData.length
                                                          : reversebbbData
                                                              .length)
                                                      : 5,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                              child: Text(
                                                                bbbData !=
                                                                        "failure"
                                                                    ? reversebbbData[index]["over"]
                                                                            .toString() +
                                                                        "." +
                                                                        reversebbbData[index]["ball"]
                                                                            .toString()
                                                                    : "1",
                                                                style: TextStyle(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: bbbData !=
                                                                        "failure"
                                                                    ? reversebbbData[index]["dismissal"] ==
                                                                            null
                                                                        ? (reversebbbData[index]["runs"] ==
                                                                                4
                                                                            ? Colors.amber
                                                                            : reversebbbData[index]["runs"] == 6
                                                                                ? Colors.green
                                                                                : Colors.transparent)
                                                                        : Colors.red
                                                                    : Colors.transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                border: Border.all(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    width: 0.5),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 22,
                                                              width: 22,
                                                              child: Text(
                                                                bbbData !=
                                                                        "failure"
                                                                    ? reversebbbData[index]["dismissal"] ==
                                                                            null
                                                                        ? reversebbbData[index]["runs"]
                                                                            .toString()
                                                                        : "W"
                                                                    : "1",
                                                                style: TextStyle(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Container(
                                                              width: 100,
                                                              child: Text(
                                                                bbbData !=
                                                                        "failure"
                                                                    ? reversebbbData[index]["bowler"] !=
                                                                            null
                                                                        ? reversebbbData[index]["bowler"]["name"] +
                                                                            " to " +
                                                                            reversebbbData[index]["batsman"][
                                                                                "name"]
                                                                        : "Bowler" + " to " + reversebbbData[index]["batsman"]["name"] !=
                                                                                null
                                                                            ? reversebbbData[index]["batsman"]["name"]
                                                                            : "Batsman"
                                                                    : "Ball by ball data is not Available",
                                                                style:
                                                                    TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .white38),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 45,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(3),
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            236,
                                                                            219,
                                                                            63),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        data["score"][data["score"].length - 1]["inning"].substring(0, (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1) ? data["score"][data["score"].length - 1]["inning"].indexOf(" ") : data["score"][data["score"].length - 1]["inning"].length) ==
                                                                                data["teamInfo"][0]["name"].substring(0, (data["teamInfo"][0]["name"].indexOf(" ") != -1) ? data["teamInfo"][0]["name"].indexOf(" ") : data["teamInfo"][0]["name"].length)
                                                                            ? data["teamInfo"][0]["shortname"]
                                                                            : data["teamInfo"][1]["shortname"],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.black),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 45,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(3),
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            13,
                                                                            70,
                                                                            117),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        mapBetting["point"] !=
                                                                                ""
                                                                            ? mapBetting["point"][6].toString()
                                                                            : "0",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 35,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              3),
                                                                          color:
                                                                              Colors.green),
                                                                      child:
                                                                          Text(
                                                                        mapBetting["point"] !=
                                                                                ""
                                                                            ? mapBetting["point"][14].toString()
                                                                            : "1",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                          color: Colors
                                                              .blueGrey[500],
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
                  ),
       
    );
  }
}
