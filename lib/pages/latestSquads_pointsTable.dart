// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class latestSquads_pointsTable extends StatefulWidget {
  const latestSquads_pointsTable({super.key, required this.seriesId});

  final String seriesId;

  @override
  State<latestSquads_pointsTable> createState() =>
      _latestSquads_pointsTableState();
}

class _latestSquads_pointsTableState extends State<latestSquads_pointsTable> {
  var map, data;

  Future<void> getPointsTable() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.cricapi.com/v1/series_points?apikey=a6e59415-3226-4b92-817f-a90ddebd0315&id=${widget.seriesId}",
        ),
      );

      if(response.statusCode == 200) {
        map = jsonDecode(response.body);
        data = map["data"];
        data.sort((a, b) {
          int pointsA = a["wins"] * 2;
          int pointsB = b["wins"] * 2;
          pointsA += int.parse(a["ties"].toString());
          pointsB += int.parse(b["ties"].toString());

          if (pointsB != pointsA) {
            return pointsB.compareTo(pointsA); // Sort by points in descending order
          } else {
            // If points are equal, consider "nr" (no result)
            return (b["nr"] as int).compareTo(a["nr"] as int);
          }
        });
      }
      else{
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: getPointsTable(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/background.jpeg",
                        ),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 5),
                          height: 54,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFFFF4D00),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                // alignment: Alignment.center,
                                // width: 60,
                                child: Text(
                                  'Team',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              Container(
                                // alignment: Alignment.center,
                                // width: 45,
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              Container(
                                // alignment: Alignment.center,
                                // width: 25,
                                child: Text(
                                  'W',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              Container(
                                // alignment: Alignment.center,
                                // width: 25,
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              Container(
                                // alignment: Alignment.center,
                                // width: 25,
                                child: Text(
                                  'NRR',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              // SizedBox(
                              //   width: 2,
                              // ),
                              Container(
                                // alignment: Alignment.center,
                                // width: 25,
                                child: Text(
                                  'PTS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 1,
                        width: 380,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15, right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        // alignment: Alignment.center,
                                        width: 75,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundImage:
                                              NetworkImage(data[index]["img"]),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              data[index]["shortname"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        // alignment: Alignment.center,
                                        width: 20,
                                        child: Text(
                                          data[index]["matches"].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 26,
                                      ),
                                      Container(
                                        // alignment: Alignment.center,
                                        width: 20,
                                        child: Text(
                                          data[index]["wins"].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Container(
                                        // alignment: Alignment.center,
                                        width: 20,
                                        child: Text(
                                          data[index]["loss"].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 26,
                                      ),
                                      Container(
                                        // alignment: Alignment.center,
                                        width: 20,
                                        child: Text(
                                          data[index]["nr"].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                        // alignment: Alignment.center,
                                        width: 30,
                                        child: Text(
                                          ((data[index]["wins"] * 2) + (data[index]["ties"])).toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 1,
                                  width: 350,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
      )
    );
  }
}
