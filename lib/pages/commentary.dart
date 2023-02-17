// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class commententary extends StatefulWidget {
  const commententary({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<commententary> createState() => _commententaryState();
}

class _commententaryState extends State<commententary> {
  @override
  Widget build(BuildContext context) {
    var map, data, scoreMap, scoreData, wicketData;
    getSingleCricketMatchDetails() async {
      try {
        http.Response response = await http.get(
          Uri.parse(
              'https://api.cricapi.com/v1/match_scorecard?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}'),
        );

        map = jsonDecode(response.body.toString());
        data = map["data"];
        if (response.statusCode == 200) {
          print("success");
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
                .where((element) => element["dismissal-text"] == "batting")
                .toList()
            : scoreMap["data"]["scorecard"][0]["batting"]
                .where((element) => element["dismissal-text"] == "batting")
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
                future: getMatchScores(),
                builder: (context, snapshot) {
                  if (scoreData == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        // ignore: prefer_const_constructors
                        image: DecorationImage(
                          // ignore: prefer_const_constructors
                          image: AssetImage(
                            "assets/background.jpeg",
                          ),
                          fit: BoxFit.cover,
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
                          Opacity(
                            opacity: 0.8,
                            child: Container(
                              height: 160,
                              width: 400,
                              color: Colors.blueGrey[900],
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(right: 25),
                                        child:
                                            Image.asset("assets/volume.png")),
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
                                                                    ? data["score"][data["score"].length - 1]["inning"]
                                                                        .indexOf(
                                                                            " ")
                                                                    : data["score"][data["score"].length - 1]["inning"]
                                                                        .length) ==
                                                            data["teamInfo"][0]["name"].substring(
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
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        '${data["score"][(data["score"].length) - 1]["r"]}-${data["score"][(data["score"].length) - 1]["w"]}',
                                                        style: TextStyle(
                                                            color: Colors.white,
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
                                                            color: Colors.white,
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
                                                            color: Colors.white,
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
                                              (data["score"][(data["score"]
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
                                        Image.asset('assets/live_tv.png')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Over 2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '=',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '10',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Over 3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '=',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '6',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundImage:
                                          AssetImage('assets/virat.jpg'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      scoreData[0]["batsman"]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
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
                                        color: Colors.white, fontSize: 12),
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
                                        borderRadius: BorderRadius.circular(32),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundImage:
                                          AssetImage('assets/jasprit.jpg'),
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
                                          color: Colors.white,
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
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
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
                                        borderRadius: BorderRadius.circular(32),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundImage:
                                          AssetImage('assets/m_nawaz.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 90,
                                    child: Text(
                                      wicketData[wicketData.indexOf(
                                          wicketData.last)]["bowler"]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    wicketData[wicketData.indexOf(
                                          wicketData.last)]["r"].toString() +'-' + wicketData[wicketData.indexOf(
                                          wicketData.last)]["w"].toString() + '(' + wicketData[wicketData.indexOf(
                                          wicketData.last)]["o"].toString() + ')',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // CircleAvatar(
                                  //   radius: 18,

                                  // )

                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      '2',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      '0',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text(
                                    '=',
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text(
                                    '10',
                                    style: TextStyle(color: Colors.white),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Over 82',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      '6',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      '4',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFF4D00),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      'W',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      '0',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      '2',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 22,
                                    child: Text(
                                      'NB',
                                      style: TextStyle(color: Colors.white),
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
                            margin: EdgeInsets.all(15),
                            child: Text(
                              'The oldest classcical British and Latin writing had little or no spance between world and could be written in (alterneting derections).',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
