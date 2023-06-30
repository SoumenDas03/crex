// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers, file_names

import 'dart:convert';
import 'package:crex/pages/singlePlayer_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class infoPlaying_xi_team extends StatefulWidget {
  const infoPlaying_xi_team({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<infoPlaying_xi_team> createState() => _infoPlaying_xi_teamState();
}

class _infoPlaying_xi_teamState extends State<infoPlaying_xi_team> {
  var map, data, newData, secondNewData;

  Future<void> apiFetch() async {
    var status = true;

    await Future.wait([getMatchSquad()]).then((v) {
      for (var item in v) {
        print('$item \n');
      }
    }).whenComplete(() {
      status = false;
    });

    print(status == true ? 'Loading' : 'FINISHED');
  }

  Future getMatchSquad() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_squad?apikey=a8ee5579-8994-41ba-af5d-4e2fcd2e9e91&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      newData =
          data[0]["players"].getRange(11, data[0]["players"].length).toList();
      secondNewData =
          data[1]["players"].getRange(11, data[1]["players"].length).toList();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(163, 17, 17, 17),
            title: Text("Playing XI"),
          ),
          body: FutureBuilder(
            future: apiFetch(),
            builder: (context, snapshot) {
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/background.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 5),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                      isScrollable: true,
                                      labelStyle: TextStyle(fontSize: 12),
                                      indicatorPadding: EdgeInsets.only(
                                          left: 5, top: 5, bottom: 5, right: 5),
                                      indicatorColor: Color(0xFFFF4D00),
                                      labelColor: Color(0xFFFF4D00),
                                      unselectedLabelColor: Colors.white,
                                      tabs: [
                                        Tab(
                                          text: data[0]["shortname"],
                                        ),
                                        Tab(text: data[1]["shortname"]),
                                      ]),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 380,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                height: 835,
                                child: TabBarView(children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 11,
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
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        singlePlayer_info(
                                                      playerId: data[0]
                                                                  ["players"]
                                                              [index]["id"]
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
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
                                                            // ignore: prefer_if_null_operators
                                                            backgroundImage: data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] !=
                                                                    null
                                                                ? NetworkImage(
                                                                    data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"])
                                                                : null,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    97,
                                                                    96,
                                                                    96),
                                                            child: data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] ==
                                                                    null
                                                                ? Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                : null,
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
                                                                data[0]["players"]
                                                                            [
                                                                            index]
                                                                        ["name"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(),
                                                              child: Text(
                                                                data[0]["players"]
                                                                            [
                                                                            index]
                                                                        ["role"]
                                                                    .toString(),
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
                                                    Container(
                                                      height: 1,
                                                      width: 180,
                                                      color: Colors.blueGrey,
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
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 25, top: 20),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'On Bench',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: newData.length,
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          singlePlayer_info(
                                                              playerId: newData[
                                                                          index]
                                                                      ["id"]
                                                                  .toString()),
                                                    ));
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
                                                            backgroundImage: data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] !=
                                                                    null
                                                                ? NetworkImage(
                                                                    newData[index]
                                                                        [
                                                                        "playerImg"])
                                                                : null,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    97,
                                                                    96,
                                                                    96),
                                                            child: data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] ==
                                                                    null
                                                                ? Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                : null,
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
                                                                newData[index]
                                                                    ["name"],
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
                                                                newData[index]
                                                                    ["role"],
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
                                                    Container(
                                                      height: 1,
                                                      width: 180,
                                                      color: Colors.blueGrey,
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
                                    ],
                                  ),

                                  //next

                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 11,
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          singlePlayer_info(
                                                              playerId: data[1][
                                                                          "players"]
                                                                      [
                                                                      index]["id"]
                                                                  .toString()),
                                                    ));
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
                                                            // ignore: prefer_if_null_operators
                                                            backgroundImage: data[1]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] !=
                                                                    null
                                                                ? NetworkImage(
                                                                    data[1]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"])
                                                                : null,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    97,
                                                                    96,
                                                                    96),
                                                            child: data[1]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] ==
                                                                    null
                                                                ? Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                : null,
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
                                                                data[1]["players"]
                                                                            [
                                                                            index]
                                                                        ["name"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(),
                                                              child: Text(
                                                                data[1]["players"]
                                                                            [
                                                                            index]
                                                                        ["role"]
                                                                    .toString(),
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
                                                    Container(
                                                      height: 1,
                                                      width: 180,
                                                      color: Colors.blueGrey,
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
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 25, top: 20),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'On Bench',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: secondNewData.length,
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          singlePlayer_info(
                                                              playerId: secondNewData[
                                                                          index]
                                                                      ["id"]
                                                                  .toString()),
                                                    ));
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
                                                            backgroundImage: data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] !=
                                                                    null
                                                                ? NetworkImage(
                                                                    secondNewData[
                                                                            index]
                                                                        [
                                                                        "playerImg"])
                                                                : null,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    97,
                                                                    96,
                                                                    96),
                                                            child: data[0]["players"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "playerImg"] ==
                                                                    null
                                                                ? Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                : null,
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
                                                                secondNewData[
                                                                        index]
                                                                    ["name"],
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
                                                                secondNewData[
                                                                        index]
                                                                    ["role"],
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
                                                    Container(
                                                      height: 1,
                                                      width: 180,
                                                      color: Colors.blueGrey,
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
                                    ],
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          )),
    );
  }
}
