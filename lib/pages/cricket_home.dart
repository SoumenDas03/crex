// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crex/GetX/carouselManagment.dart';
import 'package:crex/dashboard/infoTabviews.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class cricket_home extends StatefulWidget {
  const cricket_home({super.key});

  @override
  State<cricket_home> createState() => _cricket_homeState();
}

// ignore: camel_case_types
class _cricket_homeState extends State<cricket_home> {
  Future<void> apiFetch() async {
    var status = true;
    await Future.wait([
      getCricketDetails(),
      getUpcomingMatches(),
      getBanner(),
    ]).then((v) {
      for (var item in v) {
        // print('$item \n');
      }
    }).whenComplete(() {
      status = false;
    });
    print(status == true ? 'Loading' : 'FINISHED');
  }

  var map,
      data,
      newData,
      upcomingData,
      upcomingMap,
      bannerList,
      dataUrl,
      dataList,
      mapBetting,
      dataBetting, match_id, livePoints;
  firstCarouselSlider exampleTwoController = Get.put(firstCarouselSlider());

  Future getCricketDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/currentMatches?apikey=a6e59415-3226-4b92-817f-a90ddebd0315&offset=0'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"]
          .where((element) =>
              element["matchEnded"] == false &&
              element["score"].length != 0 &&
              element["status"] != "No result (due to rain)" &&
              element["status"] != "Match tied (VJD)" &&
              element["status"] != "No Result - due to rain" &&
              element["status"] != "No result - due to rain" &&
              element["status"] != "No result due to bad weather" &&
              element["status"] !=
                  "Match tied (Teams score level on DLS method)" &&
              element["status"] !=
                  "No result (rain) - CSG and LKK joint-winners" &&
              element["status"] != "New Zealand Legends opt to bowl" &&
              element["status"] != "Day 1: Stumps - Sri Lanka opt to bowl" &&
              element["status"] != "No result(due to rain)" &&
              element["status"] !=
                  "Day 2: Stumps - Wellington trail by 239 runs" &&
              element["status"] !=
                  "Day 3: 3rd Session - Central Districts trail by 135 runs" &&
              element["status"] !=
                  "Day 2: 3rd Session - Northern Knights opt to bowl" &&
              !(element["teamInfo"][0]["name"] == 'Australia' && element["teamInfo"][1]["name"] == 'Netherlands')
              )
          .toList();
      newData = map["data"]
          .where((element) => element["matchEnded"] == true)
          .toList()
          .where((element) => element["matchEnded"] == true)
          .toList()
          .where((element) => element["score"].length != 0)
          .toList();

      // Reverse the order of data and newData in place
      data = data.reversed.toList();
      newData = newData.reversed.toList();

      if (response.statusCode == 200) {
        return data;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {}
  }

  void fetchDataPeriodically() {
    const Duration interval = Duration(seconds: 10);

    Timer.periodic(interval, (timer) async {
      getCricketDetails();
    });
  }

  Future getUpcomingMatches() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://playexch.us/api/scarp-match-list'),
      );

      upcomingMap = jsonDecode(response.body.toString());
      upcomingData = upcomingMap["data"].where((element) => element["match_name"] != "ICC Cricket World Cup").toList();

      if (response.statusCode == 200) {
        return upcomingData;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {}
  }

  Future getBettingPoints(
      String match_name, String short_name, String game_name) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://playexch.us/api/get-match-details-odds'),
          body: {
            "match_name": match_name,
            "short_name": short_name,
            "game_name": game_name,
          });
      var mapNoob = jsonDecode(response.body.toString());
      mapBetting = mapNoob["data"];
      if (response.statusCode == 200) {
        return mapBetting;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {}
  }

  Future getLiveBettingPoints(String matchName, matchID) async {
    try {
      final matchResponse = await http.post(
          Uri.parse('https://playexch.us/api/get-match-details-odds'),
          body: {"match_name": matchName}
      );

      if (matchResponse.statusCode != 200) {
        print('Failed to fetch match details');
        return;
      }

      final matchDetails = jsonDecode(matchResponse.body.toString());
      match_id = matchDetails["data"]["match_id"];

      final oddsResponse = await http.post(
          Uri.parse('https://playexch.us/api/get-match-odds'),
          body: {"matchid": match_id}
      );

      if (oddsResponse.statusCode == 200) {
        var map1 = jsonDecode(oddsResponse.body);
        livePoints = map1["data"];
      } else {
        print('Failed to fetch match odds');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getBanner() async {
    final response = await http.get(
      Uri.parse("https://playexch.us/api/banner-list"),
    );
    Map<String, dynamic> map = jsonDecode(response.body.toString());
    bannerList = map["userDetails"];
    dataUrl = (bannerList as List).map((e) => e["banner_image"]).toList();
    // ignore: unused_local_variable
    dataList = (dataUrl as List).map((e) => e).cast<String>().toList();
    if (response.statusCode == 200) {
      return bannerList;
    } else {
      return bannerList;
    }
  }

  String formatDateTime(String inputDate) {
    final parsedDate = DateTime.parse(inputDate);

    final months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];

    final day = parsedDate.day;
    final month = months[parsedDate.month - 1].toString().substring(0,3); // Adjust month index
    final year = parsedDate.year;
    final hours = parsedDate.hour;
    final minutes = parsedDate.minute;

    // Function to add suffix to day (e.g., 1st, 2nd, 3rd, 4th, etc.)
    String getDayWithSuffix(int day) {
      if (day >= 11 && day <= 13) {
        return '${day}th';
      }
      switch (day % 10) {
        case 1:
          return '${day}st';
        case 2:
          return '${day}nd';
        case 3:
          return '${day}rd';
        default:
          return '${day}th';
      }
    }

    // Function to convert 24-hour format to 12-hour format with AM/PM
    String getFormattedHours(int hours, int minutes) {
      final formattedHours = hours % 12 == 0 ? 12 : hours % 12;
      final period = hours < 12 ? 'AM' : 'PM';
      final formattedMinutes = minutes.toString().padLeft(2, '0');
      return '$formattedHours:$formattedMinutes $period';
    }

    return '${getDayWithSuffix(day)} $month, $year ${getFormattedHours(hours, minutes)}';
  }

  @override
  void initState() {
    super.initState();
    fetchDataPeriodically();
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: apiFetch(),
        builder: (context, snapshot) {
          if (dataList == null) {
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
                      Obx(
                        () => Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                  height: 150,
                                  autoPlay: true,
                                  aspectRatio: 2,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  viewportFraction: 1,
                                  scrollPhysics: BouncingScrollPhysics(),
                                  onPageChanged: (index, reason) {
                                    exampleTwoController
                                        .setCurrentIndex(index.toDouble());
                                  }),
                              items: dataList.map<Widget>((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Image.network(
                                      "https://playexch.us/banner_image/" + i,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: DotsIndicator(
                                dotsCount: dataList.length,
                                position:
                                    exampleTwoController.currentIndex.value,
                                decorator: DotsDecorator(
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ),
                          ],
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
                        child: DefaultTabController(
                          length: 4,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
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
                                  padding: const EdgeInsets.all(2),
                                  child: TabBar(
                                      labelPadding: EdgeInsets.all(4),
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
                              Container(
                                padding: EdgeInsets.only(bottom: 25),
                                height: 450,
                                child: TabBarView(children: [
                                  data.length == 0
                                      ? Center(
                                          child: Text(
                                            "No match has started",
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      : Container(
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
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            infoTabViews(
                                                          id: data[index]["id"],
                                                          seriesId: data[index]
                                                              ["series_id"],
                                                          theme:
                                                              Theme.of(context)
                                                                  .brightness
                                                                  .name,
                                                              matchName: data[index]["teamInfo"][0]["name"].split(" ")[0] == data[index]["score"][0]["inning"].split(" ")[0]
                                                                  ? data[index]["teamInfo"][0]["shortname"]
                                                                  : data[index]["teamInfo"][1]["shortname"],
                                                              getOver: data[index]["score"][data[index]["score"].length - 1]["o"].toString(),
                                                              fullMatchName: data[index]["teamInfo"][0]["name"].split(" ")[0] == data[index]["score"][0]["inning"].split(" ")[0]
                                                                  ? data[index]["teamInfo"][0]["name"]
                                                                  : data[index]["teamInfo"][1]["name"],
                                                        ),
                                                      ),
                                                    );
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
                                                          alignment: Alignment.topRight,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                                            child: Container(
                                                              height: 35,
                                                              width: 300,
                                                              color: Colors.white,
                                                              child: FutureBuilder(
                                                                future: getLiveBettingPoints(
                                                                  data[index]["teams"][0].toString(),
                                                                  data[index]["id"].toString(),
                                                                ),
                                                                builder: (context, snapshot) {
                                                                  return Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Text(
                                                                        livePoints == null ? "--" :
                                                                        data[index]["teamInfo"][0]["name"].toString().contains(livePoints[0]["favname"]) ?
                                                                        data[index]["teamInfo"][0]["shortname"].toString() :
                                                                        data[index]["teamInfo"][1]["shortname"].toString(),
                                                                        style: TextStyle(
                                                                          color: Color(0xFFFF4D00),
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 5),
                                                                      Image.asset("assets/cricket icon.png"),
                                                                      SizedBox(width: 25),
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.circular(3),
                                                                        child: Container(
                                                                          alignment: Alignment.center,
                                                                          height: 22,
                                                                          width: 42,
                                                                          color: Colors.black54,
                                                                          child: Text(
                                                                            livePoints == null ? "--" : livePoints[0]["back"].toStringAsFixed(2).split(".")[1],
                                                                            style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 5),
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.circular(3),
                                                                        child: Container(
                                                                          alignment: Alignment.center,
                                                                          height: 22,
                                                                          width: 42,
                                                                          color: Colors.black12,
                                                                          child: Text(
                                                                            livePoints == null ? "--" : livePoints[0]["lay"].toStringAsFixed(2).split(".")[1],
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 40),
                                                                      Image.asset("assets/live_tv.png", scale: 1.3),
                                                                    ],
                                                                  );
                                                                },
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
                                  data.length == 0
                                      ? Center(
                                          child: Text(
                                            "No match has started",
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, top: 10),
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: data.length < 50
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
                                                            seriesId: data[
                                                                    index]
                                                                ["series_id"],
                                                            theme: Theme.of(
                                                                    context)
                                                                .brightness
                                                                .name,
                                                                  matchName: data[index]["teamInfo"][0]["name"].split(" ")[0] == data[index]["score"][0]["inning"].split(" ")[0]
                                                                      ? data[index]["teamInfo"][0]["shortname"]
                                                                      : data[index]["teamInfo"][1]["shortname"],
                                                                  getOver: data[index]["score"][data[index]["score"].length - 1]["o"].toString(),
                                                                fullMatchName: data[index]["teamInfo"][0]["name"].split(" ")[0] == data[index]["score"][0]["inning"].split(" ")[0]
                                                                    ? data[index]["teamInfo"][0]["name"]
                                                                    : data[index]["teamInfo"][1]["name"],
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
                                                              child:
                                                                  FutureBuilder(
                                                                future: getBettingPoints(
                                                                    data[index]["teams"]
                                                                            [0]
                                                                        .toString(),
                                                                    data[index]["teamInfo"][0]
                                                                            [
                                                                            "shortname"]
                                                                        .toString(),
                                                                    "cricket"),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  final mapBetting =
                                                                      snapshot
                                                                          .data;
                                                                  if (mapBetting == null ||
                                                                      mapBetting[
                                                                              "odd_one"] ==
                                                                          null ||
                                                                      mapBetting[
                                                                              "odd_one"] ==
                                                                          "-" ||
                                                                      mapBetting[
                                                                              "odd_two"] ==
                                                                          null ||
                                                                      mapBetting[
                                                                              "odd_two"] ==
                                                                          "-" ||
                                                                      mapBetting[
                                                                              "odd_five"] ==
                                                                          null ||
                                                                      mapBetting[
                                                                              "odd_five"] ==
                                                                          "-" ||
                                                                      mapBetting[
                                                                              "odd_six"] ==
                                                                          null ||
                                                                      mapBetting[
                                                                              "odd_six"] ==
                                                                          "-") {
                                                                    return Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          data[index]["teamInfo"][0]["shortname"]
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        Image.asset(
                                                                            "assets/cricket icon.png"),
                                                                        SizedBox(
                                                                            width:
                                                                                25),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(3),
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                22,
                                                                            width:
                                                                                42,
                                                                            color:
                                                                                Colors.black54,
                                                                            child:
                                                                                Text(
                                                                              "00",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(3),
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                22,
                                                                            width:
                                                                                42,
                                                                            color:
                                                                                Colors.black12,
                                                                            child:
                                                                                Text(
                                                                              "01",
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                40),
                                                                        Image
                                                                            .asset(
                                                                          "assets/live_tv.png",
                                                                          scale:
                                                                              1.3,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  } else {
                                                                    return Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          data[index]["teamInfo"][0]["shortname"]
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFFFF4D00),
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        Image.asset(
                                                                            "assets/cricket icon.png"),
                                                                        SizedBox(
                                                                            width:
                                                                                25),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(3),
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                22,
                                                                            width:
                                                                                42,
                                                                            color:
                                                                                Colors.black54,
                                                                            child:
                                                                                Text(
                                                                              mapBetting["odd_one"][0] == "1" ? ((double.parse(mapBetting["odd_one"]) * 100) - ((int.parse(mapBetting["odd_one"][0])) * 100)).toInt().toString() : ((double.parse(mapBetting["odd_five"]) * 100) - ((int.parse(mapBetting["odd_five"][0])) * 100)).toInt().toString(),
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(3),
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                22,
                                                                            width:
                                                                                42,
                                                                            color:
                                                                                Colors.black12,
                                                                            child:
                                                                                Text(
                                                                              mapBetting["odd_two"][0] == "1" ? ((double.parse(mapBetting["odd_two"]) * 100) - ((int.parse(mapBetting["odd_two"][0])) * 100)).toInt().toString() : ((double.parse(mapBetting["odd_six"]) * 100) - ((int.parse(mapBetting["odd_six"][0])) * 100)).toInt().toString(),
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                40),
                                                                        Image
                                                                            .asset(
                                                                          "assets/live_tv.png",
                                                                          scale:
                                                                              1.3,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }
                                                                },
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
                                    margin:
                                        EdgeInsets.only(bottom: 20, top: 10),
                                    child: ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: upcomingData == null
                                            ? 0
                                            : upcomingData.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(50),
                                                            bottomLeft:
                                                                Radius.circular(
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
                                                                .spaceEvenly,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 15,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        "https://images.mid-day.com/images/images/2023/mar/ball-istock-aug-a_d.jpg"),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                upcomingData[
                                                                            index]
                                                                        [
                                                                        "match_name"]
                                                                    .toString()
                                                                    .split("v")[
                                                                        0]
                                                                    .toString()
                                                                    .substring(
                                                                        0, 3),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              formatDateTime(upcomingData[index][
                                                                      "match_datetime"]
                                                                  .toString()),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              overflow: TextOverflow
                                                                  .clip,
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 15,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        "https://images.mid-day.com/images/images/2023/mar/ball-istock-aug-a_d.jpg"),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                upcomingData[
                                                                            index]
                                                                        [
                                                                        "match_name"]
                                                                    .toString()
                                                                    .split("v")[
                                                                        1]
                                                                    .toString()
                                                                    .substring(
                                                                        0, 4),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
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
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
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
                                                      upcomingData[index]
                                                      ["odds"][0]["favname"]
                                                          .toString() != "--" ? upcomingData[index]
                                                          ["odds"][0]["favname"]
                                                              .toString()
                                                              .substring(
                                                              0, 3) : "--",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFFF4D00),
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
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
                                                                upcomingData[index]
                                                                ["odds"][0]["back"] != "--" ? upcomingData[index]
                                                              ["odds"][0]["back"]
                                                                  .toStringAsFixed(2) : "--",
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
                                                              upcomingData[index]
                                                              ["odds"][0]["lay"] != "--" ? upcomingData[index]
                                                              ["odds"][0]["lay"]
                                                                  .toStringAsFixed(2) : "--",
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
                                          );
                                        }),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 20, top: 10),
                                    child: ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: newData.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        infoTabViews(
                                                            id: newData[index]["id"],
                                                            seriesId: newData[index]
                                                            ["series_id"],
                                                            theme: Theme.of(context)
                                                                .brightness
                                                                .name,
                                                            matchName: newData[index]["teamInfo"][0]["name"].split(" ")[0] == newData[index]["score"][0]["inning"].split(" ")[0]
                                                                ? newData[index]["teamInfo"][0]["shortname"]
                                                                : newData[index]["teamInfo"][1]["shortname"],
                                                            getOver: newData[index]["score"][newData[index]["score"].length - 1]["o"].toString(),
                                                            fullMatchName: newData[index]["teamInfo"][0]["name"].split(" ")[0] == newData[index]["score"][0]["inning"].split(" ")[0]
                                                                ? newData[index]["teamInfo"][0]["name"]
                                                                : newData[index]["teamInfo"][1]["name"],
                                                        ),
                                                  ));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
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
                                                                  .circular(50),
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
                                                              backgroundImage: NetworkImage(
                                                                  newData[index]["teamInfo"]
                                                                              [
                                                                              0]
                                                                          [
                                                                          "img"]
                                                                      .toString()),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              newData[index]["teamInfo"]
                                                                          [0][
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
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  // ignore: prefer_interpolation_to_compose_strings
                                                                  newData[index]["score"][(newData[index]["score"].length) - 1]
                                                                              [
                                                                              "r"]
                                                                          .toString() +
                                                                      "-" +
                                                                      newData[index]
                                                                              [
                                                                              "score"][(newData[index]["score"]
                                                                                  .length) -
                                                                              1]["w"]
                                                                          .toString() +
                                                                      "/",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              12),
                                                                  child: Text(
                                                                    newData[index]
                                                                            [
                                                                            "score"][(newData[index]["score"]
                                                                                .length) -
                                                                            1]["o"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            CircleAvatar(
                                                              radius: 15,
                                                              backgroundImage: NetworkImage(
                                                                  newData[index]["teamInfo"]
                                                                              [
                                                                              1]
                                                                          [
                                                                          "img"]
                                                                      .toString()),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              newData[index]["teamInfo"]
                                                                          [1][
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
                                                        child: FutureBuilder(
                                                            future: getBettingPoints(
                                                                newData[index][
                                                                            "teams"]
                                                                        [0]
                                                                    .toString(),
                                                                '',
                                                                "cricket"),
                                                            builder: (context,
                                                                snapshot) {
                                                              final mapBetting =
                                                                  snapshot.data;
                                                              if (mapBetting == null ||
                                                                  mapBetting[
                                                                          "odd_one"] ==
                                                                      null ||
                                                                  mapBetting[
                                                                          "odd_one"] ==
                                                                      "-" ||
                                                                  mapBetting[
                                                                          "odd_two"] ==
                                                                      null ||
                                                                  mapBetting[
                                                                          "odd_two"] ==
                                                                      "-" ||
                                                                  mapBetting[
                                                                          "odd_five"] ==
                                                                      null ||
                                                                  mapBetting[
                                                                          "odd_five"] ==
                                                                      "-" ||
                                                                  mapBetting[
                                                                          "odd_six"] ==
                                                                      null ||
                                                                  mapBetting[
                                                                          "odd_six"] ==
                                                                      "-") {
                                                                return Row(
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
                                                                    Image.asset(
                                                                        "assets/cricket icon.png"),
                                                                    SizedBox(
                                                                      width: 25,
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              3),
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            42,
                                                                        color: Colors
                                                                            .black54,
                                                                        child:
                                                                            Text(
                                                                          "56",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
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
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            42,
                                                                        color: Colors
                                                                            .black12,
                                                                        child:
                                                                            Text(
                                                                          "22",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 40,
                                                                    ),
                                                                    Image.asset(
                                                                      "assets/live_tv.png",
                                                                      scale:
                                                                          1.3,
                                                                    )
                                                                  ],
                                                                );
                                                              } else {
                                                                return Row(
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
                                                                    Image.asset(
                                                                        "assets/cricket icon.png"),
                                                                    SizedBox(
                                                                      width: 25,
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              3),
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            42,
                                                                        color: Colors
                                                                            .black54,
                                                                        child:
                                                                            Text(
                                                                          mapBetting["odd_one"][0] == "1"
                                                                              ? ((double.parse(mapBetting["odd_one"]) * 100) - ((int.parse(mapBetting["odd_one"][0])) * 100)).toInt().toString()
                                                                              : ((double.parse(mapBetting["odd_five"]) * 100) - ((int.parse(mapBetting["odd_five"][0])) * 100)).toInt().toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
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
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            42,
                                                                        color: Colors
                                                                            .black12,
                                                                        child:
                                                                            Text(
                                                                          mapBetting["odd_two"][0] == "1"
                                                                              ? ((double.parse(mapBetting["odd_two"]) * 100) - ((int.parse(mapBetting["odd_two"][0])) * 100)).toInt().toString()
                                                                              : ((double.parse(mapBetting["odd_six"]) * 100) - ((int.parse(mapBetting["odd_six"][0])) * 100)).toInt().toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 40,
                                                                    ),
                                                                    Image.asset(
                                                                      "assets/live_tv.png",
                                                                      scale:
                                                                          1.3,
                                                                    )
                                                                  ],
                                                                );
                                                              }
                                                              ;
                                                            }),
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
      ),
    );
  }
}
