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
      livedata;
  firstCarouselSlider exampleTwoController = Get.put(firstCarouselSlider());

  Future<void> apiFetch() async {
    var status = true;
    await Future.wait(
        [getFootballMatches(), getFootballMatchesUpcoming(), getBanner()])
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
        Uri.parse('https://playexch.us/api/scarp-tennis-today-list'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      livedata = data
          .where((element) => element["match_inpaly"] == "In-Play")
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

  Future getFootballMatchesUpcoming() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://playexch.us/api/scarp-tennis-list'),
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

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: apiFetch(),
        builder: (context, snapshot) {
          if (livedata == null) {
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
                                      livedata.length == 0
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
                                            physics:
                                            AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: livedata.length,
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
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius:
                                                                    15,
                                                                    backgroundImage:
                                                                    NetworkImage("https://www.healtheuropa.com/wp-content/uploads/2020/01/iStock-Bobex-73-1024x576.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                    70,
                                                                    child:
                                                                    Text(
                                                                      livedata[index]["match_name"].toString().split("V/S")[0].toString(),
                                                                      style:
                                                                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                      overflow:
                                                                      TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                livedata[index]
                                                                [
                                                                "match_datetime"]
                                                                    .toString(),
                                                                style:
                                                                TextStyle(
                                                                  color: isDarkMode
                                                                      ? const Color(0xFFFF2E00)
                                                                      : const Color(0xFFFF4D00),
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius:
                                                                    15,
                                                                    backgroundImage:
                                                                    NetworkImage("https://www.healtheuropa.com/wp-content/uploads/2020/01/iStock-Bobex-73-1024x576.jpg"),
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
                                                                      livedata[index]["match_name"].toString().split("V/S")[1].toString(),
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
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              // Text(
                                                              //   data[index]["match_name"]
                                                              //       .toString()
                                                              //       .split("V/S")[0]
                                                              //       .toString()
                                                              //       .substring(0, 3),
                                                              //   style: TextStyle(
                                                              //       color: isDarkMode
                                                              //           ? const Color(
                                                              //               0xFFFF2E00)
                                                              //           : const Color(
                                                              //               0xFFFF4D00),
                                                              //       fontWeight:
                                                              //           FontWeight.bold),
                                                              // ),
                                                              // SizedBox(
                                                              //   width: 50,
                                                              // ),
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
                                                                    livedata[index]["odd_one"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    livedata[index]["odd_two"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.black,
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
                                                                  45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                  Text(
                                                                    livedata[index]["odd_three"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    livedata[index]["odd_four"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.black,
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
                                                                  45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                  Text(
                                                                    livedata[index]["odd_five"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    livedata[index]["odd_six"]
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
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 20, top: 10),
                                        child: ListView.builder(
                                            physics:
                                            AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: data.length,
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
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://www.healtheuropa.com/wp-content/uploads/2020/01/iStock-Bobex-73-1024x576.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 70,
                                                                    child: Text(
                                                                      data[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split(
                                                                          "V/S")[0]
                                                                          .toString(),
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
                                                              Text(
                                                                data[index][
                                                                "match_datetime"]
                                                                    .toString(),
                                                                style:
                                                                TextStyle(
                                                                  color: isDarkMode
                                                                      ? const Color(
                                                                      0xFFFF2E00)
                                                                      : const Color(
                                                                      0xFFFF4D00),
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://www.healtheuropa.com/wp-content/uploads/2020/01/iStock-Bobex-73-1024x576.jpg"),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 70,
                                                                    child: Text(
                                                                      data[index]
                                                                      [
                                                                      "match_name"]
                                                                          .toString()
                                                                          .split(
                                                                          "V/S")[1]
                                                                          .toString(),
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
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              // Text(
                                                              //   data[index]["match_name"]
                                                              //       .toString()
                                                              //       .split("V/S")[0]
                                                              //       .toString()
                                                              //       .substring(0, 3),
                                                              //   style: TextStyle(
                                                              //       color: isDarkMode
                                                              //           ? const Color(
                                                              //               0xFFFF2E00)
                                                              //           : const Color(
                                                              //               0xFFFF4D00),
                                                              //       fontWeight:
                                                              //           FontWeight.bold),
                                                              // ),
                                                              // SizedBox(
                                                              //   width: 50,
                                                              // ),
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
                                                                    data[index][
                                                                    "odd_one"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    data[index][
                                                                    "odd_two"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    data[index][
                                                                    "odd_three"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    data[index][
                                                                    "odd_four"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    data[index][
                                                                    "odd_five"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    data[index][
                                                                    "odd_six"]
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
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 20, top: 10),
                                        child: ListView.builder(
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
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://www.healtheuropa.com/wp-content/uploads/2020/01/iStock-Bobex-73-1024x576.jpg"),
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
                                                                          .split(
                                                                          "V/S")[0]
                                                                          .toString(),
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
                                                              Text(
                                                                dataUpcoming[
                                                                index]
                                                                [
                                                                "match_datetime"]
                                                                    .toString(),
                                                                style:
                                                                TextStyle(
                                                                  color: isDarkMode
                                                                      ? const Color(
                                                                      0xFFFF2E00)
                                                                      : const Color(
                                                                      0xFFFF4D00),
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
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        "https://www.healtheuropa.com/wp-content/uploads/2020/01/iStock-Bobex-73-1024x576.jpg"),
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
                                                                          .split(
                                                                          "V/S")[1]
                                                                          .toString(),
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
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              // Text(
                                                              //   data[index]["match_name"]
                                                              //       .toString()
                                                              //       .split("V/S")[0]
                                                              //       .toString()
                                                              //       .substring(0, 3),
                                                              //   style: TextStyle(
                                                              //       color: isDarkMode
                                                              //           ? const Color(
                                                              //               0xFFFF2E00)
                                                              //           : const Color(
                                                              //               0xFFFF4D00),
                                                              //       fontWeight:
                                                              //           FontWeight.bold),
                                                              // ),
                                                              // SizedBox(
                                                              //   width: 50,
                                                              // ),
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
                                                                    dataUpcoming[index]
                                                                    [
                                                                    "odd_one"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    dataUpcoming[index]
                                                                    [
                                                                    "odd_two"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    dataUpcoming[index]
                                                                    [
                                                                    "odd_three"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    dataUpcoming[index]
                                                                    [
                                                                    "odd_four"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
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
                                                                  width: 45,
                                                                  color: Colors
                                                                      .black54,
                                                                  child: Text(
                                                                    dataUpcoming[index]
                                                                    [
                                                                    "odd_five"]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                        FontWeight.bold),
                                                                  ),
                                                                ),
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
                                                                    dataUpcoming[index]
                                                                    [
                                                                    "odd_six"]
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
                                      Text(""),
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
