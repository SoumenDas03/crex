// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:crex/dashboard/infoTabviews.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cricket_home extends StatefulWidget {
  const cricket_home({super.key});

  @override
  State<cricket_home> createState() => _cricket_homeState();
}

// ignore: camel_case_types
class _cricket_homeState extends State<cricket_home> {
  var map, data, newData, upcomingData, upcomingMap;
  getCricketDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/currentMatches?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&offset=0'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"]
          .where((element) =>
              element["matchEnded"] == false &&
              element["status"] != "Match not started" &&
              element["teamInfo"].length > 1 &&
              element["bbbEnabled"] == true)
          .toList();
      newData = map["data"]
          .where((element) => element["matchEnded"] == true)
          .toList();
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

  getUpcomingMatches() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/matches?apikey=2c9a814a-4d49-468a-a7a7-63a76b3eb491&offset=0'),
      );

      upcomingMap = jsonDecode(response.body.toString());
      upcomingData = upcomingMap["data"]
          .where((element) =>
              element["matchStarted"] == false &&
              element["teams"][0] != "Tbc" &&
              element["teamInfo"].length > 1)
          .toList();
      if (response.statusCode == 200) {
        return upcomingData;
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getCricketDetails(),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder(
              future: getUpcomingMatches(),
              builder: (context, snapshot) {
                if (upcomingData == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      'assets/cricket.png',
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 5,
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 25,
                                        width: 85,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.blueGrey,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/game.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 15,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: Center(
                                                  child: Text(
                                                "Play Now",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  "assets/background.jpeg",
                                ),
                                fit: BoxFit.cover,
                              )),
                              child: DefaultTabController(
                                length: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.only(left: 10),
                                      width: 340,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFF4D00),
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
                                            tabs: [
                                              Tab(
                                                text: ('Live'),
                                              ),
                                              Tab(
                                                text: ('Today'),
                                              ),
                                              Tab(
                                                text: ('Upcoming'),
                                              ),
                                              Tab(
                                                text: ('Finished'),
                                              )
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 45),
                                      height: 500,
                                      child: TabBarView(children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, top: 10),
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: data.length < 5
                                                  ? data.length
                                                  : 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              infoTabViews(
                                                            id: data[index]
                                                                ["id"],
                                                          ),
                                                        ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        50)),
                                                            child: Container(
                                                              height: 60,
                                                              width: 330,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            data[index]["teamInfo"][0]["img"].toString()),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    data[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        // ignore: prefer_interpolation_to_compose_strings
                                                                        data[index]["score"][(data[index]["score"].length) - 1]["r"].toString() +
                                                                            "-" +
                                                                            data[index]["score"][(data[index]["score"].length) - 1]["w"].toString() +
                                                                            "/",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.black),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          data[index]["score"][(data[index]["score"].length) - 1]["o"]
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            data[index]["teamInfo"][1]["img"].toString()),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    data[index]["teamInfo"][1]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15)),
                                                            child: Container(
                                                              height: 35,
                                                              width: 300,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    data[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFFF4D00),
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  // Icon(
                                                                  //   Icons.sports_cricket_sharp,
                                                                  //   size: 15,
                                                                  //   color: Color(0xFFFF4D00),
                                                                  // ),

                                                                  Image.asset(
                                                                      "assets/cricket icon.png"),
                                                                  SizedBox(
                                                                    width: 25,
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 42,
                                                                      color: Colors
                                                                          .black54,
                                                                      child:
                                                                          Text(
                                                                        '56',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 42,
                                                                      color: Colors
                                                                          .black12,
                                                                      child:
                                                                          Text(
                                                                        '22',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 40,
                                                                  ),
                                                                  Image.asset(
                                                                    "assets/live_tv.png",
                                                                    scale: 1.3,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, top: 10),
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: data.length < 5
                                                  ? data.length
                                                  : 5,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              infoTabViews(
                                                            id: data[index]
                                                                ["id"],
                                                          ),
                                                        ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        50)),
                                                            child: Container(
                                                              height: 60,
                                                              width: 330,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            data[index]["teamInfo"][0]["img"].toString()),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    data[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        // ignore: prefer_interpolation_to_compose_strings
                                                                        data[index]["score"][(data[index]["score"].length) - 1]["r"].toString() +
                                                                            "-" +
                                                                            data[index]["score"][(data[index]["score"].length) - 1]["w"].toString() +
                                                                            "/",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.black),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          data[index]["score"][(data[index]["score"].length) - 1]["o"]
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            data[index]["teamInfo"][1]["img"].toString()),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    data[index]["teamInfo"][1]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15)),
                                                            child: Container(
                                                              height: 35,
                                                              width: 300,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    data[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFFF4D00),
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  // Icon(
                                                                  //   Icons.sports_cricket_sharp,
                                                                  //   size: 15,
                                                                  //   color: Color(0xFFFF4D00),
                                                                  // ),

                                                                  Image.asset(
                                                                      "assets/cricket icon.png"),
                                                                  SizedBox(
                                                                    width: 25,
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 42,
                                                                      color: Colors
                                                                          .black54,
                                                                      child:
                                                                          Text(
                                                                        '56',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 42,
                                                                      color: Colors
                                                                          .black12,
                                                                      child:
                                                                          Text(
                                                                        '22',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 40,
                                                                  ),
                                                                  Image.asset(
                                                                    "assets/live_tv.png",
                                                                    scale: 1.3,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, top: 10),
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: upcomingData.length > 5
                                                  ? upcomingData.length
                                                  : 5,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          50),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          50)),
                                                          child: Container(
                                                            height: 60,
                                                            width: 330,
                                                            color: Colors.white,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              // ignore: prefer_const_literals_to_create_immutables
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 15,
                                                                  backgroundImage:
                                                                      NetworkImage(upcomingData[index]["teamInfo"][0]
                                                                              [
                                                                              "img"]
                                                                          .toString()),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  upcomingData[index]["teamInfo"]
                                                                              [
                                                                              0]
                                                                          [
                                                                          "shortname"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                SizedBox(
                                                                  width: 50,
                                                                ),
                                                                CircleAvatar(
                                                                  radius: 15,
                                                                  backgroundImage:
                                                                      NetworkImage(upcomingData[index]["teamInfo"][1]
                                                                              [
                                                                              "img"]
                                                                          .toString()),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  upcomingData[index]["teamInfo"]
                                                                              [
                                                                              1]
                                                                          [
                                                                          "shortname"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15)),
                                                          child: Container(
                                                            height: 35,
                                                            width: 300,
                                                            color: Colors.white,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  upcomingData[index]["teamInfo"]
                                                                              [
                                                                              0]
                                                                          [
                                                                          "shortname"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFFFF4D00),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                // Icon(
                                                                //   Icons.sports_cricket_sharp,
                                                                //   size: 15,
                                                                //   color: Color(0xFFFF4D00),
                                                                // ),

                                                                Image.asset(
                                                                    "assets/cricket icon.png"),
                                                                SizedBox(
                                                                  width: 25,
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3),
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 22,
                                                                    width: 42,
                                                                    color: Colors
                                                                        .black54,
                                                                    child: Text(
                                                                      '56',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3),
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 22,
                                                                    width: 42,
                                                                    color: Colors
                                                                        .black12,
                                                                    child: Text(
                                                                      '22',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                Image.asset(
                                                                  "assets/live_tv.png",
                                                                  scale: 1.3,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, top: 10),
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: newData.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              infoTabViews(
                                                            id: newData[index]
                                                                ["id"],
                                                          ),
                                                        ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        50)),
                                                            child: Container(
                                                              height: 60,
                                                              width: 330,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            newData[index]["teamInfo"][0]["img"].toString()),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    newData[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        // ignore: prefer_interpolation_to_compose_strings
                                                                        newData[index]["score"][(newData[index]["score"].length) - 1]["r"].toString() +
                                                                            "-" +
                                                                            newData[index]["score"][(newData[index]["score"].length) - 1]["w"].toString() +
                                                                            "/",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.black),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          newData[index]["score"][(newData[index]["score"].length) - 1]["o"]
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            newData[index]["teamInfo"][1]["img"].toString()),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    newData[index]["teamInfo"][1]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15)),
                                                            child: Container(
                                                              height: 35,
                                                              width: 300,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    newData[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFFF4D00),
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  // Icon(
                                                                  //   Icons.sports_cricket_sharp,
                                                                  //   size: 15,
                                                                  //   color: Color(0xFFFF4D00),
                                                                  // ),

                                                                  Image.asset(
                                                                      "assets/cricket icon.png"),
                                                                  SizedBox(
                                                                    width: 25,
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 42,
                                                                      color: Colors
                                                                          .black54,
                                                                      child:
                                                                          Text(
                                                                        '56',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          22,
                                                                      width: 42,
                                                                      color: Colors
                                                                          .black12,
                                                                      child:
                                                                          Text(
                                                                        '22',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 40,
                                                                  ),
                                                                  Image.asset(
                                                                    "assets/live_tv.png",
                                                                    scale: 1.3,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
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
