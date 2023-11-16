// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crex/GetX/carouselManagment.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


// ignore: camel_case_types
class tennis_home extends StatefulWidget {
  const tennis_home({super.key});

  @override
  State<tennis_home> createState() => _tennis_homeState();
}

// ignore: camel_case_types
class _tennis_homeState extends State<tennis_home> {
  var map,
      data,
      formattedDate,
      mapUpcoming,
      dataUpcoming,
      bannerList,
      dataUrl,
      dataList,
      livedata,
  completedData;
  firstCarouselSlider exampleTwoController = Get.put(firstCarouselSlider());

  Future<void> apiFetch() async {
    var status = true;
    await Future.wait(
        [getFootballMatches(), getFootballMatchesUpcoming(), getBanner(), getFootballMatchesCompleted()])
        .then((v) {
      for (var item in v) {
        print('$item \n');
      }
    }).whenComplete(() {
      status = false;
    });
    print(status == true ? 'Loading' : 'FINISHED');
  }

  Future getFootballMatches() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://playexch.us/api/live-tannis-match'),
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

  Future getFootballMatchesUpcoming() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://playexch.us/api/upcoming-tannis-match'),
      );

      mapUpcoming = jsonDecode(response.body.toString());
      dataUpcoming = mapUpcoming["data"];
      if (response.statusCode == 200) {
        return dataUpcoming;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future getFootballMatchesCompleted() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://playexch.us/api/complete-tannis-match'),
      );

      map = jsonDecode(response.body.toString());
      completedData = map["data"];
      if (response.statusCode == 200) {
        return completedData;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
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
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: apiFetch(),
        builder: (context, snapshot) {
          if (dataUpcoming == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTabController(
                              length: 4,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    // margin: EdgeInsets.only(left: 10),
                                    width: 340,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: isDarkMode
                                            ? const Color(0xFFFF2E00)
                                            : const Color(0xFFDFDFDF),
                                        borderRadius:
                                        BorderRadius.circular(20)),
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
                                  Container(
                                    padding: EdgeInsets.only(bottom: 25),
                                    height: 500,
                                    child: TabBarView(children: [
                                      data == null || data.length == 0
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
                                        child: ListView.builder(padding: EdgeInsets.only(bottom: 50),
                                            physics:
                                            AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                            data.length,
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
                                                          color: Colors
                                                              .white,
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
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius:
                                                                    15,
                                                                    backgroundImage:
                                                                    NetworkImage("https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                    50,
                                                                    child:
                                                                    Text(
                                                                      data[index]["match_name"].toString().split("v")[0].toString(),
                                                                      style:
                                                                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width:
                                                                100,
                                                                child:
                                                                Text(
                                                                  formatDateTime(
                                                                      data[index]["match_datetime"].toString()),
                                                                  style:
                                                                  TextStyle(
                                                                    color: isDarkMode
                                                                        ? const Color(0xFFFF2E00)
                                                                        : const Color(0xFFFF4D00),
                                                                  ),
                                                                  overflow:
                                                                  TextOverflow.clip,
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius:
                                                                    15,
                                                                    backgroundImage:
                                                                    NetworkImage("https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                    70,
                                                                    child:
                                                                    Text(
                                                                      data[index]["match_name"].toString().split("v")[1].toString(),
                                                                      style:
                                                                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow.ellipsis,
                                                                    ),
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
                                                          color: Colors
                                                              .white,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 40,
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  data[index]["odds"][0]["favname"] !=
                                                                      "--"
                                                                      ? data[index]["odds"][0]["favname"].toString()
                                                                      : "--",
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? const Color(0xFFFF2E00)
                                                                          : const Color(0xFFFF4D00),
                                                                      fontWeight: FontWeight.bold),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 30,
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
                                                                  45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                  Text(
                                                                    data[index]["odds"][0]["back"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
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
                                                                  45,
                                                                  color: Colors
                                                                      .black12,
                                                                  child:
                                                                  Text(
                                                                    data[index]["odds"][0]["lay"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
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
                                      dataUpcoming == null || dataUpcoming.length == 0
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
                                        child: ListView.builder(padding: EdgeInsets.only(bottom: 50),
                                            physics:
                                            AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: dataUpcoming.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
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
                                                                .spaceEvenly,
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    child: Text(
                                                                      dataUpcoming[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split("v")[
                                                                      0]
                                                                          .toString()
                                                                      ,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  formatDateTime(
                                                                      dataUpcoming[index]
                                                                      [
                                                                      "match_datetime"]
                                                                          .toString()),
                                                                  style:
                                                                  TextStyle(
                                                                    color: isDarkMode
                                                                        ? const Color(
                                                                        0xFFFF2E00)
                                                                        : const Color(
                                                                        0xFFFF4D00),
                                                                  ),
                                                                  overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 70,
                                                                    child: Text(
                                                                      dataUpcoming[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split("v")[
                                                                      1]
                                                                          .toString()
                                                                      ,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
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
                                                            children: [
                                                              SizedBox(
                                                                width: 40,
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  dataUpcoming[index]["odds"][0]
                                                                  [
                                                                  "favname"] !=
                                                                      "--"
                                                                      ? dataUpcoming[index]["odds"][0]
                                                                  [
                                                                  "favname"]
                                                                      .toString()
                                                                      : "--",
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? const Color(
                                                                          0xFFFF2E00)
                                                                          : const Color(
                                                                          0xFFFF4D00),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 30,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    dataUpcoming[index]["odds"][0]
                                                                    [
                                                                    "back"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black12,
                                                                  child: Text(
                                                                    dataUpcoming[index]["odds"][0]
                                                                    [
                                                                    "lay"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
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
                                      dataUpcoming == null || dataUpcoming.length == 0
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
                                        child: ListView.builder(padding: EdgeInsets.only(bottom: 50),
                                            physics:
                                            AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: dataUpcoming.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
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
                                                                .spaceEvenly,
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    child: Text(
                                                                      dataUpcoming[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split("v")[
                                                                      0]
                                                                          .toString()
                                                                      ,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  formatDateTime(
                                                                      dataUpcoming[index]
                                                                      [
                                                                      "match_datetime"]
                                                                          .toString()),
                                                                  style:
                                                                  TextStyle(
                                                                    color: isDarkMode
                                                                        ? const Color(
                                                                        0xFFFF2E00)
                                                                        : const Color(
                                                                        0xFFFF4D00),
                                                                  ),
                                                                  overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 70,
                                                                    child: Text(
                                                                      dataUpcoming[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split("v")[
                                                                      1]
                                                                          .toString()
                                                                      ,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
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
                                                            children: [
                                                              SizedBox(
                                                                width: 40,
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  dataUpcoming[index]["odds"][0]
                                                                  [
                                                                  "favname"] !=
                                                                      "--"
                                                                      ? dataUpcoming[index]["odds"][0]
                                                                  [
                                                                  "favname"]
                                                                      .toString()
                                                                      : "--",
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? const Color(
                                                                          0xFFFF2E00)
                                                                          : const Color(
                                                                          0xFFFF4D00),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 30,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    dataUpcoming[index]["odds"][0]
                                                                    [
                                                                    "back"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black12,
                                                                  child: Text(
                                                                    dataUpcoming[index]["odds"][0]
                                                                    [
                                                                    "lay"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
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
                                      completedData == null || completedData.length == 0
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
                                          :
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 20, top: 10),
                                        child: ListView.builder(padding: EdgeInsets.only(bottom: 50),
                                            physics:
                                            AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: completedData.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
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
                                                                .spaceEvenly,
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    child: Text(
                                                                      completedData[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split("v")[
                                                                      0]
                                                                          .toString()
                                                                          ,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  formatDateTime(
                                                                      completedData[index]
                                                                      [
                                                                      "match_datetime"]
                                                                          .toString()),
                                                                  style:
                                                                  TextStyle(
                                                                    color: isDarkMode
                                                                        ? const Color(
                                                                        0xFFFF2E00)
                                                                        : const Color(
                                                                        0xFFFF4D00),
                                                                  ),
                                                                  overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://img.etimg.com/photo/98097215/98097215.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 70,
                                                                    child: Text(
                                                                      completedData[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split("v")[
                                                                      1]
                                                                          .toString()
                                                                          ,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                    ),
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
                                                            children: [
                                                              SizedBox(
                                                                width: 40,
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                  completedData[index]["odds"][0]
                                                                  [
                                                                  "favname"] !=
                                                                      "--"
                                                                      ? completedData[index]["odds"][0]
                                                                  [
                                                                  "favname"]
                                                                      .toString()

                                                                      : "--",
                                                                  style: TextStyle(
                                                                      color: isDarkMode
                                                                          ? const Color(
                                                                          0xFFFF2E00)
                                                                          : const Color(
                                                                          0xFFFF4D00),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 30,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    completedData[index]["odds"][0]
                                                                    [
                                                                    "back"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black12,
                                                                  child: Text(
                                                                    completedData[index]["odds"][0]
                                                                    [
                                                                    "lay"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
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
                                    ]),
                                  )
                                ],
                              ),
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
