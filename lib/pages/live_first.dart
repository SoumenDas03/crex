// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, camel_case_types, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class live_first extends StatefulWidget {
  const live_first({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<live_first> createState() => _live_firstState();
}

class _live_firstState extends State<live_first> {
  // ignore: prefer_typing_uninitialized_variables
  var map, data, team1, team2, draw, total = 100;
  int randomD(int min, int max) {
    draw = min + Random().nextInt(max - min);
    return draw;
  }

  int randomT1(int min, int max) {
    team1 = min + Random().nextInt(max - min);
    return team1;
  }

  int randomT2() {
    team2 = total - team1 - draw;
    return team2;
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

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
                  )),
                  child: Column(children: [
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 160,
                      width: 400,
                      color: Color(0xff258D50),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 25),
                                child: Image.asset("assets/volume.png")),
                            Container(
                              margin: EdgeInsets.only(right: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                                            ? data["score"][data["score"].length - 1]
                                                                    ["inning"]
                                                                .indexOf(" ")
                                                            : data["score"][data["score"].length - 1]
                                                                    ["inning"]
                                                                .length) ==
                                                    data["teamInfo"][0]["name"].substring(
                                                        0,
                                                        (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                            ? data["teamInfo"][0]["name"]
                                                                .indexOf(" ")
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
                                                data["score"][data["score"].length - 1]
                                                                ["inning"]
                                                            .substring(
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
                                                                ? data["teamInfo"][0]
                                                                        ["name"]
                                                                    .indexOf(" ")
                                                                : data["teamInfo"][0]["name"].length)
                                                    ? data["teamInfo"][0]["shortname"]
                                                    : data["teamInfo"][1]["shortname"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '${data["score"][(data["score"].length) - 1]["r"]}-${data["score"][(data["score"].length) - 1]["w"]}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                height: 1, width: 400, color: Colors.white),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'CCR : ' +
                                      (data["score"][(data["score"].length) - 1]
                                                  ["r"] /
                                              data["score"][
                                                  (data["score"].length) -
                                                      1]["o"])
                                          .toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.5),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data["matchType"] != "test"
                                      ? 'RRR : 8.58'
                                      : "",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.5),
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
                    SizedBox(
                      height: 45,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: Container(
                        height: 155,
                        width: 155,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(width: 78, color: Colors.brown)),
                        child: PieChart(PieChartData(
                            centerSpaceRadius: 0,
                            centerSpaceColor: Colors.white,
                            // borderData: FlBorderData(show: false),
                            sections: [
                              PieChartSectionData(
                                  title: "Draw",
                                  titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                  value: randomD(0, 50).toDouble(),
                                  color: Colors.green[900],
                                  radius: 75),
                              PieChartSectionData(
                                  title: data["teams"][0].toString(),
                                  titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                  value: randomT1(0, 50).toDouble(),
                                  color: Colors.blue,
                                  radius: 75),
                              PieChartSectionData(
                                  title: data["teams"][1].toString(),
                                  titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                  value: randomT2().toDouble(),
                                  color: Colors.green,
                                  radius: 75)
                            ])),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data["teams"][0]} : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          team1.toString() + "%",
                          style: TextStyle(
                              color: Color(0xFFFF4D00),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          ',',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          data["teams"][1] + ' : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          team2.toString() + "%",
                          style: TextStyle(
                              color: Color(0xFFFF4D00),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          ',',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Draw : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          draw.toString() + "%   ",
                          style: TextStyle(
                              color: Color(0xFFFF4D00),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          ',',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total Votes : ' + random(2000, 3000).toString(),
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ]),
                );
              }
            },
          )),
    );
  }
}
