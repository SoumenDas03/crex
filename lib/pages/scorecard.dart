// ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:crex/pages/singlePlayer_info.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class scorecard extends StatefulWidget {
  const scorecard({Key? key, required this.id, required this.theme})
      : super(key: key);

  final String id;
  final String theme;

  @override
  State<scorecard> createState() => _scorecardState();
}

// ignore: camel_case_types
class _scorecardState extends State<scorecard> {
    Future<void> apiFetch() async {
    var status = true;

    await Future.wait([
     getBallByBall(),
     getSingleCricketMatchDetails()
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
  var map, data, bbbmap, bbbData;
  Future getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=7650ef82-5d21-43df-b3b9-8955150ccddf&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      if (response.statusCode == 200) {
        // setState(() {
        //   print("refreshing score....");
        // });
        return data;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getBallByBall() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_bbb?apikey=7650ef82-5d21-43df-b3b9-8955150ccddf&id=${widget.id}'),
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

    String calculateValue(dynamic bbbData) {
      if (bbbData != null &&
          bbbData is Map<String, dynamic> &&
          bbbData.containsKey("bbb")) {
        final bbbList = bbbData["bbb"];

        if (bbbList is List && bbbList.isNotEmpty) {
          final lastItem = bbbList.last;

          if (lastItem is Map<String, dynamic> &&
              lastItem.containsKey("dismissal")) {
            if (lastItem["dismissal"] == null) {
              final totalRuns = calculateTotalRuns(bbbList);
              if (totalRuns != null && totalRuns >= 8) {
                return totalRuns.toString();
              }
            } else {
              return "8";
            }
          }
        }
      }
      return "1";
    }

    int? calculateTotalRuns(List<dynamic> bbbList) {
      int totalRuns = 0;

      for (final item in bbbList.reversed) {
        if (item is Map<String, dynamic> && item.containsKey("runs")) {
          final runs = item["runs"];
          if (runs is int) {
            totalRuns += runs;
            if (totalRuns >= 8) {
              return totalRuns;
            }
          }
        }
      }

      return null;
    }


    @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.theme == "dark";
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        
              future: apiFetch(),
              builder: (context, snapshot) {
                if (data == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: isDarkMode
                          ? AssetImage('assets/background.jpeg')
                          : AssetImage("assets/bgLightMode.png"),
                      fit: BoxFit.cover,
                    )),
                    child: SingleChildScrollView(
                      child: Column(children: [
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
                                                width: bbbData != "failure" && bbbData != null
                                                    ? bbbData['bbb']!= null ? bbbData["bbb"][bbbData[
                                                                        "bbb"]
                                                                    .length -
                                                                1]["dismissal"] ==
                                                            null
                                                        ? 20
                                                        : 0
                                                    : 20 : 0,
                                              ),
                                              bbbData != "failure" && bbbData != null
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
                                                    bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null  && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                    bbbData != "failure" && bbbData != null
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
                                                    bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                      bbbData != "failure" && bbbData != null
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
                                                    bbbData != "failure" && bbbData != null
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
                          height: 5,
                        ),
                        DefaultTabController(
                          // initialIndex: 0,
                          length: data["scorecard"].length > 1 ? 2 : 1,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                // margin: EdgeInsets.only(left: 10),
                                width: 340,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF4D00),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: TabBar(
                                      labelPadding: EdgeInsets.all(5),
                                      indicator: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      unselectedLabelColor: Colors.white,
                                      labelColor: Colors.white,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      tabs: [
                                        Tab(
                                          text: data["score"].length > 1
                                              ? data["score"]
                                                      [data["score"].length - 2]
                                                  ["inning"]
                                              : data["score"]
                                                      [data["score"].length - 1]
                                                  ["inning"],
                                        ),
                                        Tab(
                                          text: data["score"].length > 1
                                              ? data["score"]
                                                      [data["score"].length - 1]
                                                  ["inning"]
                                              : "Yet to bat",
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 1,
                                width: 360,
                                color: Colors.blueGrey,
                              ),
                              Container(
                                height: 400,
                                // height: (data["scorecard"].length > 1)
                                //     ? (data["scorecard"][data["scorecard"].length - 2]
                                //                     ["batting"]
                                //                 .length >
                                //             data["scorecard"]
                                //                         [data["scorecard"].length - 1]
                                //                     ["batting"]
                                //                 .length)
                                //         ? (120 * data["scorecard"][data["scorecard"].length - 2]["batting"].length)
                                //             .toDouble()
                                //         : (120 *
                                //                 data["scorecard"]
                                //                             [data["scorecard"].length - 1]
                                //                         ["batting"]
                                //                     .length)
                                //             .toDouble()
                                //     : (120 *
                                //             data["scorecard"]
                                //                         [data["scorecard"].length - 1]
                                //                     ["batting"]
                                //                 .length)
                                //         .toDouble(),
                                child: TabBarView(children: [
                                  SingleChildScrollView(
                                    //physics: NeverScrollableScrollPhysics(),
                                    physics: ClampingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 350,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  'Batter',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 105,
                                                ),
                                                Text(
                                                  'R',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  'B',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 32,
                                                ),
                                                Text(
                                                  '4s',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Text(
                                                  '6s',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  'SR',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: data["scorecard"]
                                                            .length >
                                                        1
                                                    ? data["scorecard"][
                                                            data["scorecard"]
                                                                    .length -
                                                                2]["batting"]
                                                        .length
                                                    : data["scorecard"][
                                                            data["scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            top: 5,
                                                            bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        // ignore: sized_box_for_whitespace
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => singlePlayer_info(
                                                                      playerId: data["score"].length >
                                                                              1
                                                                          ? data["scorecard"][data["scorecard"].length - 2]["batting"][index]["batsman"]
                                                                              [
                                                                              "id"]
                                                                          : data["scorecard"][data["scorecard"].length - 1]["batting"][index]["batsman"]
                                                                              [
                                                                              "id"]),
                                                                ));
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 130,
                                                                child: Text(
                                                                  data["score"].length >
                                                                          1
                                                                      ? data["scorecard"][data["scorecard"].length - 2]["batting"][index]
                                                                              ["batsman"]
                                                                          [
                                                                          "name"]
                                                                      : data[
                                                                          "scorecard"][data["scorecard"]
                                                                              .length -
                                                                          1]["batting"][index]["batsman"]["name"],
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 130,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 7),
                                                                child: Text(
                                                                  data["score"]
                                                                              .length >
                                                                          1
                                                                      ? data["scorecard"][data["scorecard"].length - 2]["batting"]
                                                                              [index]
                                                                          [
                                                                          "dismissal-text"]
                                                                      : data[
                                                                          "scorecard"][data["scorecard"]
                                                                              .length -
                                                                          1]["batting"][index]["dismissal-text"],
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          child: Center(
                                                            child: Text(
                                                              data["score"]
                                                                          .length >
                                                                      1
                                                                  ? data["scorecard"][data["scorecard"].length - 2]["batting"]
                                                                              [
                                                                              index]
                                                                          ["r"]
                                                                      .toString()
                                                                  : data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              1]["batting"][index]["r"]
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["batting"][index]
                                                                        ["b"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["batting"][index]["b"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["batting"][index]
                                                                        ["4s"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["batting"][index]["4s"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["batting"][index]
                                                                        ["6s"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["batting"][index]["6s"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        Container(
                                                          width: 54,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["batting"][index]
                                                                        ["sr"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["batting"][index]["sr"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 350,
                                                color: Colors.blueGrey,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    width: 160,
                                                    child: Text(
                                                      "Extras :",
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
                                                    width: 85,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                        radius: 10,
                                                        child: Text(
                                                          data["scorecard"]
                                                                      .length >
                                                                  1
                                                              ? data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              2]["extras"]
                                                                      ["r"]
                                                                  .toString()
                                                              : data["scorecard"]
                                                                      [
                                                                      data["scorecard"]
                                                                              .length -
                                                                          1]["extras"]["r"]
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFFFF4D00),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        data["scorecard"]
                                                            .length >
                                                            1
                                                            ? ", ${ data["scorecard"][data["scorecard"].length - 2]["extras"].containsKey("w") ? data["scorecard"][data["scorecard"].length - 2]["extras"]["w"] : 0}w, "
                                                            : ", ${data["scorecard"][data["scorecard"].length - 1]["extras"].containsKey("w") ? data["scorecard"][data["scorecard"].length - 1]["extras"]["w"]: 0}w, ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        data["scorecard"]
                                                            .length >
                                                            10
                                                            ? "${data["scorecard"][data["scorecard"].length - 2]["extras"].containsKey("nb") ? data["scorecard"][data["scorecard"].length - 2]["extras"]["nb"] : 0}nb "
                                                            : "${ data["scorecard"][data["scorecard"].length - 1]["extras"].containsKey("nb") ? data["scorecard"][data["scorecard"].length - 1]["extras"]["nb"] : 0}nb ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 360,
                                                color: Colors.blueGrey,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 350,
                                                color: Colors.blueGrey,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    width: 100,
                                                    child: Text(
                                                      "Totals :",
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
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 220,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        Text(
                                                          data["score"].length >
                                                                  1
                                                              ? data["score"][data[
                                                                              "score"]
                                                                          .length -
                                                                      2]["r"]
                                                                  .toString()
                                                              : data["score"][
                                                                      data["score"]
                                                                              .length -
                                                                          1]["r"]
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFFFF4D00),
                                                          ),
                                                        ),
                                                        data["score"].length > 1
                                                            ? Text(
                                                                "/" +
                                                                    data["score"][data["score"].length -
                                                                                2]
                                                                            [
                                                                            "w"]
                                                                        .toString() +
                                                                    "(" +
                                                                    data["score"]
                                                                            [
                                                                            data["score"].length -
                                                                                2]["o"]
                                                                        .toString() +
                                                                    ")",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xFFFF4D00),
                                                                ),
                                                              )
                                                            : Text(
                                                                "/" +
                                                                    data["score"][data["score"].length -
                                                                                1]
                                                                            [
                                                                            "w"]
                                                                        .toString() +
                                                                    "(" +
                                                                    data["score"]
                                                                            [
                                                                            data["score"].length -
                                                                                1]["o"]
                                                                        .toString() +
                                                                    ")",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xFFFF4D00),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 360,
                                                color: Colors.blueGrey,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text('YET TO BAT',style: TextStyle(
                                                                      color: Colors
                                                                          .orange,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),),
                                        ),
                                         Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25,top: 20),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 1,
                                            // crossAxisSpacing: 20,
                                            childAspectRatio: 1 / .5,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           // singlePlayer_info(
                                                //           //     playerId: newData[
                                                //           //                 index]
                                                //           //             ["id"]
                                                //           //         .toString()),
                                                //     ));
                                              },
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          child: CircleAvatar(
                                                            radius: 25,
                                                         backgroundImage: AssetImage('assets/virat.png'),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              child: Text(
                                                                'T Hridoy',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(),
                                                              child: Text(
                                                                'SR: 55.74',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10),
                                                              ),
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
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 350,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  'Bowler',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 105,
                                                ),
                                                Text(
                                                  'O',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  'M',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  'R',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Text(
                                                  'W',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 33,
                                                ),
                                                Text(
                                                  'Eco',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: data["scorecard"]
                                                            .length >
                                                        1
                                                    ? data["scorecard"][
                                                            data["scorecard"]
                                                                    .length -
                                                                2]["bowling"]
                                                        .length
                                                    : data["scorecard"][
                                                            data["scorecard"]
                                                                    .length -
                                                                1]["bowling"]
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            top: 5,
                                                            bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        // ignore: sized_box_for_whitespace
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => singlePlayer_info(
                                                                      playerId: data["scorecard"].length >
                                                                              1
                                                                          ? data["scorecard"][data["scorecard"].length - 2]["bowling"][index]["bowler"]
                                                                              [
                                                                              "id"]
                                                                          : data["scorecard"][data["scorecard"].length - 1]["bowling"][index]["bowler"]
                                                                              [
                                                                              "id"]),
                                                                ));
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 130,
                                                                child: Text(
                                                                  data["scorecard"]
                                                                              .length >
                                                                          1
                                                                      ? data["scorecard"][data["scorecard"].length - 2]["bowling"][index]
                                                                              ["bowler"]
                                                                          [
                                                                          "name"]
                                                                      : data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              1]["bowling"][index]["bowler"]["name"],
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          width: 42,
                                                          child: Center(
                                                            child: Text(
                                                              data["scorecard"]
                                                                          .length >
                                                                      1
                                                                  ? data["scorecard"][data["scorecard"].length - 2]["bowling"]
                                                                              [
                                                                              index]
                                                                          ["o"]
                                                                      .toString()
                                                                  : data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              1]["bowling"][index]["o"]
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 42,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["bowling"][index]
                                                                        ["m"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["bowling"][index]["m"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 42,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["bowling"][index]
                                                                        ["r"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["bowling"][index]["r"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 42,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["bowling"][index]
                                                                        ["w"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["bowling"][index]["w"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 44,
                                                          child: Text(
                                                            data["scorecard"]
                                                                        .length >
                                                                    1
                                                                ? data["scorecard"]
                                                                            [
                                                                            data["scorecard"].length -
                                                                                2]["bowling"][index]
                                                                        ["eco"]
                                                                    .toString()
                                                                : data["scorecard"]
                                                                        [
                                                                        data["scorecard"].length -
                                                                            1]["bowling"][index]["eco"]
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 350,
                                                color: Colors.blueGrey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),





                                  SingleChildScrollView(
                                    // physics: NeverScrollableScrollPhysics(),
                                    physics: ClampingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 350,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  'Batter',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 105,
                                                ),
                                                Text(
                                                  'R',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  'B',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '4s',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Text(
                                                  '6s',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 33,
                                                ),
                                                Text(
                                                  'SR',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: data["scorecard"][
                                                        data["scorecard"]
                                                                .length -
                                                            1]["batting"]
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            top: 5,
                                                            bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        // ignore: sized_box_for_whitespace
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => singlePlayer_info(
                                                                      playerId: data[
                                                                          "scorecard"][data["scorecard"]
                                                                              .length -
                                                                          1]["batting"][index]["batsman"]["id"]),
                                                                ));
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 130,
                                                                child: Text(
                                                                  data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              1]["batting"][index]
                                                                      [
                                                                      "batsman"]["name"],
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 130,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 7),
                                                                child: Text(
                                                                  data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              1]["batting"][index]
                                                                      [
                                                                      "dismissal-text"],
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          child: Center(
                                                            child: Text(
                                                              data["scorecard"][data["scorecard"].length -
                                                                              1]
                                                                          [
                                                                          "batting"]
                                                                      [
                                                                      index]["r"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["batting"]
                                                                    [index]["b"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["batting"]
                                                                    [
                                                                    index]["4s"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["batting"]
                                                                    [
                                                                    index]["6s"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        Container(
                                                          width: 54,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["batting"]
                                                                    [
                                                                    index]["sr"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 350,
                                                color: Colors.blueGrey,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    width: 100,
                                                    child: Text(
                                                      "Extras :",
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
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 220,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          radius: 10,
                                                          child: Text(
                                                            data["scorecard"][data[
                                                                            "scorecard"]
                                                                        .length -
                                                                    1]["extras"]["r"]
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xFFFF4D00),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          ", ${data["scorecard"][data["scorecard"].length - 1]["extras"].containsKey("w") ? data["scorecard"][data["scorecard"].length - 1]["extras"]["w"] : '0'}w, ",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: isDarkMode ? Colors.white : Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "${ data["scorecard"][data["scorecard"].length - 1]["extras"].containsKey("nb") ? data["scorecard"][data["scorecard"].length - 1]["extras"]["nb"] : 0}nb ",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: isDarkMode
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 360,
                                                color: Colors.blueGrey,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 350,
                                                color: Colors.blueGrey,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    width: 100,
                                                    child: Text(
                                                      "Totals :",
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
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 220,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        Text(
                                                          data["score"].length >
                                                                  1
                                                              ? data["score"][data[
                                                                              "score"]
                                                                          .length -
                                                                      1]["r"]
                                                                  .toString()
                                                              : data["score"][
                                                                      data["score"]
                                                                              .length -
                                                                          1]["r"]
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFFFF4D00),
                                                          ),
                                                        ),
                                                        data["score"].length > 1
                                                            ? Text(
                                                                "/" +
                                                                    data["score"][data["score"].length -
                                                                                1]
                                                                            [
                                                                            "w"]
                                                                        .toString() +
                                                                    "(" +
                                                                    data["score"]
                                                                            [
                                                                            data["score"].length -
                                                                                1]["o"]
                                                                        .toString() +
                                                                    ")",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xFFFF4D00),
                                                                ),
                                                              )
                                                            : Text(
                                                                "/" +
                                                                    data["score"][data["score"].length -
                                                                                1]
                                                                            [
                                                                            "w"]
                                                                        .toString() +
                                                                    "(" +
                                                                    data["score"]
                                                                            [
                                                                            data["score"].length -
                                                                                1]["o"]
                                                                        .toString() +
                                                                    ")",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xFFFF4D00),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 360,
                                                color: Colors.blueGrey,
                                              ),
                                            ],
                                          ),
                                        ),
                                         SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text('YET TO BAT',style: TextStyle(
                                                                      color: Colors
                                                                          .orange,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16),),
                                        ),
                                         Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25,top: 20),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 1,
                                            // crossAxisSpacing: 20,
                                            childAspectRatio: 1 / .5,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           // singlePlayer_info(
                                                //           //     playerId: newData[
                                                //           //                 index]
                                                //           //             ["id"]
                                                //           //         .toString()),
                                                //     ));
                                              },
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          child: CircleAvatar(
                                                            radius: 25,
                                                         backgroundImage: AssetImage('assets/virat.png'),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              child: Text(
                                                                'T Hridoy',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(),
                                                              child: Text(
                                                                'SR: 55.74',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10),
                                                              ),
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
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 350,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  'Bowler',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 105,
                                                ),
                                                Text(
                                                  'O',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  'M',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  'R',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Text(
                                                  'W',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 33,
                                                ),
                                                Text(
                                                  'Eco',
                                                  style: TextStyle(
                                                      color: Color(0xFFFF4D00),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: data["scorecard"][
                                                        data["scorecard"]
                                                                .length -
                                                            1]["bowling"]
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            top: 5,
                                                            bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        // ignore: sized_box_for_whitespace
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          singlePlayer_info(
                                                                              playerId: data["scorecard"][data["scorecard"].length - 1]["bowling"][index]["bowler"]["id"]),
                                                                    ));
                                                              },
                                                              child: SizedBox(
                                                                width: 130,
                                                                child: Text(
                                                                  data["scorecard"]
                                                                          [
                                                                          data["scorecard"].length -
                                                                              1]["bowling"][index]
                                                                      [
                                                                      "bowler"]["name"],
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          width: 42,
                                                          child: Center(
                                                            child: Text(
                                                              data["scorecard"][data["scorecard"].length -
                                                                              1]
                                                                          [
                                                                          "bowling"]
                                                                      [
                                                                      index]["o"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: isDarkMode
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 42,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["bowling"]
                                                                    [index]["m"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 42,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["bowling"]
                                                                    [index]["r"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 42,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["bowling"]
                                                                    [index]["w"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.5,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 44,
                                                          child: Text(
                                                            data["scorecard"][data["scorecard"]
                                                                            .length -
                                                                        1]["bowling"]
                                                                    [
                                                                    index]["eco"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: isDarkMode
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 1.5,
                                                width: 350,
                                                color: Colors.blueGrey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),

                        // Container(
                        //   margin: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "Next Player",
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: Color(0xFFFF4D00),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 10, left: 15, bottom: 15),
                        //   alignment: Alignment.topLeft,
                        //   child: Row(
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     children: [
                        //       CircleAvatar(
                        //         backgroundColor: Colors.white,
                        //         radius: 48,
                        //         child: Opacity(
                        //           opacity: 0.9,
                        //           child: CircleAvatar(
                        //             backgroundColor: Colors.black87,
                        //             backgroundImage: AssetImage("assets/virat.jpg"),
                        //             radius: 45,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 15,
                        //       ),
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         // ignore: prefer_const_literals_to_create_immutables
                        //         children: [
                        //           Text(
                        //             "Virat Kohli",
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 25),
                        //           ),
                        //           SizedBox(
                        //             height: 5,
                        //           ),
                        //           Row(
                        //             // ignore: prefer_const_literals_to_create_immutables
                        //             children: [
                        //               Text(
                        //                 "Age :",
                        //                 style: TextStyle(
                        //                   fontSize: 12.5,
                        //                   color: Colors.white,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 5,
                        //               ),
                        //               Text(
                        //                 "34 year",
                        //                 style: TextStyle(
                        //                   fontSize: 12.5,
                        //                   color: Colors.white,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           SizedBox(
                        //             height: 5,
                        //           ),
                        //           Row(
                        //             // ignore: prefer_const_literals_to_create_immutables
                        //             children: [
                        //               Text(
                        //                 "Total Runs :",
                        //                 style: TextStyle(
                        //                   fontSize: 12.5,
                        //                   color: Colors.white,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 5,
                        //               ),
                        //               Text(
                        //                 "8074",
                        //                 style: TextStyle(
                        //                   fontSize: 12.5,
                        //                   color: Colors.white,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           SizedBox(
                        //             height: 5,
                        //           ),
                        //           Row(
                        //             // ignore: prefer_const_literals_to_create_immutables
                        //             children: [
                        //               Text(
                        //                 "Strike Rate :",
                        //                 style: TextStyle(
                        //                   fontSize: 12.5,
                        //                   color: Colors.white,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 5,
                        //               ),
                        //               Text(
                        //                 "143",
                        //                 style: TextStyle(
                        //                   fontSize: 12.5,
                        //                   color: Colors.white,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 1.5,
                        //   width: 360,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "Yet To Bat",
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color(0xFFFF4D00),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 15),
                        //   child: GridView.builder(
                        //       scrollDirection: Axis.vertical,
                        //       physics: const ClampingScrollPhysics(),
                        //       shrinkWrap: true,
                        //       itemCount: 8,
                        //       gridDelegate:
                        //           const SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 2,
                        //         mainAxisSpacing: 1,
                        //         crossAxisSpacing: 20,
                        //         childAspectRatio: 1 / .4,
                        //       ),
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Container(
                        //           margin: EdgeInsets.only(right: 5),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             // ignore: prefer_const_literals_to_create_immutables
                        //             children: [
                        //               CircleAvatar(
                        //                 backgroundColor: Colors.blueGrey,
                        //                 radius: 20,
                        //                 child: Icon(
                        //                   Icons.person,
                        //                   color: Colors.white,
                        //                   size: 35,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Column(
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 // ignore: prefer_const_literals_to_create_immutables
                        //                 children: [
                        //                   Text(
                        //                     "Demo Name",
                        //                     style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: Colors.white,
                        //                     ),
                        //                   ),
                        //                   Text(
                        //                     "SR 79.99",
                        //                     style: TextStyle(
                        //                       fontSize: 12,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: Color(0xFFFF4D00),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         );
                        //       }),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   height: 1,
                        //   width: 360,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   height: 35,
                        //   width: 350,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 15),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       // ignore: prefer_const_literals_to_create_immutables
                        //       children: [
                        //         SizedBox(
                        //           width: 160,
                        //           child: Text(
                        //             'Batter',
                        //             style: TextStyle(
                        //                 color: Color(0xFFFF4D00),
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         Text(
                        //           'O',
                        //           style: TextStyle(
                        //               color: Color(0xFFFF4D00),
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           'M',
                        //           style: TextStyle(
                        //               color: Color(0xFFFF4D00),
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           'R',
                        //           style: TextStyle(
                        //               color: Color(0xFFFF4D00),
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           'W',
                        //           style: TextStyle(
                        //               color: Color(0xFFFF4D00),
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           'Eco',
                        //           style: TextStyle(
                        //               color: Color(0xFFFF4D00),
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   height: 35,
                        //   width: 350,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 15),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       // ignore: prefer_const_literals_to_create_immutables
                        //       children: [
                        //         SizedBox(
                        //           width: 160,
                        //           child: Text(
                        //             'Shahin Afridi',
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 5,
                        //         ),
                        //         Text(
                        //           '2.3',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           '0',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           '30',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           '0',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           '7.60',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   height: 1.5,
                        //   width: 360,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "Partnerships",
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color(0xFFFF4D00),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   height: 1.5,
                        //   width: 360,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 15, left: 15, bottom: 10),
                        //   alignment: Alignment.topLeft,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     children: [
                        //       Container(
                        //         alignment: Alignment.topLeft,
                        //         width: 150,
                        //         child: Text(
                        //           "Batter 1",
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 5,
                        //       ),
                        //       Container(
                        //         alignment: Alignment.topRight,
                        //         width: 150,
                        //         child: Text(
                        //           "Batter 2",
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   height: 1,
                        //   width: 360,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   alignment: Alignment.topRight,
                        //   margin: EdgeInsets.only(right: 25),
                        //   child: Text(
                        //     "1st WICKET",
                        //     style: TextStyle(
                        //         color: Colors.white, fontStyle: FontStyle.italic),
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                        //   alignment: Alignment.topLeft,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     children: [
                        //       Container(
                        //         alignment: Alignment.topLeft,
                        //         width: 125,
                        //         child: Text(
                        //           "Rahit Sharma",
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(left: 5, right: 5, top: 25),
                        //         alignment: Alignment.bottomCenter,
                        //         child: Row(
                        //           // ignore: prefer_const_literals_to_create_immutables
                        //           children: [
                        //             Text(
                        //               "29*",
                        //               style: TextStyle(
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Color(0xFFFF4D00),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 5,
                        //             ),
                        //             Text(
                        //               "(15)",
                        //               style: TextStyle(
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         alignment: Alignment.topRight,
                        //         width: 125,
                        //         child: Text(
                        //           "Shikhar Dhawan",
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: 72,
                        //       alignment: Alignment.topRight,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             "19/",
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //           Container(
                        //             margin: EdgeInsets.only(top: 8),
                        //             child: Text(
                        //               "7",
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5,
                        //     ),
                        //     Row(
                        //       children: [
                        //         Container(
                        //           height: 5,
                        //           width: 80,
                        //           color: Color(0xFFFF4D00),
                        //         ),
                        //         Container(
                        //           height: 5,
                        //           width: 80,
                        //           color: Colors.amber,
                        //         )
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       width: 5,
                        //     ),
                        //     Container(
                        //       width: 72,
                        //       alignment: Alignment.topLeft,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.end,
                        //         children: [
                        //           Text(
                        //             "10/",
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //           Container(
                        //             margin: EdgeInsets.only(top: 8),
                        //             child: Text(
                        //               "8",
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 25,
                        // ),
                        // Container(
                        //   height: 1,
                        //   width: 360,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 25,
                        // )
                      ]),
                    ),
                  );
                }
              },
    ),);
          
       
  }
}
