// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers

import 'dart:convert';

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class football_home extends StatefulWidget {
  const football_home({super.key});

  @override
  State<football_home> createState() => _football_homeState();
}

// ignore: camel_case_types
class _football_homeState extends State<football_home> {
  var map, data,formattedDate;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getDate();
    super.initState();
  }

  getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    formattedDate = formatter.format(now);
    print(formattedDate);
  }

  getFootballMatches() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.soccersapi.com/v2.2/fixtures/?t=schedule&d=${formattedDate}&user=sugamdas1530&token=382f5bccee0f79c829210d42ae19ce28'
        ),
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
        future: getFootballMatches(),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/football.png',
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: isDarkMode
                                  ? AssetImage('assets/background.jpeg')
                                  : AssetImage("assets/bgLightMode.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTabController(
                              length: 4,
                              child: Container(
                                alignment: Alignment.center,
                                // margin: EdgeInsets.only(left: 10),
                                width: 340,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? const Color(0xFFFF2E00)
                                        : const Color(0xFFDFDFDF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: TabBar(
                                      labelPadding: EdgeInsets.all(5),
                                      indicator: BoxDecoration(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Color(0xFF494949),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      unselectedLabelColor: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      labelColor: isDarkMode
                                          ? Colors.black
                                          : Colors.white,
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
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20, top: 10),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                  bottomLeft:
                                                      Radius.circular(50)),
                                              child: Container(
                                                height: 60,
                                                width: 330,
                                                color: Colors.white,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundImage: NetworkImage(data[index]["teams"]["home"]["img"].toString()),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      data[index]["teams"]["home"]["short_code"].toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 55,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [                                                        
                                                        Text(
                                                          data[index]["time"]["time"].toString(),
                                                          style: TextStyle(
                                                            color: isDarkMode
                                                                ? const Color(
                                                                    0xFFFF2E00)
                                                                : const Color(
                                                                    0xFFFF4D00),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 55,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundImage: NetworkImage(
                                                        data[index]["teams"]["away"]["img"].toString()
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      data[index]["teams"]["away"]["short_code"].toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
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
                                            alignment: Alignment.topRight,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15)),
                                              child: Container(
                                                height: 35,
                                                width: 300,
                                                color: Colors.white,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      data[index]["teams"]["home"]["short_code"].toString(),
                                                      style: TextStyle(
                                                          color: isDarkMode
                                                              ? const Color(
                                                                  0xFFFF2E00)
                                                              : const Color(
                                                                  0xFFFF4D00),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 22,
                                                        width: 42,
                                                        color: Colors.black54,
                                                        child: Text(
                                                          '96',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 22,
                                                        width: 42,
                                                        color: Colors.black12,
                                                        child: Text(
                                                          '22',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
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
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          }
        },
      ),
    );
  }
}
