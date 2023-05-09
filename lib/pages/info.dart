// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, file_names, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:crex/pages/infoPlaying_xi_team.dart';
import 'package:crex/pages/playingXI.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class info extends StatefulWidget {
  const info({Key? key, required this.id, required this.theme})
      : super(key: key);

  final String id;
  final String theme;

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  var map, data, bbbmap, bbbData, data1, map1;
  List ranking = [
    {'class': 'A', 'total': 23},
    {'class': 'B', 'total': 14},
    {'class': 'C', 'total': 8},
    {'class': 'D', 'total': 7},
    {'class': 'E', 'total': 21},
  ];
  getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=dfe5a856-430f-49e9-99f4-6a994d3d76e8&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
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

  getNewsList() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://playexch.us/api/news-list'),
      );

      map1 = jsonDecode(response.body.toString());
      data1 = map1["userDetails"];
      if (response.statusCode == 200) {
        return data1;
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
            'https://api.cricapi.com/v1/match_bbb?apikey=dfe5a856-430f-49e9-99f4-6a994d3d76e8&id=${widget.id}'),
      );

      bbbmap = jsonDecode(response.body.toString());
      bbbData = bbbmap["data"] != null ? bbbmap["data"] : bbbmap["status"];
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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.theme == "dark";
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<ThemeChanger>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: getSingleCricketMatchDetails(),
            builder: (context, snapshot) {
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return FutureBuilder(
                  future: getBallByBall(),
                  builder: (context, snapshot) {
                    if (bbbData == null) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      );
                    } else {
                      return FutureBuilder(
                        future: getNewsList(),
                        builder: (context, snapshot) {
                          if (data1 == null) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return DefaultTabController(
                              length: 6,
                              child: SingleChildScrollView(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: isDarkMode
                                            ? AssetImage(
                                                "assets/background.jpeg")
                                            : AssetImage(
                                                "assets/bgLightMode.png"),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 1,
                                        width: 380,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 10,
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 10),

                                            height: 35,
                                            color: isDarkMode
                                                ? Color(0xFFFF4D00)
                                                : const Color(0xFFDFDFDF),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Center(
                                                child: Marquee(
                                                  showFadingOnlyWhenScrolling:
                                                      true,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  blankSpace: 60,
                                                  // fadingEdgeStartFraction: 0.3,
                                                  // fadingEdgeEndFraction: 0.3,
                                                  startAfter:
                                                      Duration(seconds: 2),
                                                  pauseAfterRound:
                                                      Duration(seconds: 2),
                                                  text: data1[0]["news"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 40,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10, left: 20),
                                                  child: Image.asset(
                                                    'assets/coin.png',
                                                    scale: 0.5,
                                                  ),
                                                ),
                                                Container(
                                                  width: 250,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    data["status"].toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 70,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      margin: EdgeInsets.only(
                                                          right: 200, top: 10),
                                                      child:
                                                          data["matchType"] !=
                                                                  null
                                                              ? Text(
                                                                  data["matchType"]
                                                                      .toUpperCase(),
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontSize:
                                                                          12),
                                                                )
                                                              : Text(""),
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      margin: EdgeInsets.only(
                                                          left: 15),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 270,
                                                            child: Text(
                                                              data["name"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 00),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_right,
                                                              size: 35,
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Container(
                                            height: 60,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  margin: EdgeInsets.only(
                                                      bottom: 20, left: 15),
                                                  child: Icon(
                                                    Icons.calendar_today,
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    size: 25,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    DateFormat("dd-MMM-yyyy")
                                                        .add_jm()
                                                        .format((DateFormat(
                                                                "yyyy-MM-ddTHH:mm:ss")
                                                            .parse(
                                                                data[
                                                                    "dateTimeGMT"],
                                                                true)
                                                            .toLocal()))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Container(
                                            height: 1,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          child: Container(
                                            height: 60,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  margin: EdgeInsets.only(
                                                      bottom: 20, left: 15),
                                                  child: Icon(
                                                    Icons.location_on_outlined,
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    size: 30,
                                                  ),
                                                ),
                                                Container(
                                                  width: 200,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    data["venue"],
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 8),
                                        child: Text(
                                          'Playing XI',
                                          style: TextStyle(
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 17),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    infoPlaying_xi_team(
                                                  id: widget.id,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: Container(
                                              height: 60,
                                              color: isDarkMode
                                                  ? Color.fromARGB(
                                                      255, 66, 63, 63)
                                                  : const Color(0xFFDFDFDF),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              data["teamInfo"]
                                                                  [0]["img"]),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 225,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      data["teamInfo"][0]
                                                          ["shortname"],
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      size: 35,
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Container(
                                            height: 1, color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  infoPlaying_xi_team(
                                                id: widget.id,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            child: Container(
                                              height: 60,
                                              color: isDarkMode
                                                  ? Color.fromARGB(
                                                      255, 66, 63, 63)
                                                  : const Color(0xFFDFDFDF),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              data["teamInfo"]
                                                                  [1]["img"]),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 225,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      (data["teamInfo"][1]
                                                          ["shortname"]),
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      size: 35,
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Container(
                                            height: 45,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    'Who will win?',
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 80),
                                                  child: Text(
                                                    'Total Votes:2,26,200',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Container(
                                            height: 1, color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          child: Container(
                                            height: 60,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    child: Container(
                                                      height: 28,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          color: Colors.amber,
                                                          border: Border.all(
                                                            color: Colors.amber,
                                                            width: 1,
                                                          )),
                                                      child: Center(
                                                        child: Text(
                                                          data["teamInfo"][0]
                                                              ["shortname"],
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 30),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    child: Container(
                                                      height: 28,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          color: isDarkMode
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  66,
                                                                  63,
                                                                  63)
                                                              : const Color(
                                                                  0xFFDFDFDF),
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 1,
                                                          )),
                                                      child: Center(
                                                        child: Text(
                                                          'DRAW',
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 40),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    child: Container(
                                                      height: 28,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          color: isDarkMode
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  25,
                                                                  103,
                                                                  28)
                                                              : Colors.grey,
                                                          border: Border.all(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    25,
                                                                    103,
                                                                    28),
                                                            width: 1,
                                                          )),
                                                      child: Center(
                                                        child: Text(
                                                          data["teamInfo"][1]
                                                              ["shortname"],
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
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
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            margin: EdgeInsets.only(
                                                top: 20, left: 40),
                                            child: Text(
                                              'Team from',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            margin: EdgeInsets.only(
                                                top: 20, left: 5),
                                            child: Text(
                                              '(last 5 matches)',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        margin: EdgeInsets.only(left: 30),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  data["teamInfo"][0]["img"]),
                                            ),
                                            Container(
                                              width: 125,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                data["teamInfo"][0]
                                                    ["shortname"],
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 17),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 13,
                                                  width: 13,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    border: Border.all(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '*',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(
                                                        color: Colors.red),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'L',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 27, 119, 30),
                                                    border: Border.all(
                                                        color: Colors.green),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'W',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(
                                                        color: Colors.red),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'L',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 234, 185, 40),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 234, 185, 40)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'd',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 234, 185, 40),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 234, 185, 40)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'd',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          height: 1,
                                          width: 290,
                                          color: Colors.white),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        margin: EdgeInsets.only(left: 30),
                                        child: Row(children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                data["teamInfo"][1]["img"]),
                                          ),
                                          Container(
                                            width: 125,
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              data["teamInfo"][1]["shortname"],
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Container(
                                                height: 13,
                                                width: 13,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '*',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  border: Border.all(
                                                      color: Colors.red),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'L',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 234, 185, 40),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 234, 185, 40)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'd',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 27, 119, 30),
                                                  border: Border.all(
                                                      color: Colors.green),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'W',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  border: Border.all(
                                                      color: Colors.red),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'L',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 234, 185, 40),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 234, 185, 40)),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        'd',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        height: 0,
                                        child: ListView.builder(
                                            itemCount: 0,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10,
                                                    left: 15,
                                                    right: 15),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    height: 110,
                                                    width: 320,
                                                    color: Color.fromARGB(
                                                        255, 66, 63, 63),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundImage:
                                                                        AssetImage(
                                                                            "assets/india.png"),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                  child: Text(
                                                                    'SL',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5,
                                                                          top:
                                                                              10),
                                                                  child: Text(
                                                                    '378- 10 & 360 -8',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundImage:
                                                                        AssetImage(
                                                                            "assets/pakistan.jpg"),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                  child: Text(
                                                                    'PAK ',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5,
                                                                          top:
                                                                              10),
                                                                  child: Text(
                                                                    '231- 6 & 260 -5 ',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 40),
                                                          height: 60,
                                                          width: 1,
                                                          color: Colors.white,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        201,
                                                                        45,
                                                                        34),
                                                                border:
                                                                    Border.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          201,
                                                                          45,
                                                                          34),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: Row(
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'L',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 12),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                            top: 45,
                                                          ),
                                                          child: Column(
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Text(
                                                                '2nd Test',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                  height: 2),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  'SL vs PAK...',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white),
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
                                            }),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 110,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Row(
                                      //       children: [
                                      //         Column(
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(top: 10),
                                      //                   child: CircleAvatar(
                                      //                     backgroundImage:
                                      //                         AssetImage("assets/india.png"),
                                      //                   ),
                                      //                 ),
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(left: 10, top: 10),
                                      //                   child: Text(
                                      //                     'SL',
                                      //                     style: TextStyle(
                                      //                         color: Colors.white, fontSize: 15),
                                      //                   ),
                                      //                 ),
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(left: 5, top: 10),
                                      //                   child: Text(
                                      //                     '378- 10 & 360 -8',
                                      //                     style: TextStyle(
                                      //                         color: Colors.white, fontSize: 12),
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //             Row(
                                      //               children: [
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(left: 10, top: 10),
                                      //                   child: CircleAvatar(
                                      //                     backgroundImage:
                                      //                         AssetImage("assets/pakistan.jpg"),
                                      //                   ),
                                      //                 ),
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(left: 10, top: 10),
                                      //                   child: Text(
                                      //                     'PAK ',
                                      //                     style: TextStyle(
                                      //                         color: Colors.white, fontSize: 15),
                                      //                   ),
                                      //                 ),
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(left: 5, top: 10),
                                      //                   child: Text(
                                      //                     '231- 6 & 260 -5 ',
                                      //                     style: TextStyle(
                                      //                         color: Colors.white, fontSize: 12),
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(left: 40),
                                      //           height: 60,
                                      //           width: 1,
                                      //           color: Colors.white,
                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(left: 10),
                                      //           child: ClipRRect(
                                      //             borderRadius: BorderRadius.circular(2),
                                      //             child: Container(
                                      //               height: 20,
                                      //               width: 20,
                                      //               decoration: BoxDecoration(
                                      //                 color: Color.fromARGB(255, 26, 121, 29),
                                      //                 border: Border.all(
                                      //                   color: Color.fromARGB(255, 26, 121, 29),
                                      //                 ),
                                      //               ),
                                      //               child: Center(
                                      //                 child: Row(
                                      //                   // ignore: prefer_const_literals_to_create_immutables
                                      //                   children: [
                                      //                     Container(
                                      //                       margin: EdgeInsets.only(left: 5),
                                      //                       child: Text(
                                      //                         'W',
                                      //                         style: TextStyle(
                                      //                             color: Colors.white, fontSize: 12),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(
                                      //             top: 45,
                                      //           ),
                                      //           child: Column(
                                      //             // ignore: prefer_const_literals_to_create_immutables
                                      //             children: [
                                      //               Text(
                                      //                 '2nd Test',
                                      //                 style: TextStyle(
                                      //                     fontSize: 10, color: Colors.white),
                                      //               ),
                                      //               SizedBox(height: 2),
                                      //               Container(
                                      //                 margin: EdgeInsets.only(left: 5),
                                      //                 child: Text(
                                      //                   'SL vs PAK...',
                                      //                   style: TextStyle(
                                      //                       fontSize: 10, color: Colors.white),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 70,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Row(
                                      //       children: [
                                      //         Column(
                                      //           children: [
                                      //             Container(
                                      //               alignment: Alignment.bottomLeft,
                                      //               child: Row(
                                      //                 children: [
                                      //                   Row(
                                      //                     children: [
                                      //                       Container(
                                      //                         margin: EdgeInsets.only(
                                      //                             left: 10, top: 10),
                                      //                         child: CircleAvatar(
                                      //                           backgroundImage: AssetImage(
                                      //                               "assets/pakistan.jpg"),
                                      //                         ),
                                      //                       ),
                                      //                       Container(
                                      //                         margin: EdgeInsets.only(
                                      //                             left: 10, top: 10),
                                      //                         child: Text(
                                      //                           'PAK ',
                                      //                           style: TextStyle(
                                      //                               color: Colors.white,
                                      //                               fontSize: 15),
                                      //                         ),
                                      //                       ),
                                      //                       Container(
                                      //                         margin: EdgeInsets.only(
                                      //                             left: 5, top: 10),
                                      //                         child: Text(
                                      //                           '231- 6 & 260 -5 ',
                                      //                           style: TextStyle(
                                      //                               color: Colors.white,
                                      //                               fontSize: 12),
                                      //                         ),
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(left: 50),
                                      //           child: Text(
                                      //             'Fixtures',
                                      //             style: TextStyle(color: Colors.blue),
                                      //           ),
                                      //         ),
                                      //         Icon(
                                      //           Icons.keyboard_arrow_right,
                                      //           size: 35,
                                      //           color: Colors.blue,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   alignment: Alignment.bottomLeft,
                                      //   margin: EdgeInsets.only(left: 45, top: 20),
                                      //   child: Text(
                                      //     '*Upcoming Matches',
                                      //     style: TextStyle(color: Colors.white),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   alignment: Alignment.bottomLeft,
                                      //   margin: EdgeInsets.only(left: 35, top: 20),
                                      //   child: Row(
                                      //     children: [
                                      //       Text(
                                      //         'Head to head',
                                      //         style: TextStyle(color: Colors.white),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(left: 8),
                                      //         child: Text(
                                      //           '(Last 10 Matches)',
                                      //           style: TextStyle(
                                      //               color: Color.fromARGB(255, 172, 167, 167),
                                      //               fontSize: 10),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 80,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Container(
                                      //       child: Row(
                                      //         children: [
                                      //           Container(
                                      //               margin: EdgeInsets.only(left: 50),
                                      //               child: CircleAvatar(
                                      //                 radius: 25,
                                      //                 backgroundImage:
                                      //                     AssetImage("assets/india.png"),
                                      //               )),
                                      //           Container(
                                      //             margin: EdgeInsets.only(left: 25),
                                      //             child: Text(
                                      //               '5',
                                      //               style: TextStyle(
                                      //                   fontSize: 20, color: Colors.white),
                                      //             ),
                                      //           ),
                                      //           Container(
                                      //             margin: EdgeInsets.only(left: 25),
                                      //             child: Text(
                                      //               '-',
                                      //               style: TextStyle(
                                      //                   fontSize: 20, color: Colors.white),
                                      //             ),
                                      //           ),
                                      //           Container(
                                      //             margin: EdgeInsets.only(left: 25),
                                      //             child: Text(
                                      //               '1',
                                      //               style: TextStyle(
                                      //                   fontSize: 20, color: Colors.white),
                                      //             ),
                                      //           ),
                                      //           Container(
                                      //               margin: EdgeInsets.only(left: 25),
                                      //               child: CircleAvatar(
                                      //                 radius: 25,
                                      //                 backgroundImage:
                                      //                     AssetImage("assets/pakistan.jpg"),
                                      //               )),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Container(
                                        height: 0,
                                        child: ListView.builder(
                                            itemCount: 0,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10,
                                                    left: 15,
                                                    right: 15),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    height: 125,
                                                    width: 320,
                                                    color: Color.fromARGB(
                                                        255, 66, 63, 63),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 10),
                                                          child: Text(
                                                            '3rd Test,Pakistan tour of india 2022 on 21 Aug',
                                                            style: TextStyle(
                                                                fontSize: 8,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundImage:
                                                                              AssetImage("assets/india.png"),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        'SL',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5,
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        '378- 10 & 360 -8',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 12),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundImage:
                                                                              AssetImage("assets/pakistan.jpg"),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        left:
                                                                            10,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'PAK ',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        left: 5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        '231- 6 & 260 -5 ',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 12),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 40),
                                                              height: 60,
                                                              width: 1,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Container(
                                                              width: 40,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              child: Text(
                                                                'Match Drawn',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 70,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Row(
                                      //       children: [
                                      //         Column(
                                      //           children: [
                                      //             Container(
                                      //               alignment: Alignment.bottomLeft,
                                      //               child: Row(
                                      //                 children: [
                                      //                   Row(
                                      //                     children: [
                                      //                       Container(
                                      //                         margin: EdgeInsets.only(
                                      //                           left: 10,
                                      //                         ),
                                      //                         child: Container(
                                      //                           alignment: Alignment.topRight,
                                      //                           width: 75,
                                      //                           margin:
                                      //                               EdgeInsets.only(top: 25),
                                      //                           child: Text(
                                      //                             'PAK ',
                                      //                             style: TextStyle(
                                      //                                 color: Colors.white,
                                      //                                 fontSize: 15),
                                      //                           ),
                                      //                         ),
                                      //                       ),
                                      //                       Container(
                                      //                         margin: EdgeInsets.only(
                                      //                             left: 5, top: 25),
                                      //                         child: Text(
                                      //                           'vs',
                                      //                           style: TextStyle(
                                      //                               color: Colors.white,
                                      //                               fontSize: 15),
                                      //                         ),
                                      //                       ),
                                      //                       Container(
                                      //                         width: 75,
                                      //                         margin: EdgeInsets.only(
                                      //                             left: 5, top: 25),
                                      //                         child: Text(
                                      //                           'IND ',
                                      //                           style: TextStyle(
                                      //                               color: Colors.white,
                                      //                               fontSize: 15),
                                      //                         ),
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(left: 0),
                                      //           child: Text(
                                      //             'More Matches',
                                      //             style: TextStyle(color: Colors.blue),
                                      //           ),
                                      //         ),
                                      //         Icon(
                                      //           Icons.keyboard_arrow_right,
                                      //           color: Colors.blue,
                                      //           size: 35,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 25),
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text(
                                              "Team Comparison",
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "(Last 10 Matches)",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: isDarkMode
                                                      ? Colors.blueGrey
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 300,
                                            color: isDarkMode
                                                ? Color.fromARGB(
                                                    255, 66, 63, 63)
                                                : const Color(0xFFDFDFDF),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          top: 20),
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            (NetworkImage(
                                                                data["teamInfo"]
                                                                        [0]
                                                                    ["img"])),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          width: 110,
                                                          margin:
                                                              EdgeInsets.only(
                                                            left: 5,
                                                            right: 5,
                                                            top: 30,
                                                          ),
                                                          child: Text(
                                                            (data["teamInfo"][0]
                                                                ["shortname"]),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 110,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              'vs all teams',
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .blueGrey
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 12),
                                                            )),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              width: 110,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 30,
                                                                      left: 5,
                                                                      right: 5),
                                                              child: Text(
                                                                data["teamInfo"]
                                                                        [1][
                                                                    "shortname"],
                                                                style: TextStyle(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                            Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                width: 110,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  'vs all teams',
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .blueGrey
                                                                          : Colors
                                                                              .black,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                          ],
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            margin:
                                                                EdgeInsets.only(
                                                              top: 20,
                                                            ),
                                                            child: CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      data["teamInfo"]
                                                                              [
                                                                              1]
                                                                          [
                                                                          "img"]),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 15,
                                                      left: 8,
                                                      right: 8),
                                                  height: 1,
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      width: 55,
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          top: 6,
                                                          right: 5),
                                                      child: Text(
                                                        '10',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 210,
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          top: 6,
                                                          right: 5),
                                                      child: Text(
                                                        'Matches played',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '10',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 13,
                                                      left: 8,
                                                      right: 8),
                                                  height: 1,
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '60%',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFF4D00),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 210,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        'Win',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '40%',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 13, left: 8),
                                                  height: 1,
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '320',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFF4D00),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 210,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        'Avarage Score',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '200',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 13, left: 8),
                                                  height: 1,
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '539',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFF4D00),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 210,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        'Highest Score',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '510',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 13, left: 8),
                                                  height: 1,
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                                Row(
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '150',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFF4D00),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 210,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        'Laest Score',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 55,
                                                      margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 6),
                                                      child: Text(
                                                        '140',
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 13, left: 8),
                                                  height: 1,
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 30, top: 20, bottom: 26),
                                            child: Icon(
                                              Icons.location_on,
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            data["venue"],
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 190,
                                          color: isDarkMode
                                              ? Color.fromARGB(255, 66, 63, 63)
                                              : const Color(0xFFDFDFDF),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 25, bottom: 60),
                                                    child: Image.asset(
                                                      'assets/cloud.png',
                                                      height: 50,
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        margin: EdgeInsets.only(
                                                            left: 10, top: 30),
                                                        child: Text(
                                                          data["venue"],
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10, right: 58),
                                                        child: Text(
                                                          '20°  C',
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 55,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 30),
                                                            child: Image.asset(
                                                              'assets/droplet.png',
                                                              height: 50,
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 30),
                                                            child: Text(
                                                              '60% (Humidity)',
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10),
                                                            child: Image.asset(
                                                              'assets/skydrop.png',
                                                              height: 50,
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10),
                                                            child: Text(
                                                              '1% Chance',
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Clouds and Sun",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 75,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(),
                                                    child: Text(
                                                      'updated 10:10 pm',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Column(
                                      //       children: [
                                      //         Container(
                                      //           margin: EdgeInsets.only(
                                      //               top: 20, left: 10, right: 10),
                                      //           child: ClipRRect(
                                      //             borderRadius: BorderRadius.circular(10),
                                      //             child: Container(
                                      //               height: 150,
                                      //               width: 300,
                                      //               color: Color.fromARGB(255, 132, 130, 130),
                                      //               child: Column(
                                      //                 children: [
                                      //                   AspectRatio(
                                      //                     aspectRatio: 35 / 15,
                                      //                     child: DChartPie(
                                      //                       // ignore: prefer_const_literals_to_create_immutables
                                      //                       data: [
                                      //                         // ignore: prefer_const_literals_to_create_immutables
                                      //                         {'domain': 'Ionic', 'measure': 1},
                                      //                         // ignore: prefer_const_literals_to_create_immutables
                                      //                         {'domain': '', 'measure': 1},
                                      //                       ],
                                      //                       fillColor: (pieData, index) {
                                      //                         switch (pieData['domain']) {
                                      //                           case 'Flutter':
                                      //                             return Colors.blue;
                                      //                           case 'React Native':
                                      //                             return Colors.blueAccent;
                                      //                           case 'Ionic':
                                      //                             return Colors.lightBlue;
                                      //                           default:
                                      //                             return Colors.orange;
                                      //                         }
                                      //                       },
                                      //                       // pieLabel: (pieData, index) {
                                      //                       //   return "${pieData['domain']}:\n${pieData['measure']}%";
                                      //                       // },
                                      //                       labelPosition:
                                      //                           PieLabelPosition.outside,
                                      //                       donutWidth: 30,
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Container(
                                      //           height: 2,
                                      //           width: 320,
                                      //           color: Colors.grey,
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Column(
                                      //               // ignore: prefer_const_literals_to_create_immutables
                                      //               children: [
                                      //                 Text(
                                      //                   "Avg 1st Innings",
                                      //                   style: TextStyle(color: Colors.white60),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 5,
                                      //                 ),
                                      //                 Text(
                                      //                   "320",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.bold),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               width: 80,
                                      //             ),
                                      //             Column(
                                      //               // ignore: prefer_const_literals_to_create_immutables
                                      //               children: [
                                      //                 Text(
                                      //                   "Avg 1st Innings",
                                      //                   style: TextStyle(color: Colors.white60),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 5,
                                      //                 ),
                                      //                 Text(
                                      //                   "320",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.bold),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Container(
                                      //           height: 1,
                                      //           width: 320,
                                      //           color: Colors.grey,
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Column(
                                      //               // ignore: prefer_const_literals_to_create_immutables
                                      //               children: [
                                      //                 Text(
                                      //                   "Avg 3rdst Innings",
                                      //                   style: TextStyle(color: Colors.white60),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 5,
                                      //                 ),
                                      //                 Text(
                                      //                   "179",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.bold),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               width: 80,
                                      //             ),
                                      //             Column(
                                      //               // ignore: prefer_const_literals_to_create_immutables
                                      //               children: [
                                      //                 Text(
                                      //                   "Avg 4th Innings",
                                      //                   style: TextStyle(color: Colors.white60),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 5,
                                      //                 ),
                                      //                 Text(
                                      //                   "91",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.bold),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Container(
                                      //           height: 2,
                                      //           width: 320,
                                      //           color: Colors.grey,
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Column(
                                      //               mainAxisAlignment: MainAxisAlignment.start,
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment.start,
                                      //               // ignore: prefer_const_literals_to_create_immutables
                                      //               children: [
                                      //                 Text(
                                      //                   "Highest Total",
                                      //                   style: TextStyle(color: Colors.white60),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 5,
                                      //                 ),
                                      //                 Text(
                                      //                   "476-4",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.bold),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //             Container(
                                      //               margin: EdgeInsets.only(top: 15, right: 25),
                                      //               child: Text(
                                      //                 "(162 Ov)by IND",
                                      //                 style: TextStyle(
                                      //                     fontSize: 10, color: Colors.white60),
                                      //               ),
                                      //             ),
                                      //             SizedBox(
                                      //               width: 35,
                                      //             ),
                                      //             Container(
                                      //               margin: EdgeInsets.only(bottom: 15),
                                      //               child: Text(
                                      //                 "IND vs PAK",
                                      //                 style: TextStyle(
                                      //                     color: Colors.white,
                                      //                     fontWeight: FontWeight.bold),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Container(
                                      //           height: 2,
                                      //           width: 320,
                                      //           color: Colors.grey,
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Column(
                                      //               mainAxisAlignment: MainAxisAlignment.start,
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment.start,
                                      //               // ignore: prefer_const_literals_to_create_immutables
                                      //               children: [
                                      //                 Text(
                                      //                   "Highest Total",
                                      //                   style: TextStyle(color: Colors.white60),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 5,
                                      //                 ),
                                      //                 Text(
                                      //                   "168-10",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.bold),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //             Container(
                                      //               margin: EdgeInsets.only(top: 15, right: 25),
                                      //               child: Text(
                                      //                 "(62.2 Ov)by BAN",
                                      //                 style: TextStyle(
                                      //                     fontSize: 10, color: Colors.white60),
                                      //               ),
                                      //             ),
                                      //             SizedBox(
                                      //               width: 35,
                                      //             ),
                                      //             Container(
                                      //               margin: EdgeInsets.only(bottom: 15),
                                      //               child: Text(
                                      //                 "BAN vs PAK",
                                      //                 style: TextStyle(
                                      //                     color: Colors.white,
                                      //                     fontWeight: FontWeight.bold),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         SizedBox(
                                      //           height: 25,
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(left: 40, top: 30),
                                      //   alignment: Alignment.bottomLeft,
                                      //   child: Text(
                                      //     'Recent Matches on Venue',
                                      //     style: TextStyle(color: Colors.white, fontSize: 12),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 125,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Column(
                                      //       children: [
                                      //         Container(
                                      //           alignment: Alignment.bottomLeft,
                                      //           margin: EdgeInsets.only(left: 15, top: 10),
                                      //           child: Text(
                                      //             '20th Test,Quaid e Azam Trophy 2022 on 02 Nov',
                                      //             style: TextStyle(
                                      //                 fontSize: 8, color: Colors.white),
                                      //           ),
                                      //         ),
                                      //         Row(
                                      //           children: [
                                      //             Column(
                                      //               children: [
                                      //                 Row(
                                      //                   children: [
                                      //                     Container(
                                      //                         margin: EdgeInsets.only(top: 5),
                                      //                         child: CircleAvatar(
                                      //                           backgroundImage: AssetImage(
                                      //                               "assets/india.png"),
                                      //                         )),
                                      //                     Container(
                                      //                       margin: EdgeInsets.only(
                                      //                         left: 10,
                                      //                       ),
                                      //                       child: Text(
                                      //                         'SL',
                                      //                         style: TextStyle(
                                      //                             color: Colors.white,
                                      //                             fontSize: 15),
                                      //                       ),
                                      //                     ),
                                      //                     Container(
                                      //                       margin: EdgeInsets.only(
                                      //                         left: 5,
                                      //                       ),
                                      //                       child: Text(
                                      //                         '378- 10 & 360 -8',
                                      //                         style: TextStyle(
                                      //                             color: Colors.white,
                                      //                             fontSize: 12),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //                 Row(
                                      //                   children: [
                                      //                     Container(
                                      //                         margin: EdgeInsets.only(
                                      //                             left: 10, top: 10),
                                      //                         child: CircleAvatar(
                                      //                           backgroundImage: AssetImage(
                                      //                               "assets/pakistan.jpg"),
                                      //                         )),
                                      //                     Container(
                                      //                       margin: EdgeInsets.only(
                                      //                           left: 10, top: 10),
                                      //                       child: Text(
                                      //                         'PAK ',
                                      //                         style: TextStyle(
                                      //                             color: Colors.white,
                                      //                             fontSize: 15),
                                      //                       ),
                                      //                     ),
                                      //                     Container(
                                      //                       margin: EdgeInsets.only(
                                      //                           left: 5, top: 10),
                                      //                       child: Text(
                                      //                         '231- 6 & 260 -5 ',
                                      //                         style: TextStyle(
                                      //                             color: Colors.white,
                                      //                             fontSize: 12),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //             Container(
                                      //               margin: EdgeInsets.only(left: 40),
                                      //               height: 60,
                                      //               width: 1,
                                      //               color: Colors.white,
                                      //             ),
                                      //             Column(
                                      //               children: [
                                      //                 Container(
                                      //                   margin: EdgeInsets.only(left: 10),
                                      //                   child: Text(
                                      //                     'Sindh Won',
                                      //                     style: TextStyle(
                                      //                         fontSize: 14,
                                      //                         color: Colors.white,
                                      //                         fontWeight: FontWeight.w500),
                                      //                   ),
                                      //                 ),
                                      //                 Container(
                                      //                   margin:
                                      //                       EdgeInsets.only(left: 10, top: 3),
                                      //                   child: Text(
                                      //                     'by 202 runs',
                                      //                     style: TextStyle(
                                      //                         fontSize: 10,
                                      //                         color: Colors.white,
                                      //                         fontWeight: FontWeight.w500),
                                      //                   ),
                                      //                 ),
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
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 50,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Row(
                                      //       mainAxisAlignment: MainAxisAlignment.center,
                                      //       // ignore: prefer_const_literals_to_create_immutables
                                      //       children: [
                                      //         Text(
                                      //           "See More Vanue Matches",
                                      //           style: TextStyle(
                                      //               fontSize: 12,
                                      //               color: Colors.white,
                                      //               fontWeight: FontWeight.w500),
                                      //         ),
                                      //         SizedBox(
                                      //           width: 50,
                                      //         ),
                                      //         // ignore: prefer_const_literals_to_create_immutables
                                      //         Row(
                                      //           // ignore: prefer_const_literals_to_create_immutables
                                      //           children: [
                                      //             Text(
                                      //               "All Matches",
                                      //               style: TextStyle(
                                      //                   fontSize: 12,
                                      //                   color: Colors.blue,
                                      //                   fontWeight: FontWeight.w500),
                                      //             ),
                                      //             Icon(
                                      //               Icons.keyboard_arrow_right,
                                      //               color: Colors.blue,
                                      //               size: 25,
                                      //             )
                                      //           ],
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(left: 30, top: 8),
                                      //   alignment: Alignment.bottomLeft,
                                      //   child: Text(
                                      //     'Umpires',
                                      //     style: TextStyle(
                                      //         fontSize: 14,
                                      //         color: Colors.white,
                                      //         fontWeight: FontWeight.w500),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     height: 190,
                                      //     width: 320,
                                      //     color: Color.fromARGB(255, 66, 63, 63),
                                      //     child: Column(children: [
                                      //       Container(
                                      //         alignment: Alignment.bottomLeft,
                                      //         margin: EdgeInsets.only(left: 15, top: 5),
                                      //         child: Text(
                                      //           'Umpire',
                                      //           style: TextStyle(color: Colors.white),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(left: 15, top: 5),
                                      //         alignment: Alignment.bottomLeft,
                                      //         child: Text(
                                      //           'Ahsan Raza,Joel Wilson',
                                      //           style: TextStyle(
                                      //               color: Colors.white, fontSize: 16),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(top: 10, left: 8),
                                      //         height: 1,
                                      //         width: 310,
                                      //         color: Colors.white,
                                      //       ),
                                      //       Container(
                                      //         alignment: Alignment.bottomLeft,
                                      //         margin: EdgeInsets.only(left: 15, top: 5),
                                      //         child: Text(
                                      //           'Third Umpire',
                                      //           style: TextStyle(color: Colors.white),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(left: 15, top: 5),
                                      //         alignment: Alignment.bottomLeft,
                                      //         child: Text(
                                      //           'Ahsan Raza,Joel Wilson',
                                      //           style: TextStyle(
                                      //               color: Colors.white, fontSize: 16),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(top: 10, left: 8),
                                      //         height: 1,
                                      //         width: 310,
                                      //         color: Colors.white,
                                      //       ),
                                      //       Container(
                                      //         alignment: Alignment.bottomLeft,
                                      //         margin: EdgeInsets.only(left: 15, top: 5),
                                      //         child: Text(
                                      //           'referee',
                                      //           style: TextStyle(color: Colors.white),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(left: 15, top: 5),
                                      //         alignment: Alignment.bottomLeft,
                                      //         child: Text(
                                      //           'Ahsan Raza,Joel Wilson',
                                      //           style: TextStyle(
                                      //               color: Colors.white, fontSize: 16),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         margin: EdgeInsets.only(top: 10, left: 8),
                                      //         height: 1,
                                      //         width: 310,
                                      //         color: Colors.white,
                                      //       ),
                                      //     ]),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
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
          );
        },
      ),
    );
  }
}
