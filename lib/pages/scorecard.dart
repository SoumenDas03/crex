// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:crex/provider/theme_changer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class scorecard extends StatefulWidget {
  const scorecard({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<scorecard> createState() => _scorecardState();
}

// ignore: camel_case_types
class _scorecardState extends State<scorecard> {
  // ignore: prefer_typing_uninitialized_variables
  var map, data;
  getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&id=${widget.id}'),
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
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image:  isDarkMode
                    ? AssetImage('assets/background.jpeg')
                    : AssetImage("assets/bgLightMode.png"),
                 
                  fit: BoxFit.cover,
                )),
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                              ? data["score"][data["score"].length - 1]["inning"]
                                                                  .indexOf(" ")
                                                              : data["score"][data["score"].length - 1]
                                                                      ["inning"]
                                                                  .length) ==
                                                      data["teamInfo"][0]["name"].substring(
                                                          0,
                                                          (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                              ? data["teamInfo"]
                                                                      [0]["name"]
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
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${data["score"][(data["score"].length) - 1]["r"]}-${data["score"][(data["score"].length) - 1]["w"]}',
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
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
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 12),
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
                                                          ? Colors.white
                                                          : Colors.black,
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
                                  color:
                                      isDarkMode ? Colors.white : Colors.grey),
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
                                        (data["score"][(data["score"].length) -
                                                    1]["r"] /
                                                data["score"][
                                                    (data["score"].length) -
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                              fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                                              fontWeight: FontWeight.bold),
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
                  DefaultTabController(
                    // initialIndex: 0,
                    length: 2,
                    child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(left: 10),
                      width: 340,
                      height: 40,
                      decoration: BoxDecoration(
                          color:isDarkMode? Color(0xFFFF4D00):const Color(0xFFDFDFDF),
                          borderRadius: BorderRadius.circular(20),),
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: TabBar(
                            labelPadding: EdgeInsets.all(5),
                            indicator: BoxDecoration(
                                color:isDarkMode? Colors.black:Color(0xFF494949),
                                borderRadius: BorderRadius.circular(25),),
                            unselectedLabelColor:isDarkMode? Colors.white: Colors.black,
                            labelColor: Colors.white,
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              Tab(
                                text: ('IND 1st Innings'),
                              ),
                              Tab(
                                text: ('PAK 1st Innings'),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 1,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Batter',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 135,
                          ),
                          Text(
                            'R',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'B',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '4s',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '6s',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'SR',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 160,
                                child: Text(
                                  'Rohit Sharma (Captain)',
                                  style: TextStyle(
                                      color:isDarkMode? Colors.white: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '19',
                                style: TextStyle(
                                  color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '7',
                                style: TextStyle(
                                  color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                   color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '89.98',
                                style: TextStyle(
                                  color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 160,
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Shikhar Dhawan',
                                      style: TextStyle(
                                         color:isDarkMode? Colors.white: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/matches.png",
                                      scale: 1.5,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                   color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '8',
                                style: TextStyle(
                                   color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                   color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '49.98',
                                style: TextStyle(
                                  color:isDarkMode? Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              width: 160,
                              child: Text(
                                "Extras :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  color:isDarkMode? Colors.white: Colors.black,
                                    fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 85,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,

                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CircleAvatar(
                                  backgroundColor: isDarkMode? Colors.white: Colors.black,
                                  radius: 10,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:isDarkMode? Color(0xFFFF4D00):Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1w , ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode? Colors.white: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1nb",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                     color:isDarkMode? Colors.white: Colors.black),
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
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nex Player",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF4D00),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          backgroundColor: isDarkMode? Colors.white: Colors.black,
                          radius: 48,
                          child: Opacity(
                            opacity: 0.9,
                            child: CircleAvatar(
                              backgroundColor: Colors.black87,
                              backgroundImage: AssetImage("assets/virat.jpg"),
                              radius: 45,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Virat Kohli",
                              style: TextStyle(
                                  color: isDarkMode? Colors.white: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Age :",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDarkMode? Colors.white: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "34 year",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDarkMode? Colors.white: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Total Runs :",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDarkMode? Colors.white: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "8074",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDarkMode? Colors.white: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Strike Rate :",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDarkMode? Colors.white: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "143",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDarkMode? Colors.white: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1.5,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Yet To Bat",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF4D00),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1 / .4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  radius: 20,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "Demo Name",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode? Colors.white: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "SR 79.99",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF4D00),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text(
                              'Batter',
                              style: TextStyle(
                                  color: Color(0xFFFF4D00),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'O',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'M',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'R',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'W',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Eco',
                            style: TextStyle(
                                color: Color(0xFFFF4D00),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text(
                              'Shahin Afridi',
                              style: TextStyle(
                                  color: isDarkMode? Colors.white: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '2.3',
                            style: TextStyle(
                                color: isDarkMode? Colors.white: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                color: isDarkMode? Colors.white: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '30',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                color: isDarkMode? Colors.white: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '7.60',
                            style: TextStyle(
                                color: isDarkMode? Colors.white: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1.5,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Partnerships",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF4D00),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1.5,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: 150,
                          child: Text(
                            "Batter 1",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode? Colors.white: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          width: 150,
                          child: Text(
                            "Batter 2",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode? Colors.white: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 25),
                    child: Text(
                      "1st WICKET",
                      style: TextStyle(
                          color: isDarkMode? Colors.white: Colors.black, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: 125,
                          child: Text(
                            "Rahit Sharma",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode? Colors.white: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5, top: 25),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "29*",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF4D00),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(15)",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode? Colors.white: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          width: 125,
                          child: Text(
                            "Shikhar Dhawan",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode? Colors.white: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 72,
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "19/",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode? Colors.white: Colors.black,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                "7",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode? Colors.white: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 5,
                            width: 80,
                            color: Color(0xFFFF4D00),
                          ),
                          Container(
                            height: 5,
                            width: 80,
                            color: Colors.amber,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 72,
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "10/",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode? Colors.white: Colors.black,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode? Colors.white: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 1,
                    width: 360,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 25,
                  )
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}
