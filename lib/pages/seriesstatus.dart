// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'dart:convert';

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class seriesstatus extends StatefulWidget {
  const seriesstatus(
      {Key? key, required this.id, required this.seriesId, required this.theme})
      : super(key: key);
  final String id;
  final String seriesId;
  final String theme;

  @override
  State<seriesstatus> createState() => _seriesstatusState();
}

class _seriesstatusState extends State<seriesstatus> {
  bool isVisible = false;
  bool flag = true;
  var map, data, map1, data1, bbbmap, bbbData;
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
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getSeriesDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/series_info?apikey=272ffee7-f333-43bd-babc-f9e045d698d3&id=${widget.seriesId}'),
      );

      map1 = jsonDecode(response.body.toString());
      data1 = map1["data"];
      if (response.statusCode == 200) {
        return data1;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
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
              future: getSeriesDetails(),
              builder: (context, snapshot) {
                if (data1 == null) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
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
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: isDarkMode
                                      ? AssetImage('assets/background.jpeg')
                                      : AssetImage("assets/bgLightMode.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 1,
                                  width: 350,
                                  color: Colors.blueGrey,
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
                                                margin:
                                                    EdgeInsets.only(right: 25),
                                                child: isDarkMode
                                                    ? Image.asset(
                                                        "assets/volume.png")
                                                    : Image.asset(
                                                        "assets/volume.png",
                                                        color: Colors.grey,
                                                      )),
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
                                                                        (data["teamInfo"][0]["name"].indexOf(" ") !=
                                                                                -1)
                                                                            ? data["teamInfo"][0]["name"].indexOf(
                                                                                " ")
                                                                            : data["teamInfo"][0]["name"]
                                                                                .length)
                                                                ? data["teamInfo"]
                                                                    [0]["img"]
                                                                : data["teamInfo"]
                                                                    [1]["img"]),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Text(
                                                                data["score"][data["score"].length - 1]["inning"].substring(0, (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1) ? data["score"][data["score"].length - 1]["inning"].indexOf(" ") : data["score"][data["score"].length - 1]["inning"].length) ==
                                                                        data["teamInfo"][0]["name"].substring(
                                                                            0,
                                                                            (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                                                ? data["teamInfo"][0]["name"].indexOf(
                                                                                    " ")
                                                                                : data["teamInfo"][0]["name"]
                                                                                    .length)
                                                                    ? data["teamInfo"]
                                                                            [0][
                                                                        "shortname"]
                                                                    : data["teamInfo"]
                                                                            [1][
                                                                        "shortname"],
                                                                style: TextStyle(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        20,
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
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                data["score"][(data["score"]
                                                                            .length) -
                                                                        1]["o"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      (data["score"][(data[
                                                                          "score"]
                                                                      .length) -
                                                                  1]["r"] /
                                                              data[
                                                                  "score"][(data[
                                                                          "score"]
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
                                                Image.asset(
                                                    'assets/live_tv.png')
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
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        bbbData != "failure"
                                                            ? ('Over ' +
                                                                bbbData["bbb"][bbbData["bbb"]
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
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                          12]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                          11]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                          10]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                          9]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                          8]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                          7]["runs"]
                                                                      .toString()
                                                                  : "W"
                                                              : "1",
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 7]["runs"] +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 8][
                                                                            "runs"] +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 9]
                                                                            [
                                                                            "runs"] +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 10]
                                                                            [
                                                                            "runs"] +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 11]
                                                                            [
                                                                            "runs"] +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 12]
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
                                                                FontWeight
                                                                    .bold),
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        bbbData != "failure"
                                                            ? ('Over ' +
                                                                bbbData["bbb"][bbbData["bbb"]
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
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 5,
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
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                                ? (bbbData["bbb"][bbbData["bbb"].length - 1]["runs"] ?? 1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 2][
                                                                            "runs"] ?? 1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 3]
                                                                            [
                                                                            "runs"] ?? 1 +
                                                                        bbbData["bbb"][bbbData["bbb"].length - 4]
                                                                            [
                                                                            "runs"] ?? 1+
                                                                        bbbData["bbb"][bbbData["bbb"].length - 5]
                                                                            [
                                                                            "runs"] ?? 1+
                                                                        bbbData["bbb"][bbbData["bbb"].length - 6]
                                                                            ["runs"] ?? 1)
                                                                    .toString()
                                                                : "8"
                                                            : "1",
                                                        style: TextStyle(
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                  height: 15,
                                ),
                                Text(
                                  data1["info"]["name"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: data1["info"]["matches"],
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 125,
                                        width: 330,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(255, 79, 78, 78),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 40, top: 20),
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage: NetworkImage(
                                                            data1["matchList"]
                                                                        [index]
                                                                    ["teamInfo"]
                                                                [0]["img"]),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 2, top: 5),
                                                        child: Text(
                                                          data1["matchList"]
                                                                      [index]
                                                                  ["teamInfo"]
                                                              [0]["shortname"],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 20, top: 15),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        child: Text(
                                                          data1["matchList"]
                                                              [index]["status"],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                data1["matchList"][index]
                                                                ["teamInfo"]
                                                            .length >
                                                        1
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10, top: 20),
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 25,
                                                              backgroundImage: NetworkImage(
                                                                  data1["matchList"]
                                                                              [
                                                                              index]
                                                                          [
                                                                          "teamInfo"]
                                                                      [
                                                                      1]["img"]),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 2,
                                                                      top: 5),
                                                              child: Text(
                                                                data1["matchList"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "teamInfo"][1]
                                                                    [
                                                                    "shortname"],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 1,
                                              width: 350,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Odis: ${data1["info"]["odi"]}, T20s: ${data1["info"]["t20"]}, Tests: ${data1["info"]["test"]} ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Visibility(
                                  visible: false,
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        'WTC 2021 -23 points Table',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width: 350,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          height: 54,
                                          width: 350,
                                          color: Color(0xFFFF4D00),
                                          child: Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 60,
                                                child: Text(
                                                  'Team',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 45,
                                                child: Text(
                                                  'Series',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 25,
                                                child: Text(
                                                  'P',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 25,
                                                child: Text(
                                                  'W',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 25,
                                                child: Text(
                                                  'L',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 25,
                                                child: Text(
                                                  'T',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 25,
                                                child: Text(
                                                  'D',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 30,
                                                child: Text(
                                                  'NRR',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 30,
                                                child: Text(
                                                  'Pts',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'PCT%',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        height: 1,
                                        width: 380,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 9,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 60,
                                                      child: Row(
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    "assets/india.png"),
                                                          ),
                                                          SizedBox(
                                                            width: 2.5,
                                                          ),
                                                          Text(
                                                            'IND',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      child: Text(
                                                        '3',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 25,
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 25,
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 25,
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 25,
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 25,
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 30,
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 30,
                                                      child: Text(
                                                        '26',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      width: 40,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        '60',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFF4D00),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 350,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
