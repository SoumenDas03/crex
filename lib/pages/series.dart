// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, avoid_print

// ignore: unused_import
import 'package:crex/pages/football_home.dart';
// ignore: unused_import
import 'package:crex/pages/tennis_home.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class series extends StatefulWidget {
  const series({super.key});

  @override
  State<series> createState() => _seriesState();
}

// ignore: camel_case_types
class _seriesState extends State<series> {
  bool flag = false;
  bool flag1 = false;
  String? selected = "First";
  var map, data;
  getSeriesList() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/series?apikey=f1a40d68-eacd-40dd-bd92-d2506957493d&offset=0'),
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        // backgroundColor: Colors.black,
        body: FutureBuilder(
      future: getSeriesList(),
      builder: (context, snapshot) {
        if (data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: isDarkMode
                          ? AssetImage('assets/background.jpeg')
                          : AssetImage("assets/bgLightMode.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Trending Series',
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            flag == true ? flag = false : flag = true;
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // ignore: prefer_const_literals_to_create_immutables
                            stops: [
                              0.5,
                              0.8,
                            ],
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              isDarkMode
                                  ? Color.fromARGB(255, 230, 98, 42)
                                  : const Color(0xFFDFDFDF),
                              isDarkMode
                                  ? Color.fromARGB(255, 246, 75, 1)
                                  : const Color(0xFFDFDFDF),
                            ],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 10, left: 10, right: 7),
                              child: CircleAvatar(
                                backgroundColor:
                                    isDarkMode ? Colors.white : Colors.black,
                                radius: 25,
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      data[0]["matches"].toString(),
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Matches',
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: isDarkMode
                                              ? Colors.black
                                              : Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    data[0]["name"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: isDarkMode
                                            ? Color.fromARGB(255, 246, 242, 242)
                                            : Colors.black),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6, left: 10),
                                  child: Text(
                                    DateFormat.yMMMEd().format(DateTime.parse(
                                            data[0]["startDate"])) +
                                        "-" +
                                        data[0]["endDate"] +
                                        ", " +
                                        (DateTime.now().year).toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isDarkMode
                                          ? Color.fromARGB(255, 246, 242, 242)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: flag,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            height: 60,
                            width: 330,
                            color: isDarkMode
                                ? const Color.fromARGB(255, 91, 85, 85)
                                : Color.fromARGB(77, 141, 90, 90),
                            child: Container(
                              margin: const EdgeInsets.only(left: 30, top: 00),
                              child: Row(
                                children: [
                                  Text(
                                    'Series',
                                    style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 90),
                                    width: 140,
                                    child: Text(
                                      data[0]["name"].toString(),
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 1,
                              width: 330,
                              color: Colors.white),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            height: 60,
                            width: 330,
                            color: isDarkMode
                                ? const Color.fromARGB(255, 91, 85, 85)
                                : Color.fromARGB(77, 141, 90, 90),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 30, top: 00),
                                  child: Text(
                                    'Duration',
                                    style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 80),
                                  width: 140,
                                  child: data[0]["startDate"] != "Jun 07"
                                      ? Text(
                                          "${"${DateFormat.yMMMEd().format(DateTime.parse(data[0]["startDate"]))}-" + data[0]["endDate"]}, ${DateTime.now().year}",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: isDarkMode
                                                  ? Color.fromARGB(
                                                      255, 246, 242, 242)
                                                  : Colors.black),
                                        )
                                      : Text(
                                          data[0]["startDate"] +
                                              ", " +
                                              (DateTime.now().year).toString() +
                                              "- " +
                                              data[0]["endDate"] +
                                              ", " +
                                              (DateTime.now().year).toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 246, 242, 242)),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 1,
                              width: 330,
                              color:
                                  isDarkMode ? Colors.white : Colors.blueGrey),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20)),
                              child: Container(
                                height: 60,
                                width: 330,
                                color: isDarkMode
                                    ? const Color.fromARGB(255, 91, 85, 85)
                                    : Color.fromARGB(77, 141, 90, 90),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      child: Text(
                                        'Format',
                                        style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 95),
                                      child: Text(
                                        data[0]["odi"].toString() +
                                            " ODIs, " +
                                            data[0]["t20"].toString() +
                                            " T20s, " +
                                            data[0]["test"].toString() +
                                            " Tests",
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length - 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  flag1 == true ? flag1 = false : flag1 = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)),
                                  color: isDarkMode
                                      ? Color.fromARGB(255, 39, 38, 38)
                                      : const Color(0xFFDFDFDF),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: CircleAvatar(
                                            backgroundColor: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  data[index + 1]["matches"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: isDarkMode
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Matches',
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isDarkMode
                                                          ? Colors.black
                                                          : Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 265,
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 10),
                                              child: Text(
                                                data[index + 1]["name"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: isDarkMode
                                                        ? Color.fromARGB(
                                                            255, 246, 242, 242)
                                                        : Colors.black),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 10),
                                              child: data[index + 1]
                                                          ["startDate"] !=
                                                      "Jun 07"
                                                  ? Text(
                                                      "${"${DateFormat.yMMMEd().format(DateTime.parse(data[index + 1]["startDate"]))}-" + data[index + 1]["endDate"]}, ${DateTime.now().year}",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: isDarkMode
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  246,
                                                                  242,
                                                                  242)
                                                              : Colors.black),
                                                    )
                                                  : Text(
                                                      data[index + 1]
                                                              ["startDate"] +
                                                          ", " +
                                                          (DateTime.now().year)
                                                              .toString() +
                                                          "- " +
                                                          data[index + 1]
                                                              ["endDate"] +
                                                          ", " +
                                                          (DateTime.now().year)
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              255,
                                                              246,
                                                              242,
                                                              242)),
                                                    ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: flag1,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    height: 60,
                                    width: 330,
                                    color: isDarkMode
                                        ? const Color.fromARGB(255, 91, 85, 85)
                                        : Color.fromARGB(77, 141, 90, 90),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 30, top: 00),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Series',
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 90),
                                            width: 140,
                                            child: Text(
                                              data[index + 1]["name"]
                                                  .toString(),
                                              style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      height: 1,
                                      width: 330,
                                      color: Colors.white),
                                  Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    height: 60,
                                    width: 330,
                                    color: isDarkMode
                                        ? const Color.fromARGB(255, 91, 85, 85)
                                        : Color.fromARGB(77, 141, 90, 90),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 30, top: 00),
                                          child: Text(
                                            'Duration',
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 80),
                                          width: 140,
                                          child: data[index + 1]["startDate"] !=
                                                  "Jun 07"
                                              ? Text(
                                                  "${"${DateFormat.yMMMEd().format(DateTime.parse(data[index + 1]["startDate"]))}-" + data[index + 1]["endDate"]}, ${DateTime.now().year}",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: isDarkMode
                                                          ? Color.fromARGB(255,
                                                              246, 242, 242)
                                                          : Colors.black),
                                                )
                                              : Text(
                                                  data[index + 1]["startDate"] +
                                                      ", " +
                                                      (DateTime.now().year)
                                                          .toString() +
                                                      "- " +
                                                      data[index + 1]
                                                          ["endDate"] +
                                                      ", " +
                                                      (DateTime.now().year)
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: isDarkMode
                                                          ? Color.fromARGB(255,
                                                              246, 242, 242)
                                                          : Colors.black),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      height: 1,
                                      width: 330,
                                      color: Colors.white),
                                  Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20)),
                                      child: Container(
                                        height: 60,
                                        width: 330,
                                        color: isDarkMode
                                            ? const Color.fromARGB(
                                                255, 91, 85, 85)
                                            : Color.fromARGB(77, 141, 90, 90),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text(
                                                'Format',
                                                style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 95),
                                              child: Text(
                                                data[index + 1]["odi"]
                                                        .toString() +
                                                    " ODIs, " +
                                                    data[index + 1]["t20"]
                                                        .toString() +
                                                    " T20s, " +
                                                    data[index + 1]["test"]
                                                        .toString() +
                                                    " Tests",
                                                style: TextStyle(
                                                  color: isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 225,
                    )
                  ],
                ),
              ),
            ]),
          );
        }
      },
    )
        // ignore: sized_box_for_whitespace

        );
  }
}
