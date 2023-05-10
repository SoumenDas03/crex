// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:crex/pages/pipPage.dart';
import 'package:crex/pages/singlePlayer_info.dart';
import 'package:crex/pages/speech_settings.dart';
import 'package:crex/pages/win_prediction.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:floating/floating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class live_second extends StatefulWidget {
  const live_second({Key? key, required this.id, required this.theme})
      : super(key: key);

  final String id;
  final String theme;

  @override
  State<live_second> createState() => _live_secondState();
}

class _live_secondState extends State<live_second> with WidgetsBindingObserver {
  var map, data, sugamWicket, wicketOrderData, bbbmap, bbbData, mapBetting;
  bool flag = false;
  final floating = Floating();
  bool numberview = false;
  bool percentage = true;
  bool status = false;
  bool status2 = true;
  int _value = 2;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
    noob();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    noob();
  }

  noob() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _value = int.parse(sharedPreferences.getString('value') ?? "2");
    if (_value == 1) {
      numberview = false;
      percentage = true;
    } else {
      numberview = true;
      percentage = false;
    }
  }

  Future<void> enablePip(BuildContext context) async {
    final rational = Rational.square();
    final screenSize =
        MediaQuery.of(context).size * MediaQuery.of(context).devicePixelRatio;

    final status = await floating.enable(
      aspectRatio: rational,
      sourceRectHint: Rectangle<int>(
        0,
        0,
        screenSize.width.toInt(),
        screenSize.width ~/ rational.aspectRatio,
      ),
    );
    debugPrint('PiP enabled? $status');
  }

  getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=dfe5a856-430f-49e9-99f4-6a994d3d76e8&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      sugamWicket = data["scorecard"].length > 1
          ? data["scorecard"][0]["bowling"] + data["scorecard"][1]["bowling"]
          : data["scorecard"][0]["bowling"];
      sugamWicket.sort((a, b) {
        return a['w'].compareTo(b['w']) as int;
      });
      wicketOrderData = sugamWicket.reversed.toList();
      if (response.statusCode == 200) {
        setState(() {
          print("refreshing.....");
        });
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

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/background.jpeg",
                        ),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Real-time Win Probability ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        height: 1,
                        width: 350,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Select a view of your choice',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF4D00)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Radio(
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) async {
                                setState(() {
                                  _value = 1;
                                  numberview = false;
                                  percentage = true;
                                });
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    'value', _value.toString());
                              }),
                          Text(
                            'Win Percentage View',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 40),
                      height: 60,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                data["teamInfo"][0]["shortname"] + '25%',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                'DRAW 35%',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                data["teamInfo"][1]["shortname"] + '40%',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 10,
                                width: 60,
                                color: Colors.orangeAccent,
                              ),
                              Container(
                                height: 10,
                                width: 85,
                                color: Colors.green[900],
                              ),
                              Container(
                                height: 10,
                                width: 95,
                                color: Colors.blue,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Radio(
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) async {
                                setState(() {
                                  _value = 2;
                                  numberview = true;
                                  percentage = false;
                                });
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    'value', _value.toString());
                              }),
                          Text(
                            'Number View',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data["teamInfo"][0]["shortname"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xFFFF4D00),
                            ),
                            child: Text(
                              '17',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange,
                            ),
                            child: Text(
                              '17.5',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Container(
                            height: 35,
                            width: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            data["teamInfo"][1]["shortname"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xFFFF4D00),
                            ),
                            child: Text(
                              '17',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange,
                            ),
                            child: Text(
                              '17.5',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Realtime Score Projection',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF4D00)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Mid Ov Score Projection',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(
                            width: 95,
                          ),
                          Switch(
                            activeColor: Colors.blueGrey,
                            activeTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            value: status,
                            onChanged: (value) {
                              // ignore: avoid_print
                              print("VALUE : $value");
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '50 Ov Runs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'NO',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'YES',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Full Match Score Projection',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Switch(
                            activeColor: Colors.blueGrey,
                            activeTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            value: status2,
                            onChanged: (value) {
                              // ignore: avoid_print
                              print("VALUE : $value");
                              setState(() {
                                status2 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '100 Ov Runs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'NO',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'YES',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                )),
          );
        });
      },
    );
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
            return Center(child: CircularProgressIndicator());
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
                          )),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                height: 1,
                                width: 350,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 4,
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
                                padding: const EdgeInsets.only(
                                    right: 5.0, left: 5.0, bottom: 3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    color: isDarkMode
                                        ? Color(0xffFF8A00)
                                        : const Color(0xFFDFDFDF),
                                    child: Text(
                                      data["status"].toString(),
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showModalBottomSheet();
                                  setState(() {});
                                },
                                child: Visibility(
                                  visible: numberview,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: isDarkMode
                                                ? Colors.blueGrey[900]
                                                : const Color(0xFFDFDFDF)),
                                        height: 45,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(width: 25),
                                                Text(
                                                  data["score"][data["score"].length - 1]["inning"].substring(
                                                              0,
                                                              (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1)
                                                                  ? data["score"][data["score"].length - 1]["inning"]
                                                                      .indexOf(
                                                                          " ")
                                                                  : data["score"][data["score"].length - 1]["inning"]
                                                                      .length) ==
                                                          data["teamInfo"][0]["name"].substring(
                                                              0,
                                                              (data["teamInfo"][0]["name"].indexOf(" ") !=
                                                                      -1)
                                                                  ? data["teamInfo"]
                                                                              [0]
                                                                          ["name"]
                                                                      .indexOf(" ")
                                                                  : data["teamInfo"][0]["name"].length)
                                                      ? data["teamInfo"][0]["shortname"]
                                                      : data["teamInfo"][1]["shortname"],
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                SizedBox(
                                                  width: 1,
                                                ),
                                                Icon(
                                                  Icons.info_outline,
                                                  size: 12,
                                                  color: isDarkMode
                                                      ? Colors.white54
                                                      : Colors.black54,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              height: 35,
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.green,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text(
                                                  data["score"][data["score"].length - 1]["inning"].substring(
                                                              0,
                                                              (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1)
                                                                  ? data["score"][data["score"].length - 1]["inning"]
                                                                      .indexOf(
                                                                          " ")
                                                                  : data["score"][data["score"].length - 1]["inning"]
                                                                      .length) ==
                                                          data["teamInfo"][0]["name"].substring(
                                                              0,
                                                              (data["teamInfo"][0]["name"].indexOf(" ") !=
                                                                      -1)
                                                                  ? data["teamInfo"]
                                                                              [0]
                                                                          ["name"]
                                                                      .indexOf(" ")
                                                                  : data["teamInfo"][0]["name"].length)
                                                      ? data["teamInfo"][0]["shortname"]
                                                      : data["teamInfo"][1]["shortname"],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: isDarkMode
                                                    ? Colors.blue
                                                    : Colors.black45,
                                              ),
                                              child: Text(
                                                mapBetting["point"] != ""
                                                    ? mapBetting["point"][6]
                                                        .toString()
                                                    : "56",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: isDarkMode
                                                    ? Color(0xFFFF4D00)
                                                    : Colors.black26,
                                              ),
                                              child: Text(
                                                mapBetting["point"] != ""
                                                    ? mapBetting["point"][14]
                                                        .toString()
                                                    : "57",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'View',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showModalBottomSheet();
                                  setState(() {});
                                },
                                child: Visibility(
                                  visible: percentage,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: isDarkMode
                                              ? Colors.blueGrey[900]
                                              : const Color(0xFFDFDFDF),
                                        ),
                                        // width: 300,
                                        height: 45,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      data["teamInfo"][0]
                                                          ["shortname"],
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 150,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      data["teamInfo"][1]
                                                          ["shortname"],
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Text(
                                                      "60%",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    LinearPercentIndicator(
                                                      width: 150.0,
                                                      lineHeight: 12.0,
                                                      percent: 0.6,
                                                      animation: true,
                                                      linearStrokeCap:
                                                          LinearStrokeCap
                                                              .roundAll,
                                                      progressColor:
                                                          Colors.greenAccent,
                                                      animationDuration: 2500,
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      "40%",
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'View',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
      
                              // Padding(
                              //   padding: const EdgeInsets.all(5.0),
                              //   child: Opacity(
                              //     opacity: 0.8,
                              //     child: Container(
                              //       alignment: Alignment.center,
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(10),
                              //         // border: Border.all(color: Colors.white, width: 0.5)
      
                              //         color: isDarkMode
                              //             ? Colors.blueGrey[900]
                              //             : const Color(0xFFDFDFDF),
                              //       ),
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(5.0),
                              //         child: Row(
                              //           crossAxisAlignment: CrossAxisAlignment.center,
                              //           mainAxisAlignment: MainAxisAlignment.center,
                              //           children: [
                              //             Container(
                              //               alignment: Alignment.centerLeft,
                              //               width: 100,
                              //               child: data["score"].length > 1
                              //                   ? Text(
                              //                       data["score"][1]["inning"]
                              //                           .substring(
                              //                               0,
                              //                               ((data["score"][1]
                              //                                           ["inning"]
                              //                                       .indexOf(
                              //                                           "Inning")) -
                              //                                   1)),
                              //                       style: TextStyle(
                              //                         fontWeight: FontWeight.bold,
                              //                         color: isDarkMode
                              //                             ? Colors.white
                              //                             : Colors.black,
                              //                       ),
                              //                     )
                              //                   : Text(
                              //                       data["score"][0]["inning"]
                              //                           .substring(
                              //                               0,
                              //                               ((data["score"][0]
                              //                                           ["inning"]
                              //                                       .indexOf(
                              //                                           "Inning")) -
                              //                                   1)),
                              //                       style: TextStyle(
                              //                         fontWeight: FontWeight.bold,
                              //                         color: isDarkMode
                              //                             ? Colors.white
                              //                             : Colors.black,
                              //                       ),
                              //                     ),
                              //             ),
                              //             SizedBox(
                              //               width: 5,
                              //             ),
                              //             Container(
                              //               height: 25,
                              //               width: 55,
                              //               decoration: BoxDecoration(
                              //                   borderRadius:
                              //                       BorderRadius.circular(2.5),
                              //                   border: Border.all(
                              //                       color: isDarkMode
                              //                           ? Colors.white
                              //                           : Colors.black,
                              //                       width: 0.5)),
                              //               child: Row(
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.center,
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment.center,
                              //                   children: [
                              //                     data["score"].length > 1
                              //                         ? Text(
                              //                             (data["score"][1]["inning"].substring(
                              //                                     0,
                              //                                     ((data["score"][1][
                              //                                                 "inning"]
                              //                                             .indexOf(
                              //                                                 "Inning")) -
                              //                                         1)))
                              //                                 .substring(0, 3),
                              //                             style: TextStyle(
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                               color: isDarkMode
                              //                                   ? Colors.white
                              //                                   : Colors.black,
                              //                             ),
                              //                           )
                              //                         : Text(
                              //                             (data["score"][0]["inning"].substring(
                              //                                     0,
                              //                                     ((data["score"][0][
                              //                                                 "inning"]
                              //                                             .indexOf(
                              //                                                 "Inning")) -
                              //                                         1)))
                              //                                 .substring(0, 3),
                              //                             style: TextStyle(
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                               color: isDarkMode
                              //                                   ? Colors.white
                              //                                   : Colors.black,
                              //                             ),
                              //                           ),
                              //                     SizedBox(
                              //                       width: 5,
                              //                     ),
                              //                     Image.asset(
                              //                       "assets/matches.png",
                              //                       scale: 1.5,
                              //                     )
                              //                   ]),
                              //             ),
                              //             SizedBox(
                              //               width: 5,
                              //             ),
                              //             Container(
                              //               alignment: Alignment.center,
                              //               height: 25,
                              //               width: 55,
                              //               decoration: BoxDecoration(
                              //                 borderRadius: BorderRadius.circular(3),
                              //                 // border: Border.all(
                              //                 //     color: Colors.white, width: 0.5)
      
                              //                 color: Colors.black45,
                              //               ),
                              //               child: Text(
                              //                 '16',
                              //                 style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontWeight: FontWeight.bold,
                              //                 ),
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               width: 5,
                              //             ),
                              //             Container(
                              //               alignment: Alignment.center,
                              //               height: 25,
                              //               width: 55,
                              //               decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(2.5),
                              //                 // border: Border.all(
                              //                 //     color: Colors.white, width: 0.5)
      
                              //                 color: isDarkMode
                              //                     ? Color(0xffFF8A00)
                              //                     : Colors.black26,
                              //               ),
                              //               child: Text(
                              //                 '22',
                              //                 style: TextStyle(
                              //                   color: isDarkMode
                              //                       ? Colors.white
                              //                       : Colors.black,
                              //                   fontWeight: FontWeight.bold,
                              //                 ),
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               width: 15,
                              //             ),
                              //             Text(
                              //               'View',
                              //               style: TextStyle(
                              //                   color: isDarkMode
                              //                       ? Colors.white
                              //                       : Colors.black,
                              //                   fontStyle: FontStyle.italic),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // border: Border.all(color: Colors.white, width: 0.5)
      
                                      color: isDarkMode
                                          ? Colors.blueGrey[900]
                                          : const Color(0xFFDFDFDF),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              data["scorecard"].length > 1
                                                  ? Text(
                                                      "Over: ${data["scorecard"][data["scorecard"].length - 1]["totals"]["O"]}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    )
                                                  : Text(
                                                      "Over: " +
                                                          (data["scorecard"][data[
                                                                              "scorecard"]
                                                                          .length -
                                                                      1]["totals"]["O"] *
                                                                  2)
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                              SizedBox(
                                                width: 75,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  // border: Border.all(
                                                  //     color: Colors.white, width: 0.5)
      
                                                  color: isDarkMode
                                                      ? Colors.blue
                                                      : Colors.black45,
                                                ),
                                                child: Text(
                                                  'NO 79',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.5),
                                                  // border: Border.all(
                                                  //     color: Colors.white, width: 0.5)
      
                                                  color: isDarkMode
                                                      ? Colors.red
                                                      : Colors.black26,
                                                ),
                                                child: Text(
                                                  'YES 200',
                                                  style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Container(
                                            height: 1,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Open 150',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              'Min 120',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              'Max 150',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 45,
                                            ),
                                            Text(
                                              '10 runs in 9 balls',
                                              style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: data["scorecard"]
                                                [data["scorecard"].length - 1]
                                            ["totals"]["O"] >
                                        10
                                    ? true
                                    : false,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // border: Border.all(color: Colors.white, width: 0.5)
      
                                        color: isDarkMode
                                            ? Colors.blueGrey[900]
                                            : const Color(0xFFDFDFDF),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                data["scorecard"].length > 1
                                                    ? Text(
                                                        "Over: ${data["scorecard"][data["scorecard"].length - 1]["totals"]["O"] * 2}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      )
                                                    : Text(
                                                        "Over: ${data["scorecard"][data["scorecard"].length - 1]["totals"]["O"] * 2}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 30,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    // border: Border.all(
                                                    //     color: Colors.white, width: 0.5)
      
                                                    color: isDarkMode
                                                        ? Colors.blue
                                                        : Colors.black45,
                                                  ),
                                                  child: Text(
                                                    'NO 79',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 30,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.5),
                                                    // border: Border.all(
                                                    //     color: Colors.white, width: 0.5)
      
                                                    color: isDarkMode
                                                        ? Colors.red
                                                        : Colors.black26,
                                                  ),
                                                  child: Text(
                                                    'YES 200',
                                                    style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Container(
                                              height: 1,
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.blueGrey,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Open 150',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                'Min 120',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                'Max 150',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 45,
                                              ),
                                              Text(
                                                '10 runs in 9 balls',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    color: isDarkMode
                                        ? Color(0xffFF8A00)
                                        : Colors.black26,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Batter',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 115,
                                          ),
                                          Text(
                                            'R',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'B',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            '4s',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(
                                            '6s',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(
                                            'SR',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: isDarkMode
                                        ? Colors.blueGrey[900]
                                        : const Color(0xFFDFDFDF),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => singlePlayer_info(
                                                          playerId: data["scorecard"][data["scorecard"].length - 1]["batting"].where((element) => element["dismissal-text"] == "not out").map((element) => element["batsman"]["id"]).toList().length > 0
                                                              ? data["scorecard"]
                                                                          [data["scorecard"].length - 1][
                                                                      "batting"]
                                                                  .where((element) =>
                                                                      element["dismissal-text"] ==
                                                                      "not out")
                                                                  .map((element) => element["batsman"]
                                                                      ["id"])
                                                                  .toList()[0]
                                                                  .toString()
                                                              : data["scorecard"]
                                                                          [data["scorecard"].length - 1]
                                                                      ["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]
                                                                  ["batsman"]["id"]),
                                                    ));
                                              },
                                              child: Container(
                                                width: 132,
                                                child: Text(
                                                  data["scorecard"][data["scorecard"].length - 1]
                                                                  ["batting"]
                                                              .where((element) =>
                                                                  element["dismissal-text"] ==
                                                                  "not out")
                                                              .map((element) =>
                                                                  element[
                                                                      "batsman"])
                                                              .toList()
                                                              .length >
                                                          0
                                                      ? data["scorecard"]
                                                                  [data["scorecard"].length - 1]
                                                              ["batting"]
                                                          .where((element) =>
                                                              element["dismissal-text"] == "not out")
                                                          .map((element) => element["batsman"])
                                                          .toList()[0]["name"]
                                                          .toString()
                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]["batsman"]["name"],
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                data["scorecard"][data["scorecard"].length - 1]
                                                                ["batting"]
                                                            .where((element) =>
                                                                element["dismissal-text"] ==
                                                                "not out")
                                                            .map((element) => element[
                                                                "batsman"])
                                                            .toList()
                                                            .length >
                                                        0
                                                    ? data["scorecard"][data["scorecard"].length - 1]
                                                            ["batting"]
                                                        .where((element) =>
                                                            element["dismissal-text"] == "not out")
                                                        .map((element) => element["r"])
                                                        .toList()[0]
                                                        .toString()
                                                    : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]["r"].toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                data["scorecard"][data["scorecard"].length - 1]
                                                                ["batting"]
                                                            .where((element) =>
                                                                element["dismissal-text"] ==
                                                                "not out")
                                                            .map((element) => element[
                                                                "batsman"])
                                                            .toList()
                                                            .length >
                                                        0
                                                    ? data["scorecard"][data["scorecard"].length - 1]
                                                            ["batting"]
                                                        .where((element) =>
                                                            element["dismissal-text"] == "not out")
                                                        .map((element) => element["b"])
                                                        .toList()[0]
                                                        .toString()
                                                    : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]["b"].toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                data["scorecard"][data["scorecard"].length - 1]
                                                                ["batting"]
                                                            .where((element) =>
                                                                element["dismissal-text"] ==
                                                                "not out")
                                                            .map((element) => element[
                                                                "batsman"])
                                                            .toList()
                                                            .length >
                                                        0
                                                    ? data["scorecard"][data["scorecard"].length - 1]
                                                            ["batting"]
                                                        .where((element) =>
                                                            element["dismissal-text"] == "not out")
                                                        .map((element) => element["4s"])
                                                        .toList()[0]
                                                        .toString()
                                                    : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]["4s"].toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                data["scorecard"][data["scorecard"].length - 1]
                                                                ["batting"]
                                                            .where((element) =>
                                                                element["dismissal-text"] ==
                                                                "not out")
                                                            .map((element) => element[
                                                                "batsman"])
                                                            .toList()
                                                            .length >
                                                        0
                                                    ? data["scorecard"][data["scorecard"].length - 1]
                                                            ["batting"]
                                                        .where((element) =>
                                                            element["dismissal-text"] == "not out")
                                                        .map((element) => element["6s"])
                                                        .toList()[0]
                                                        .toString()
                                                    : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]["6s"].toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                data["scorecard"][data["scorecard"].length - 1]
                                                                ["batting"]
                                                            .where((element) =>
                                                                element["dismissal-text"] ==
                                                                "not out")
                                                            .map((element) => element[
                                                                "batsman"])
                                                            .toList()
                                                            .length >
                                                        0
                                                    ? data["scorecard"][data["scorecard"].length - 1]
                                                            ["batting"]
                                                        .where((element) =>
                                                            element["dismissal-text"] == "not out")
                                                        .map((element) => element["sr"])
                                                        .toList()[0]
                                                        .toString()
                                                    : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 2]["sr"].toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 350,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color: isDarkMode
                                              ? Colors.black45
                                              : const Color(0xFFDFDFDF),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 145,
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => singlePlayer_info(
                                                                  playerId: data["scorecard"][data["scorecard"].length - 1]["batting"].where((element) => element["dismissal-text"] == "not out").map((element) => element["batsman"]["id"]).toList().length >
                                                                          1
                                                                      ? data["scorecard"][data["scorecard"].length - 1]
                                                                              [
                                                                              "batting"]
                                                                          .where((element) =>
                                                                              element["dismissal-text"] ==
                                                                              "not out")
                                                                          .map((element) =>
                                                                              element["batsman"]["id"])
                                                                          .toList()[1]
                                                                          .toString()
                                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]["batsman"]["id"].toString()),
                                                            ));
                                                      },
                                                      child: Container(
                                                        width: 125,
                                                        child: Text(
                                                          data["scorecard"][data["scorecard"].length - 1]["batting"].where((element) => element["dismissal-text"] == "not out").map((element) => element["batsman"]).toList().length >
                                                                  1
                                                              ? data["scorecard"]
                                                                          [data["scorecard"].length - 1]
                                                                      [
                                                                      "batting"]
                                                                  .where((element) =>
                                                                      element["dismissal-text"] ==
                                                                      "not out")
                                                                  .map((element) =>
                                                                      element[
                                                                          "batsman"])
                                                                  .toList()[1]
                                                                      ["name"]
                                                                  .toString()
                                                              : data["scorecard"]
                                                                              [data["scorecard"].length - 1]["batting"]
                                                                          [data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]
                                                                      ["batsman"]["name"]
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color: isDarkMode
                                                                  ? Colors.white
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
                                                    Image.asset(
                                                      "assets/matches.png", color: Color(0xFFFF4D00),
                                                      scale: 4.2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.5,
                                              ),
                                              Container(
                                                width: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  data["scorecard"][data["scorecard"].length - 1]
                                                                  ["batting"]
                                                              .where((element) =>
                                                                  element["dismissal-text"] ==
                                                                  "not out")
                                                              .map((element) =>
                                                                  element[
                                                                      "batsman"])
                                                              .toList()
                                                              .length >
                                                          1
                                                      ? data["scorecard"]
                                                                  [data["scorecard"].length - 1]
                                                              ["batting"]
                                                          .where(
                                                              (element) => element["dismissal-text"] == "not out")
                                                          .map((element) => element["r"])
                                                          .toList()[1]
                                                          .toString()
                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]["r"].toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.5,
                                              ),
                                              Container(
                                                width: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  data["scorecard"][data["scorecard"].length - 1]
                                                                  ["batting"]
                                                              .where((element) =>
                                                                  element["dismissal-text"] ==
                                                                  "not out")
                                                              .map((element) =>
                                                                  element[
                                                                      "batsman"])
                                                              .toList()
                                                              .length >
                                                          1
                                                      ? data["scorecard"]
                                                                  [data["scorecard"].length - 1]
                                                              ["batting"]
                                                          .where(
                                                              (element) => element["dismissal-text"] == "not out")
                                                          .map((element) => element["b"])
                                                          .toList()[1]
                                                          .toString()
                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]["b"].toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.5,
                                              ),
                                              Container(
                                                width: 32,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  data["scorecard"][data["scorecard"].length - 1]
                                                                  ["batting"]
                                                              .where((element) =>
                                                                  element["dismissal-text"] ==
                                                                  "not out")
                                                              .map((element) =>
                                                                  element[
                                                                      "batsman"])
                                                              .toList()
                                                              .length >
                                                          1
                                                      ? data["scorecard"]
                                                                  [data["scorecard"].length - 1]
                                                              ["batting"]
                                                          .where(
                                                              (element) => element["dismissal-text"] == "not out")
                                                          .map((element) => element["4s"])
                                                          .toList()[1]
                                                          .toString()
                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]["4s"].toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.5,
                                              ),
                                              Container(
                                                width: 32,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  data["scorecard"][data["scorecard"].length - 1]
                                                                  ["batting"]
                                                              .where((element) =>
                                                                  element["dismissal-text"] ==
                                                                  "not out")
                                                              .map((element) =>
                                                                  element[
                                                                      "batsman"])
                                                              .toList()
                                                              .length >
                                                          1
                                                      ? data["scorecard"]
                                                                  [data["scorecard"].length - 1]
                                                              ["batting"]
                                                          .where(
                                                              (element) => element["dismissal-text"] == "not out")
                                                          .map((element) => element["6s"])
                                                          .toList()[1]
                                                          .toString()
                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]["6s"].toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.5,
                                              ),
                                              Container(
                                                width: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  data["scorecard"][data["scorecard"].length - 1]
                                                                  ["batting"]
                                                              .where((element) =>
                                                                  element["dismissal-text"] ==
                                                                  "not out")
                                                              .map((element) =>
                                                                  element[
                                                                      "batsman"])
                                                              .toList()
                                                              .length >
                                                          1
                                                      ? data["scorecard"]
                                                                  [data["scorecard"].length - 1]
                                                              ["batting"]
                                                          .where(
                                                              (element) => element["dismissal-text"] == "not out")
                                                          .map((element) => element["sr"])
                                                          .toList()[1]
                                                          .toString()
                                                      : data["scorecard"][data["scorecard"].length - 1]["batting"][data["scorecard"][data["scorecard"].length - 1]["batting"].length - 1]["sr"].toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    color: isDarkMode
                                        ? Color(0xffFF8A00)
                                        : Colors.black26,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bowler',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text(
                                            'O',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'M',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'R',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'W',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'Eco',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(0),
                                    // border: Border.all(color: Colors.white, width: 0.5)
      
                                    color: isDarkMode
                                        ? Colors.blueGrey[900]
                                        : const Color(0xFFDFDFDF),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 10, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          singlePlayer_info(
                                                              playerId:
                                                                  wicketOrderData[
                                                                              0]
                                                                          [
                                                                          "bowler"]
                                                                      ["id"]),
                                                    ));
                                              },
                                              child: Container(
                                                width: 135,
                                                child: Text(
                                                  wicketOrderData[0]["bowler"]
                                                      ["name"],
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                wicketOrderData[0]["o"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                wicketOrderData[0]["m"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                wicketOrderData[0]["r"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                wicketOrderData[0]["w"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.5,
                                            ),
                                            Container(
                                              width: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                wicketOrderData[0]["eco"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // border: Border.all(color: Colors.white, width: 0.5)
                                      color: isDarkMode
                                          ? Colors.blueGrey[900]
                                          : const Color(0xFFDFDFDF),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Who will win ?',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: isDarkMode
                                                        ? Colors.blueGrey[100]
                                                        : Colors.black45),
                                              ),
                                              SizedBox(
                                                width: 45,
                                              ),
                                              Text(
                                                'Total Votes:2,25,222',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: isDarkMode
                                                        ? Colors.blueGrey[100]
                                                        : Colors.black45),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Container(
                                            height: 1,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                // border: Border.all(
                                                //     color: Colors.white, width: 0.5)
                                                color: isDarkMode
                                                    ? Colors.amber
                                                    : Colors.black26,
                                              ),
                                              child: Text(
                                                data["teamInfo"][0]["shortname"]
                                                    .toString(),
                                                style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.5),
                                                  border: Border.all(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 1)),
                                              child: Text(
                                                'DRAW',
                                                style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.5),
                                                  // border: Border.all(
                                                  //     color: Colors.white, width: 0.5)
                                                  color: isDarkMode
                                                      ? Colors.green
                                                      : Colors.grey),
                                              child: Text(
                                                data["teamInfo"][1]["shortname"]
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    // border: Border.all(color: Colors.white, width: 0.5)
      
                                    color: isDarkMode
                                        ? Color(0xffFF8A00)
                                        : const Color(0xFFDFDFDF),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.share_sharp,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Share Application',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  height: 45,
                                  width: 350,
                                  color: isDarkMode
                                      ? Colors.blueGrey[900]
                                      : const Color(0xFFDFDFDF),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: InkWell(
                                      onTap: () {
                                        setState(
                                          () {
                                            flag = flag ? false : true;
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.settings,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Match Settings',
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.only(
                              //           bottomLeft: Radius.circular(5),
                              //           bottomRight: Radius.circular(5),
                              //           topLeft: Radius.circular(5),
                              //           topRight: Radius.circular(5)),
                              //       // border: Border.all(color: Colors.white, width: 0.5)
      
                              //       color: Colors.blueGrey[900],
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.all(12),
                              //           child: Row(
                              //             children: [
                              //               Text(
                              //                 'LOGO',
                              //                 style: TextStyle(
                              //                     fontWeight: FontWeight.bold,
                              //                     color: Colors.white,
                              //                     fontSize: 25),
                              //               ),
                              //               SizedBox(
                              //                 width: 10,
                              //               ),
                              //               Container(
                              //                 decoration: BoxDecoration(
                              //                   borderRadius: BorderRadius.circular(5),
                              //                   color: Colors.amber,
                              //                 ),
                              //                 alignment: Alignment.center,
                              //                 height: 22,
                              //                 width: 60,
                              //                 child: Text(
                              //                   'PREMIUM',
                              //                   style: TextStyle(
                              //                       fontSize: 12, fontWeight: FontWeight.bold),
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: 130,
                              //               ),
                              //               Container(
                              //                   height: 25,
                              //                   width: 25,
                              //                   decoration: BoxDecoration(
                              //                     borderRadius: BorderRadius.circular(2),
                              //                     color: Colors.white,
                              //                   ),
                              //                   child: Icon(
                              //                     Icons.close,
                              //                   ))
                              //             ],
                              //           ),
                              //         ),
                              //         Container(
                              //           height: 1,
                              //           width: 350,
                              //           color: Colors.white,
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.all(15),
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //                 children: [
                              //                   Icon(Icons.ad_units_sharp),
                              //                   SizedBox(
                              //                     width: 5,
                              //                   ),
                              //                   Text(
                              //                     'Get ad-free experience',
                              //                     style: TextStyle(color: Colors.white),
                              //                   )
                              //                 ],
                              //               ),
                              //               SizedBox(
                              //                 height: 10,
                              //               ),
                              //               Row(
                              //                 children: [
                              //                   Icon(Icons.auto_graph),
                              //                   SizedBox(
                              //                     width: 5,
                              //                   ),
                              //                   Flexible(
                              //                     child: Text(
                              //                       'Analyse like a pro with win probablity, worm & more graph',
                              //                       style: TextStyle(color: Colors.white),
                              //                     ),
                              //                   )
                              //                 ],
                              //               ),
                              //               SizedBox(
                              //                 height: 10,
                              //               ),
                              //               Row(
                              //                 children: [
                              //                   Icon(Icons.pinch),
                              //                   SizedBox(
                              //                     width: 5,
                              //                   ),
                              //                   Text(
                              //                     'Pin Score with PRO analytics',
                              //                     style: TextStyle(color: Colors.white),
                              //                   )
                              //                 ],
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //         Container(
                              //           margin: EdgeInsets.only(left: 20),
                              //           alignment: Alignment.centerLeft,
                              //           child: ClipRRect(
                              //             borderRadius: BorderRadius.only(
                              //                 topLeft: Radius.circular(30),
                              //                 bottomLeft: Radius.circular(30),
                              //                 topRight: Radius.circular(45)),
                              //             child: Container(
                              //               height: 30,
                              //               width: 110,
                              //               decoration: BoxDecoration(
                              //                 gradient: LinearGradient(
                              //                     colors: [
                              //                       Color(0xFFFF4D00),
                              //                       Colors.orange,
                              //                       Color(0x00ff7a00)
                              //                     ],
                              //                     end: Alignment.bottomRight,
                              //                     stops: [
                              //                       0.4,
                              //                       1,
                              //                       1,
                              //                     ]),
                              //               ),
                              //               child: Row(
                              //                 crossAxisAlignment: CrossAxisAlignment.center,
                              //                 mainAxisAlignment: MainAxisAlignment.center,
                              //                 children: [
                              //                   Text(
                              //                     'See all plans',
                              //                     style: TextStyle(
                              //                         color: Colors.white,
                              //                         fontWeight: FontWeight.bold,
                              //                         fontSize: 12),
                              //                   )
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           height: 25,
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Visibility(
                                visible: flag,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    // border: Border.all(color: Colors.white, width: 0.5)
                                    color: isDarkMode
                                        ? Colors.blueGrey[900]
                                        : const Color(0xFFDFDFDF),
                                  ),
                                  child: Column(children: [
                                    Container(
                                      height: 1,
                                      width: 350,
                                      color: isDarkMode
                                          ? Colors.blueGrey[200]
                                          : const Color(0xFFDFDFDF),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 20),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const win_prediction(),
                                                  ));
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.emoji_events,
                                                  color: isDarkMode
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Win Probability View',
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white70
                                                          : Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const speech_settings(),
                                                  ));
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.record_voice_over,
                                                  color: isDarkMode
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Speech Settings (Accessibility)',
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white70
                                                          : Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // showModalBottomSheet(
                                              //     isScrollControlled: true,
                                              //     // shape: RoundedRectangleBorder(
                                              //     //   borderRadius: BorderRadiusDirectional.only(
                                              //     //       topStart: Radius.circular(45), topEnd: Radius.circular(45)),
                                              //     // ),
                                              //     elevation: 5,
                                              //     context: context,
                                              //     builder: (BuildContext context) {
                                              //       return StatefulBuilder(
                                              //           builder: (context, setState) {
                                              //         return SizedBox(
                                              //           height: 375,
                                              //           child: DefaultTabController(
                                              //             length: 2,
                                              //             child: Scaffold(
                                              //               appBar: AppBar(
                                              //                 backgroundColor: Colors.black,
                                              //                 automaticallyImplyLeading:
                                              //                     false,
                                              //                 title: TabBar(
                                              //                   // labelColor: Colors.amber,
                                              //                   indicatorColor:
                                              //                       Color(0xFFFF4D00),
                                              //                   tabs: [
                                              //                     Tab(
                                              //                       text: "Live Match",
                                              //                     ),
                                              //                     Tab(
                                              //                         text:
                                              //                             "Series Updates"),
                                              //                   ],
                                              //                 ),
                                              //                 actions: [
                                              //                   Padding(
                                              //                     padding:
                                              //                         const EdgeInsets.all(
                                              //                             10),
                                              //                     child: IconButton(
                                              //                         onPressed: () {
                                              //                           Navigator.pop(
                                              //                               context);
                                              //                         },
                                              //                         icon: Icon(
                                              //                           Icons.close,
                                              //                           color: Colors.white,
                                              //                         )),
                                              //                   )
                                              //                 ],
                                              //               ),
                                              //               body: Container(
                                              //                 color: Colors.black,
                                              //                 child: TabBarView(
                                              //                   children: [
                                              //                     Column(
                                              //                       children: [
                                              //                         Row(
                                              //                           mainAxisAlignment:
                                              //                               MainAxisAlignment
                                              //                                   .center,
                                              //                           children: [
                                              //                             // ignore: prefer_const_constructors
                                              //                             Container(
                                              //                               margin: EdgeInsets
                                              //                                   .only(
                                              //                                       left:
                                              //                                           25),
                                              //                               width: 200,
                                              //                               child: Text(
                                              //                                 "IND vs PAK Notifications",
                                              //                                 // ignore: prefer_const_constructors
                                              //                                 style: TextStyle(
                                              //                                     color: Colors
                                              //                                         .white),
                                              //                               ),
                                              //                             ),
                                              //                             // ignore: prefer_const_constructors
                                              //                             SizedBox(
                                              //                               width: 75,
                                              //                             ),
                                              //                             Switch(
                                              //                               activeColor:
                                              //                                   Colors
                                              //                                       .blueGrey,
                                              //                               activeTrackColor:
                                              //                                   Colors.grey,
                                              //                               inactiveThumbColor:
                                              //                                   Colors
                                              //                                       .white,
                                              //                               inactiveTrackColor:
                                              //                                   Colors.grey,
                                              //                               value: status,
                                              //                               onChanged:
                                              //                                   (value) {
                                              //                                 // ignore: avoid_print
                                              //                                 print(
                                              //                                     "VALUE : $value");
                                              //                                 setState(() {
                                              //                                   status =
                                              //                                       value;
                                              //                                 });
                                              //                               },
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height: 10,
                                              //                         ),
                                              //                         Container(
                                              //                           alignment: Alignment
                                              //                               .center,
                                              //                           height: 200,
                                              //                           child: ListView
                                              //                               .builder(
                                              //                                   scrollDirection:
                                              //                                       Axis
                                              //                                           .horizontal,
                                              //                                   itemCount:
                                              //                                       5,
                                              //                                   itemBuilder:
                                              //                                       (context,
                                              //                                           index) {
                                              //                                     return Column(
                                              //                                       children: [
                                              //                                         Container(
                                              //                                           // ignore: prefer_const_constructors
                                              //                                           margin: EdgeInsets.only(
                                              //                                               left: 20,
                                              //                                               right: 10,
                                              //                                               top: 25),
                                              //                                           child:
                                              //                                               Stack(
                                              //                                             clipBehavior: Clip.none,
                                              //                                             children: [
                                              //                                               Container(
                                              //                                                 transform: Matrix4.rotationX(0),
                                              //                                                 height: 125,
                                              //                                                 width: 125,
                                              //                                                 // padding: EdgeInsets.symmetric(
                                              //                                                 //     vertical: 1, horizontal: 1),
                                              //                                                 decoration: BoxDecoration(
                                              //                                                   border: Border.all(color: Colors.blue),
                                              //                                                   color: Colors.black,
                                              //                                                   borderRadius: BorderRadius.circular(25),
                                              //                                                   boxShadow: [
                                              //                                                     BoxShadow(
                                              //                                                       color: Colors.white38.withOpacity(0.5),
                                              //                                                       offset: Offset(0, -5),
                                              //                                                       // blurRadius: 5,
                                              //                                                       spreadRadius: 1,
                                              //                                                     )
                                              //                                                   ],
                                              //                                                 ),
                                              //                                                 child: Container(
                                              //                                                   margin: EdgeInsets.all(12),
                                              //                                                   child: Image.asset(
                                              //                                                     'assets/tennis_background.jpeg',
                                              //                                                   ),
                                              //                                                 ),
                                              //                                               ),
                                              //                                               Positioned(
                                              //                                                 bottom: 120,
                                              //                                                 left: 85,
                                              //                                                 child: CircleAvatar(
                                              //                                                   backgroundColor: Colors.amber,
                                              //                                                   radius: 12,
                                              //                                                   child: Icon(
                                              //                                                     Icons.done,
                                              //                                                     size: 12,
                                              //                                                   ),
                                              //                                                 ),
                                              //                                               ),
                                              //                                             ],
                                              //                                           ),
                                              //                                         ),
                                              //                                         SizedBox(
                                              //                                           height:
                                              //                                               8,
                                              //                                         ),
                                              //                                         Container(
                                              //                                           width:
                                              //                                               100,
      
                                              //                                           // ignore: prefer_const_constructors
                                              //                                           child:
                                              //                                               Text(
                                              //                                             textAlign: TextAlign.center,
                                              //                                             "Weckets",
                                              //                                             style: TextStyle(color: Colors.white, fontSize: 18),
                                              //                                           ),
                                              //                                         )
                                              //                                       ],
                                              //                                     );
                                              //                                   }),
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                     Column(
                                              //                       children: [
                                              //                         Row(
                                              //                           mainAxisAlignment:
                                              //                               MainAxisAlignment
                                              //                                   .center,
                                              //                           children: [
                                              //                             // ignore: prefer_const_constructors
                                              //                             Container(
                                              //                               margin: EdgeInsets
                                              //                                   .only(
                                              //                                       left:
                                              //                                           25),
                                              //                               width: 200,
                                              //                               child: Text(
                                              //                                 "INDIA tour of PAKISTAN 2022 Notifications",
                                              //                                 // ignore: prefer_const_constructors
                                              //                                 style: TextStyle(
                                              //                                     color: Colors
                                              //                                         .white),
                                              //                               ),
                                              //                             ),
                                              //                             // ignore: prefer_const_constructors
                                              //                             SizedBox(
                                              //                               width: 75,
                                              //                             ),
                                              //                             Switch(
                                              //                               activeColor:
                                              //                                   Colors
                                              //                                       .blueGrey,
                                              //                               activeTrackColor:
                                              //                                   Colors.grey,
                                              //                               inactiveThumbColor:
                                              //                                   Colors
                                              //                                       .white,
                                              //                               inactiveTrackColor:
                                              //                                   Colors.grey,
                                              //                               value: status1,
                                              //                               onChanged:
                                              //                                   (value) {
                                              //                                 // ignore: avoid_print
                                              //                                 print(
                                              //                                     "VALUE : $value");
                                              //                                 setState(() {
                                              //                                   status1 =
                                              //                                       value;
                                              //                                 });
                                              //                               },
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height: 10,
                                              //                         ),
                                              //                         Container(
                                              //                           alignment: Alignment
                                              //                               .center,
                                              //                           height: 200,
                                              //                           child: ListView
                                              //                               .builder(
                                              //                                   scrollDirection:
                                              //                                       Axis
                                              //                                           .horizontal,
                                              //                                   itemCount:
                                              //                                       5,
                                              //                                   itemBuilder:
                                              //                                       (context,
                                              //                                           index) {
                                              //                                     return Column(
                                              //                                       children: [
                                              //                                         Container(
                                              //                                           // ignore: prefer_const_constructors
                                              //                                           margin: EdgeInsets.only(
                                              //                                               left: 20,
                                              //                                               right: 10,
                                              //                                               top: 25),
                                              //                                           child:
                                              //                                               Stack(
                                              //                                             clipBehavior: Clip.none,
                                              //                                             children: [
                                              //                                               Container(
                                              //                                                 transform: Matrix4.rotationX(0),
                                              //                                                 height: 125,
                                              //                                                 width: 125,
                                              //                                                 // padding: EdgeInsets.symmetric(
                                              //                                                 //     vertical: 1, horizontal: 1),
                                              //                                                 decoration: BoxDecoration(
                                              //                                                   border: Border.all(color: Colors.blue),
                                              //                                                   color: Colors.black,
                                              //                                                   borderRadius: BorderRadius.circular(25),
                                              //                                                   boxShadow: [
                                              //                                                     BoxShadow(
                                              //                                                       color: Colors.white38.withOpacity(0.5),
                                              //                                                       offset: Offset(0, -5),
                                              //                                                       // blurRadius: 5,
                                              //                                                       spreadRadius: 1,
                                              //                                                     )
                                              //                                                   ],
                                              //                                                 ),
                                              //                                                 child: Container(
                                              //                                                   margin: EdgeInsets.all(12),
                                              //                                                   child: Image.asset(
                                              //                                                     'assets/tennis_background.jpeg',
                                              //                                                   ),
                                              //                                                 ),
                                              //                                               ),
                                              //                                               Positioned(
                                              //                                                 bottom: 120,
                                              //                                                 left: 85,
                                              //                                                 child: CircleAvatar(
                                              //                                                   backgroundColor: Colors.amber,
                                              //                                                   radius: 12,
                                              //                                                   child: Icon(
                                              //                                                     Icons.done,
                                              //                                                     size: 12,
                                              //                                                   ),
                                              //                                                 ),
                                              //                                               ),
                                              //                                             ],
                                              //                                           ),
                                              //                                         ),
                                              //                                         SizedBox(
                                              //                                           height:
                                              //                                               8,
                                              //                                         ),
                                              //                                         Container(
                                              //                                           width:
                                              //                                               100,
      
                                              //                                           // ignore: prefer_const_constructors
                                              //                                           child:
                                              //                                               Text(
                                              //                                             textAlign: TextAlign.center,
                                              //                                             "Toss",
                                              //                                             style: TextStyle(color: Colors.white, fontSize: 18),
                                              //                                           ),
                                              //                                         )
                                              //                                       ],
                                              //                                     );
                                              //                                   }),
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         );
                                              //       });
                                              //     });
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.notifications,
                                                  color: isDarkMode
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Notification Settings',
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white70
                                                          : Colors.black),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ]),
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
      floatingActionButton: FutureBuilder<bool>(
        future: floating.isPipAvailable,
        initialData: true,
        builder: (context, snapshot) => snapshot.data ?? false
            ? PiPSwitcher(
                childWhenDisabled: FloatingActionButton.extended(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pipPage(
                        id: widget.id,
                      ),
                    ),
                  ),
                  label: const Text('Enable PiP'),
                  icon: const Icon(Icons.picture_in_picture),
                ),
                childWhenEnabled: const SizedBox(),
              )
            : const Card(
                child: Text('PiP unavailable'),
              ),
      ),
    );
  }
}
