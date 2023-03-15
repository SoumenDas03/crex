// ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

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
                                    borderRadius: BorderRadius.circular(25)),
                                unselectedLabelColor: Colors.white,
                                labelColor: Colors.white,
                                // ignore: prefer_const_literals_to_create_immutables
                                tabs: [
                                  Tab(
                                    text: data["score"]
                                        [data["score"].length - 2]["inning"],
                                  ),
                                  Tab(
                                    text: data["score"]
                                        [data["score"].length - 1]["inning"],
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          height: (100 * data["scorecard"][data["scorecard"].length - 2]["batting"].length).toDouble(),
                          child: TabBarView(children: [
                            Column(
                              children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          'Batter',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 105,
                                        ),
                                        Text(
                                          'R',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'B',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          '4s',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Text(
                                          '6s',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 33,
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
                                      ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data["scorecard"][
                                                data["scorecard"].length -
                                                    2]["batting"]
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 5, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // ignore: sized_box_for_whitespace
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Container(
                                                      width: 130,
                                                      child: Text(
                                                        data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["batting"][index]
                                                            [
                                                            "batsman"]["name"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 130,
                                                      margin: EdgeInsets.only(
                                                          top: 7),
                                                      child: Text(
                                                        data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["batting"][index]
                                                            [
                                                            "dismissal-text"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 10),
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
                                                      data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  2]["batting"]
                                                              [index]["r"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["batting"]
                                                            [index]["b"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["batting"]
                                                            [index]["4s"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["batting"]
                                                            [index]["6s"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 44,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["batting"]
                                                            [index]["sr"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
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
                                                backgroundColor: Colors.white,
                                                radius: 10,
                                                child: Text(
                                                  data["scorecard"][data[
                                                                  "scorecard"]
                                                              .length -
                                                          2]["extras"]["r"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Color(0xFFFF4D00),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                ", ${data["scorecard"][data["scorecard"].length - 2]["extras"]["w"]}w, ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${data["scorecard"][data["scorecard"].length - 2]["extras"]["nb"]}nb ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white),
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
                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          'Bowler',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 105,
                                        ),
                                        Text(
                                          'O',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'M',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'R',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Text(
                                          'W',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 33,
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
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data["scorecard"][
                                                data["scorecard"].length -
                                                    2]["bowling"]
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 5, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // ignore: sized_box_for_whitespace
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Container(
                                                      width: 130,
                                                      child: Text(
                                                        data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                2]["bowling"][index]
                                                            [
                                                            "bowler"]["name"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                      data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  2]["bowling"]
                                                              [index]["o"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  2]["bowling"]
                                                              [index]["m"]
                                                          .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  2]["bowling"]
                                                              [index]["r"]
                                                          .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  2]["bowling"]
                                                              [index]["w"]
                                                          .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 44,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  2]["bowling"]
                                                              [index]["eco"]
                                                          .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                            Column(
                              children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          'Batter',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 105,
                                        ),
                                        Text(
                                          'R',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'B',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          '4s',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Text(
                                          '6s',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 33,
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
                                      ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data["scorecard"][
                                                data["scorecard"].length -
                                                    1]["batting"]
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 5, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // ignore: sized_box_for_whitespace
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Container(
                                                      width: 130,
                                                      child: Text(
                                                        data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"][index]
                                                            [
                                                            "batsman"]["name"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 130,
                                                      margin: EdgeInsets.only(
                                                          top: 7),
                                                      child: Text(
                                                        data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"][index]
                                                            [
                                                            "dismissal-text"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 10),
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
                                                      data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  1]["batting"]
                                                              [index]["r"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["b"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["4s"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["6s"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 44,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["sr"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
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
                                                backgroundColor: Colors.white,
                                                radius: 10,
                                                child: Text(
                                                  data["scorecard"][data[
                                                                  "scorecard"]
                                                              .length -
                                                          1]["extras"]["r"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Color(0xFFFF4D00),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                ", ${data["scorecard"][data["scorecard"].length - 1]["extras"]["w"]}w, ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${data["scorecard"][data["scorecard"].length - 1]["extras"]["nb"]}nb ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white),
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
                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          'Bowler',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 105,
                                        ),
                                        Text(
                                          'O',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'M',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'R',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Text(
                                          'W',
                                          style: TextStyle(
                                              color: Color(0xFFFF4D00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 33,
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
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data["scorecard"][
                                                data["scorecard"].length -
                                                    1]["batting"]
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 5, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // ignore: sized_box_for_whitespace
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Container(
                                                      width: 130,
                                                      child: Text(
                                                        data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"][index]
                                                            [
                                                            "batsman"]["name"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                      data["scorecard"][data[
                                                                          "scorecard"]
                                                                      .length -
                                                                  1]["batting"]
                                                              [index]["r"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["b"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["4s"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 42,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["6s"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.5,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 44,
                                                  child: Text(
                                                    data["scorecard"][data[
                                                                        "scorecard"]
                                                                    .length -
                                                                1]["batting"]
                                                            [index]["sr"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                          ]),
                        )
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
                  SizedBox(
                    height: 25,
                  ),
                  // Container(
                  //   height: 1,
                  //   width: 360,
                  //   color: Colors.blueGrey,
                  // ),
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
