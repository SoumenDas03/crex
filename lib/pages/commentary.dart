// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'dart:ui';

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// ignore: camel_case_types
class commententary extends StatefulWidget {
  const commententary({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<commententary> createState() => _commententaryState();
}

// ignore: camel_case_types
class _commententaryState extends State<commententary> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // ignore: prefer_typing_uninitialized_variables
    var map,
        // ignore: prefer_typing_uninitialized_variables
        data,
        scoreMap,
        scoreData,
        wicketData,
        playerInfoMap,
        playerInfoData;
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
                    child: CircularProgressIndicator(),
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
                          image:  isDarkMode
                                          ? AssetImage('assets/background.jpeg')
                                          : AssetImage(
                                              "assets/bgLightMode.png"),
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
                                              '4',
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
                                                  'Over 18',
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
                                                    '4',
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
                                                    '0',
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
                                                    '4',
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
                                                    '1',
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
                                                    '0',
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
                                                    '1',
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
                                                  '10',
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
                                                  'Over 19',
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
                                                    '2',
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
                                                    '0',
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
                                                    '4',
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
                                                    '-',
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
                                                    '-',
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
                                                    '-',
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
                                                  '6',
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
                                                      BorderRadius.circular(32),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                      width: 0.5)),
                                              child: FutureBuilder(
                                                future: getPlayerInfo(
                                                    scoreData[0]["batsman"]
                                                            ["id"]
                                                        .toString()),
                                                builder: (context, snapshot) {
                                                  if (playerInfoData == null) {
                                                    return CircleAvatar(
                                                      radius: 32,
                                                      backgroundImage: NetworkImage(
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
                                                scoreData[0]["batsman"]["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              scoreData[0]["r"].toString() +
                                                  "(" +
                                                  scoreData[0]["b"].toString() +
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
                                                      BorderRadius.circular(32),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                      width: 0.5)),
                                              child: FutureBuilder(
                                                future: getPlayerInfo(
                                                    scoreData[1]["batsman"]
                                                            ["id"]
                                                        .toString()),
                                                builder: (context, snapshot) {
                                                  if (playerInfoData == null) {
                                                    return CircleAvatar(
                                                      radius: 32,
                                                      backgroundImage: NetworkImage(
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
                                                scoreData[1]["batsman"]["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              scoreData[1]["r"].toString() +
                                                  "(" +
                                                  scoreData[1]["b"].toString() +
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
                                                      BorderRadius.circular(32),
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
                                                            ["bowler"]["name"]
                                                        .toString()),
                                                builder: (context, snapshot) {
                                                  if (playerInfoData == null) {
                                                    return CircleAvatar(
                                                      radius: 32,
                                                      backgroundImage: NetworkImage(
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
                                                wicketData[wicketData.indexOf(
                                                        wicketData.last)]
                                                    ["bowler"]["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                          wicketData.last)]["r"]
                                                      .toString() +
                                                  '-' +
                                                  wicketData[wicketData.indexOf(
                                                          wicketData.last)]["w"]
                                                      .toString() +
                                                  '(' +
                                                  wicketData[wicketData.indexOf(
                                                          wicketData.last)]["o"]
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // CircleAvatar(
                                        //   radius: 18,

                                        // )

                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5),),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            '2',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5)),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            '0',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),

                                        Text(
                                          '=',
                                          style: TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                        ),

                                        SizedBox(
                                          width: 5,
                                        ),

                                        Text(
                                          '10',
                                          style: TextStyle(color: isDarkMode
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
                                          'Over 82',
                                          style: TextStyle(
                                              color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5),),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            '6',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5)),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            '4',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFF4D00),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5),),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            'W',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5),),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            '0',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5),),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            '2',
                                            style:
                                                TextStyle(color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                                  width: 0.5),),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 22,
                                          child: Text(
                                            'NB',
                                            style:
                                                TextStyle(color: isDarkMode
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
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text(
                                                'The oldest classcical British and Latin writing had little or no spance between world and could be written in (alterneting derections).',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                              ),
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
      ),
    );
  }
}
