// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';

class seriesstatus extends StatefulWidget {
  const seriesstatus({super.key});

  @override
  State<seriesstatus> createState() => _seriesstatusState();
}

class _seriesstatusState extends State<seriesstatus> {
  bool isVisible = false;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: DefaultTabController(
            length: 6,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "assets/background.jpeg",
                ),
                fit: BoxFit.cover,
              )),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: 350,
                    color: Colors.blueGrey,
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
                                              backgroundImage: AssetImage(
                                                  'assets/india.png'),
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
                                              children: const [
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
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
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
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
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  DefaultTabController(
                    length: 2,
                    child: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            // ignore: prefer_const_constructors
                            color: Color(0xFFFF4D00),
                            borderRadius: BorderRadius.circular(5)),
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        tabs: [
                          Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: 10),

                            height: 30, width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            // ignore: prefer_const_constructors
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = isVisible;
                                });
                              },
                              child: Tab(
                                text: ('Test'),
                              ),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: 10),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            // ignore: prefer_const_constructors
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Tab(
                                text: ('T20'),
                              ),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      height: 125,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 79, 78, 78),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 40, top: 20),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/india.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2, top: 5),
                                      child: Text(
                                        'INIA',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50, top: 15),
                                child: Column(
                                  children: [
                                    Text(
                                      '0 - 0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2, top: 5),
                                      child: Text(
                                        '7/7 played',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40, top: 20),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/india.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2, top: 5),
                                      child: Text(
                                        'PAKISTAN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1,
                            width: 350,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '1st Test is live now.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isVisible,
                    child: Container(
                      height: 125,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 79, 78, 78),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 40, top: 20),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/india.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2, top: 5),
                                      child: Text(
                                        'INDIA',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50, top: 15),
                                child: Column(
                                  children: [
                                    Text(
                                      '0 - 0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2, top: 5),
                                      child: Text(
                                        '7/7 played',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40, top: 20),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/india.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2, top: 5),
                                      child: Text(
                                        'PAKISTAN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1,
                            width: 350,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '1st Test is live now.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'WTC 2021 -23 points Table',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
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
                    height: 3,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 54,
                      width: 350,
                      color: Color(0xFFFF4D00),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            child: Text(
                              'Team',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 45,
                            child: Text(
                              'Series',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            child: Text(
                              'P',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            child: Text(
                              'W',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            child: Text(
                              'L',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            child: Text(
                              'T',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            child: Text(
                              'D',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            child: Text(
                              'NRR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            child: Text(
                              'Pts',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'PCT%',
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
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundImage:
                                            AssetImage("assets/india.png"),
                                      ),
                                      SizedBox(
                                        width: 2.5,
                                      ),
                                      Text(
                                        'IND',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  child: Text(
                                    '26',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '60',
                                    style: TextStyle(
                                        color: Color(0xFFFF4D00),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: 350,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
