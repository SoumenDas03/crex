// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore

import 'package:crex/pages/live_second.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class graph extends StatefulWidget {
  const graph({super.key});

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
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
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 1,
                width: 380,
                color: Colors.white,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => live_second(id: "1"),
                      ));
                },
                child: Padding(
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
                                            backgroundImage:
                                                AssetImage('assets/india.png'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                'IND',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '29-0',
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
                                            children: [
                                              Text(
                                                '1st inn',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '2.3',
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
                                  'CCR : 9.58',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.5),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'RRR : 8.58',
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
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Over 2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Over 3',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 320,
                        color: Color.fromARGB(255, 58, 58, 58),
                        child: SfSparkLineChart(
                          //Enable the trackball
                          trackball: SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap),
                          //Enable marker
                          marker: SparkChartMarker(
                              displayMode: SparkChartMarkerDisplayMode.all),
                          //Enable data label
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          data: <double>[2, 5, 4, 3, 5, 6, 4, 4, 3, 8, 5],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 275,
                child: Text(
                  'Win Percentage graph is no available for test matches',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }
}
