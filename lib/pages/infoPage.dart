// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:fl_chart/fl_chart.dart';

class info extends StatefulWidget {
  const info({super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  List ranking = [
    {'class': 'A', 'total': 23},
    {'class': 'B', 'total': 14},
    {'class': 'C', 'total': 8},
    {'class': 'D', 'total': 7},
    {'class': 'E', 'total': 21},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 6,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/background.jpeg',
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
            child: Column(
              children: [
                
                Container(
                  height: 1,
                  width: 380,
                  color: Colors.white,
                ),
                Container(
                  height: 90,
                  width: 380,
                  color: Color.fromARGB(255, 33, 33, 33),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 30),
                        child: Image.asset('assets/india.png'),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 30),
                            child: Text(
                              'IND',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text(
                              '29-0',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 32),
                            child: Text(
                              '1st inn',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              '2.3',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 20),
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 45, top: 15),
                          child: Image.asset('assets/volume.png'))
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Color.fromARGB(255, 105, 104, 104),
                ),
                Container(
                  height: 35,
                  width: 380,
                  color: Color.fromARGB(255, 33, 33, 33),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'CRR : 9.58',
                          style: TextStyle(
                              color: Color.fromARGB(255, 208, 206, 206),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 55),
                        child: Text(
                          'RRR : 8.58',
                          style: TextStyle(
                              color: Color.fromARGB(255, 209, 208, 208),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Image.asset(
                          'assets/live_tv.png',
                          scale: 1.2,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 6),
                      child: Text(
                        'Over 2',
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 175, 175),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 9),
                      child: Text(
                        '= 10',
                        style: TextStyle(
                            color: Color.fromARGB(255, 201, 200, 200),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 8),
                      height: 15,
                      width: 1,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 10),
                      child: Text(
                        'Over 3',
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 175, 175),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4, top: 9),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 9),
                      child: Text(
                        '= 6',
                        style: TextStyle(
                            color: Color.fromARGB(255, 201, 200, 200),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(bottom: 10, left: 20),
                          child: Image.asset(
                            'assets/coin.png',
                            scale: 0.5,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'IND won the toss and chose to bat',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 70,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(right: 70, top: 10),
                              child: Text(
                                '1st test',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'PAK vs IND 2022',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 00),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 120),
                          child: Image.asset(
                            'assets/matchlogo 1.png',
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 60,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(bottom: 20, left: 15),
                          child: Icon(
                            Icons.calendar_today_rounded,
                            size: 25,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '01 Dec, 10.30 AM',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 140),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 1, width: 320, color: Colors.white),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 60,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(bottom: 20, left: 15),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '01 Dec, 10.30 AM',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 130),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 25, top: 8),
                  child: Text(
                    'Playing XI',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 60,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/india.png',
                            height: 40,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'India',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 180),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 1, width: 320, color: Colors.white),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 60,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/pakistan.jpg',
                            height: 40,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'Pakistan',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 155),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 45,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Who will win?',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 80),
                          child: Text(
                            'Total Votes:2,26,200',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(height: 1, width: 320, color: Colors.white),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 60,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Container(
                              height: 28,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  border: Border.all(
                                    color: Colors.amber,
                                    width: 1,
                                  )),
                              child: Center(
                                child: Text(
                                  'IND',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Container(
                              height: 28,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 84, 80, 80),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  )),
                              child: Center(
                                child: Text(
                                  'DRAW',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Container(
                              height: 28,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 25, 103, 28),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 25, 103, 28),
                                    width: 1,
                                  )),
                              child: Center(
                                child: Text(
                                  'PAK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 20, left: 40),
                      child: Text(
                        'Team from',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '(last 5 matches)',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/india.png',
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'IND',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 63),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.red),
                            ),
                            child: Center(
                              child: Text(
                                'L',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 27, 119, 30),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Center(
                              child: Text(
                                'W',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.red),
                            ),
                            child: Center(
                              child: Text(
                                'L',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 234, 185, 40),
                              border: Border.all(
                                  color: Color.fromARGB(255, 234, 185, 40)),
                            ),
                            child: Center(
                              child: Text(
                                'd',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 234, 185, 40),
                              border: Border.all(
                                  color: Color.fromARGB(255, 234, 185, 40)),
                            ),
                            child: Center(
                              child: Text(
                                'd',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(height: 1, width: 290, color: Colors.white),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 40),
                  child: Row(children: [
                    Image.asset(
                      'assets/pakistan.jpg',
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'PAK',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 55),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              '*',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.red),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 234, 185, 40),
                            border: Border.all(
                                color: Color.fromARGB(255, 234, 185, 40)),
                          ),
                          child: Center(
                            child: Text(
                              'd',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 27, 119, 30),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Center(
                            child: Text(
                              'W',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.red),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 234, 185, 40),
                            border: Border.all(
                                color: Color.fromARGB(255, 234, 185, 40)),
                          ),
                          child: Center(
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'd',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 110,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Image.asset(
                                    'assets/india.png',
                                    height: 40,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    'SL',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    '378- 10 & 360 -8',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Image.asset(
                                    'assets/pakistan.jpg',
                                    height: 40,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    'PAK ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    '231- 6 & 260 -5 ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 60,
                          width: 1,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 201, 45, 34),
                                border: Border.all(
                                  color: Color.fromARGB(255, 201, 45, 34),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'L',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 45,
                          ),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                '2nd Test',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              SizedBox(height: 2),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  'SL vs PAK...',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 110,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Image.asset(
                                    'assets/india.png',
                                    height: 40,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    'SL',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    '378- 10 & 360 -8',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Image.asset(
                                    'assets/pakistan.jpg',
                                    height: 40,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    'PAK ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    '231- 6 & 260 -5 ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 60,
                          width: 1,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 26, 121, 29),
                                border: Border.all(
                                  color: Color.fromARGB(255, 26, 121, 29),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'W',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 45,
                          ),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                '2nd Test',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              SizedBox(height: 2),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  'SL vs PAK...',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 70,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Image.asset(
                                          'assets/pakistan.jpg',
                                          height: 40,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          'PAK ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 10),
                                        child: Text(
                                          '231- 6 & 260 -5 ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Text(
                            'Fixtures',
                            style: TextStyle(
                                color: Color.fromARGB(255, 27, 82, 127)),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 36, 97, 147),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 45, top: 20),
                  child: Text(
                    '*Upcoming Matches',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 35, top: 40),
                  child: Row(
                    children: [
                      Text(
                        'Head to head',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          '(Last 10 Matches)',
                          style: TextStyle(
                              color: Color.fromARGB(255, 172, 167, 167),
                              fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 80,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'assets/india.png',
                              //height: 50,
                              scale: 0.80,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              '5',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              '-',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              '1',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Image.asset(
                              'assets/pakistan.jpg',
                              height: 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 110,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            '3rd Test,Pakistan tour of india 2022 on 21 Aug',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Image.asset(
                                        'assets/india.png',
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        'SL',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 10),
                                      child: Text(
                                        '378- 10 & 360 -8',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10, top: 5),
                                      child: Image.asset(
                                        'assets/pakistan.jpg',
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        'PAK ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        '231- 6 & 260 -5 ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              height: 60,
                              width: 1,
                              color: Colors.white,
                            ),
                            Container(
                              width: 40,
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Match Drawn',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 110,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            '3rd Test,Pakistan tour of india 2022 on 11 Aug',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        'assets/india.png',
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        'SL',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        '378- 10 & 360 -8',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Image.asset(
                                        'assets/pakistan.jpg',
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        'PAK ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 10),
                                      child: Text(
                                        '231- 6 & 260 -5 ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              height: 60,
                              width: 1,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Ind Won',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 70,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 25),
                                          child: Text(
                                            'PAK ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 25),
                                        child: Text(
                                          'vs',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 25),
                                        child: Text(
                                          'IND ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 90),
                          child: Text(
                            'More Matches',
                            style: TextStyle(
                                color: Color.fromARGB(255, 27, 82, 127)),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 36, 97, 147),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 300,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15, top: 20),
                              child: Image.asset(
                                'assets/india.png',
                                //height: 50,
                                scale: 0.80,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(top: 30, right: 35),
                                  child: Text(
                                    'IND',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'vs all teams',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 187, 183, 183),
                                          fontSize: 12),
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, left: 55),
                                      child: Text(
                                        'IND',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child: Text(
                                          'vs all teams',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 187, 183, 183),
                                              fontSize: 12),
                                        )),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 20, left: 10),
                                  child: Image.asset(
                                    'assets/pakistan.jpg',
                                    height: 48,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 8),
                          height: 1,
                          width: 310,
                          color: Colors.white,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 6),
                              child: Text(
                                '10',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                'Matches played',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                '10',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, left: 8),
                          height: 1,
                          width: 310,
                          color: Colors.white,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 6),
                              child: Text(
                                '60%',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 48, 131, 50),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100, top: 6),
                              child: Text(
                                'Win',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 108, top: 6),
                              child: Text(
                                '40%',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, left: 8),
                          height: 1,
                          width: 310,
                          color: Colors.white,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 6),
                              child: Text(
                                '320',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 48, 131, 50),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                'Avarage Score',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                '200',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, left: 8),
                          height: 1,
                          width: 310,
                          color: Colors.white,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 6),
                              child: Text(
                                '539',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 48, 131, 50),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                'Highest Score',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                '510',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, left: 8),
                          height: 1,
                          width: 310,
                          color: Colors.white,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 6),
                              child: Text(
                                '150',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 48, 131, 50),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75, top: 6),
                              child: Text(
                                'Laest Score',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 87, top: 6),
                              child: Text(
                                '140',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 244, 244),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, left: 8),
                          height: 1,
                          width: 310,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 30, bottom: 26),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      'Rawalpindi Cricket Stadium,Rawalpindi,pakistan',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 170,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25, bottom: 60),
                          child: Image.asset(
                            'assets/cloud.png',
                            height: 50,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 30),
                              child: Text(
                                'Rawalpindi,pakistan',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 58),
                              child: Text(
                                '20  C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Image.asset(
                                    'assets/droplet.png',
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Text(
                                    '60% (Humidity)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Image.asset(
                                    'assets/skydrop.png',
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    '60% (Humidity)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(),
                              child: Text(
                                '60% (Humidity)',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 300,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 60, top: 20, left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 60,
                          width: 50,
                          color: Color.fromARGB(255, 132, 130, 130),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: AspectRatio(
                                  aspectRatio: 50 / 30,
                                  child: DChartPie(
                                    data: [
                                      {'domain': 'Ionic', 'measure': 1},
                                      {'domain': '', 'measure': 1},
                                    ],
                                    fillColor: (pieData, index) {
                                      switch (pieData['domain']) {
                                        case 'Flutter':
                                          return Colors.blue;
                                        case 'React Native':
                                          return Colors.blueAccent;
                                        case 'Ionic':
                                          return Colors.lightBlue;
                                        default:
                                          return Colors.orange;
                                      }
                                    },
                                    // pieLabel: (pieData, index) {
                                    //   return "${pieData['domain']}:\n${pieData['measure']}%";
                                    // },
                                    labelPosition: PieLabelPosition.outside,
                                    donutWidth: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 30),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Recent Matches on Venue',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 110,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            '20th Test,Quaid e Azam Trophy 2022 on 02 Nov',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        'assets/india.png',
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        'SL',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        '378- 10 & 360 -8',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Image.asset(
                                        'assets/pakistan.jpg',
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        'PAK ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 10),
                                      child: Text(
                                        '231- 6 & 260 -5 ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              height: 60,
                              width: 1,
                              color: Colors.white,
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Sindh Won',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 3),
                                  child: Text(
                                    'by 202 runs',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 70,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 25),
                                          child: Text(
                                            'PAK ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 25),
                                        child: Text(
                                          'vs',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 25),
                                        child: Text(
                                          'IND ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 90),
                          child: Text(
                            'More Matches',
                            style: TextStyle(
                                color: Color.fromARGB(255, 27, 82, 127)),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 36, 97, 147),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 8),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Umpires',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 190,
                    width: 320,
                    color: Color.fromARGB(255, 66, 63, 63),
                    child: Column(children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          'Umpire',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Ahsan Raza,Joel Wilson',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 8),
                        height: 1,
                        width: 310,
                        color: Colors.white,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          'Third Umpire',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Ahsan Raza,Joel Wilson',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 8),
                        height: 1,
                        width: 310,
                        color: Colors.white,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          'referee',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Ahsan Raza,Joel Wilson',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 8),
                        height: 1,
                        width: 310,
                        color: Colors.white,
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
