// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore

import 'dart:convert';

import 'package:crex/pages/live_second.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:http/http.dart' as http;

class graph extends StatefulWidget {
  const graph({Key? key, required this.id, required this.theme})
      : super(key: key);

  final String id;
  final String theme;

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  var map, data, bbbmap, bbbData;
  getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=272ffee7-f333-43bd-babc-f9e045d698d3&id=${widget.id}'),
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

  getBallByBall() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_bbb?apikey=272ffee7-f333-43bd-babc-f9e045d698d3&id=${widget.id}'),
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
      body: FutureBuilder(
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
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        // ignore: prefer_const_constructors
                        image: DecorationImage(
                          // ignore: prefer_const_constructors
                          image: isDarkMode
                              ? AssetImage('assets/background.jpeg')
                              : AssetImage("assets/bgLightMode.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            width: 380,
                            color: Colors.white,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(right: 25),
                                          child: isDarkMode
                                              ? Image.asset("assets/volume.png")
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
                                                                  [0]["shortname"]
                                                              : data["teamInfo"][1]["shortname"],
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
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
                                                                  ? Colors.white
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
                                                                  ? Colors.white
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
                                                                  ? Colors.white
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
                                                              1]["dismissal"] ==
                                                          null
                                                      ? bbbData["bbb"][
                                                              bbbData["bbb"]
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
                                                        ? bbbData["bbb"][bbbData["bbb"]
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
                                                      ? bbbData["bbb"][bbbData["bbb"].length - 1]
                                                                  [
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 7]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 8]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 9]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 10]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 11]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 12]
                                                                      ["runs"])
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
                                            padding: const EdgeInsets.all(5.0),
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
                                                      ? bbbData["bbb"][bbbData["bbb"].length - 1]
                                                                  [
                                                                  "dismissal"] ==
                                                              null
                                                          ? (bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 1]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 2]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 3]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 4]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 5]
                                                                      ["runs"] +
                                                                  bbbData["bbb"]
                                                                          [bbbData["bbb"].length - 6]
                                                                      ["runs"])
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
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 320,
                                    color: isDarkMode
                                        ? Color.fromARGB(255, 58, 58, 58)
                                        : Colors.black12,
                                    child: SfSparkLineChart(
                                      //Enable the trackball
                                      trackball: SparkChartTrackball(
                                          activationMode:
                                              SparkChartActivationMode.tap),
                                      //Enable marker
                                      marker: SparkChartMarker(
                                          displayMode:
                                              SparkChartMarkerDisplayMode.all),
                                      //Enable data label
                                      labelDisplayMode:
                                          SparkChartLabelDisplayMode.all,
                                      data: <double>[
                                        2,
                                        5,
                                        4,
                                        3,
                                        5,
                                        6,
                                        4,
                                        4,
                                        3,
                                        8,
                                        5
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 275,
                            child: Text(
                              'Win Percentage graph is no available for test matches',
                              style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              );
            }
          }),
    );
  }
}
