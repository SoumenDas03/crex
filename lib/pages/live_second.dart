// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:crex/pages/speech_settings.dart';
import 'package:crex/pages/win_prediction.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class live_second extends StatefulWidget {
  const live_second({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<live_second> createState() => _live_secondState();
}

class _live_secondState extends State<live_second> {
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
        // ignore: avoid_print
        print('failed');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getSingleCricketMatchDetails(),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(child: CircularProgressIndicator());
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
              child: SingleChildScrollView(
                child: Column(children: [
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
                                                  data["score"][(data["score"]
                                                              .length) -
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
                                        (data["score"][(data["score"].length) -
                                                    1]["r"] /
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
                                      children: const [
                                        Text(
                                          'Over 18',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Over 19',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
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
                              SizedBox(height: 10),
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
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      color: Color(0xffFF8A00),
                      child: Text(
                        'PAK need 200 runs in 183 balls',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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

                          color: Colors.blueGrey[900],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 100,
                                child: Text(
                                  'PAKISTAN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 25,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.5),
                                    border: Border.all(
                                        color: Colors.white, width: 0.5)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'PAK',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                        "assets/matches.png",
                                        scale: 1.5,
                                      )
                                    ]),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  // border: Border.all(
                                  //     color: Colors.white, width: 0.5)

                                  color: Colors.black45,
                                ),
                                child: Text(
                                  '16',
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
                                height: 25,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5),
                                  // border: Border.all(
                                  //     color: Colors.white, width: 0.5)

                                  color: Color(0xffFF8A00),
                                ),
                                child: Text(
                                  '22',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'View',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              )
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
                    padding: const EdgeInsets.all(5.0),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.white, width: 0.5)

                          color: Colors.blueGrey[900],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '20 Ov Runs',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 75,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      // border: Border.all(
                                      //     color: Colors.white, width: 0.5)

                                      color: Colors.black45,
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
                                      borderRadius: BorderRadius.circular(2.5),
                                      // border: Border.all(
                                      //     color: Colors.white, width: 0.5)

                                      color: Color(0xffFF8A00),
                                    ),
                                    child: Text(
                                      'YES 200',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Open 150',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Min 120',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Max 150',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 45,
                                ),
                                Text(
                                  '10 runs in 9 balls',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      color: Color(0xffFF8A00),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Batter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 130,
                            ),
                            Text(
                              'R',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'B',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '4s',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '6s',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(0),
                        // border: Border.all(color: Colors.white, width: 0.5)

                        color: Colors.blueGrey[900],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Babar Azam(Captain)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '19',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '89.98',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 350,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(0),
                              // border: Border.all(color: Colors.white, width: 0.5)

                              color: Colors.black45,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fawad Alam',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    "assets/matches.png",
                                    scale: 1,
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '8',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '49.98',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 1.5,
                            width: 350,
                            color: Colors.white54,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "P'ship : 58(30)",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      color: Color(0xffFF8A00),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Bowler',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 135,
                            ),
                            Text(
                              'O',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'M',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'R',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'W',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(0),
                        // border: Border.all(color: Colors.white, width: 0.5)

                        color: Colors.blueGrey[900],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 160,
                                  child: Text(
                                    'Jasprit Bumrah',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '2.0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.white,
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '7.60',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.white, width: 0.5)

                          color: Colors.blueGrey[900],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Who will win ?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey[100]),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                    'Total Votes:2,25,222',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey[100]),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Container(
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    // border: Border.all(
                                    //     color: Colors.white, width: 0.5)

                                    color: Colors.amber,
                                  ),
                                  child: Text(
                                    'IND',
                                    style: TextStyle(
                                      color: Colors.white,
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
                                      borderRadius: BorderRadius.circular(2.5),
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Text('DRAW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.5),
                                      // border: Border.all(
                                      //     color: Colors.white, width: 0.5)

                                      color: Colors.green),
                                  child: Text(
                                    'PAK',
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // border: Border.all(color: Colors.white, width: 0.5)

                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: 115,
                                  child: Text(
                                    'PAK *',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 115,
                                  child: Text(
                                    'IND',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Batting',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF4D00),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/matches.png",
                                      scale: 1.2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '340-5/',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        '100',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.white, width: 0.5)

                        color: Color(0xffFF8A00),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_sharp,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Share Score',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      height: 45,
                      width: 350,
                      color: Colors.blueGrey[900],
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
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Match Settings',
                                style: TextStyle(
                                    color: Colors.white,
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
                          color: Colors.blueGrey[900],
                        ),
                        child: Column(children: [
                          Container(
                            height: 1,
                            width: 350,
                            color: Colors.blueGrey[200],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
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
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Win Probability View',
                                        style: TextStyle(color: Colors.white70),
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
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Speech Settings (Accessibility)',
                                          style:
                                              TextStyle(color: Colors.white70))
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
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Notification Settings',
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          )
                        ])),
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
