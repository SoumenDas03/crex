// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';

class seriesstatuspage extends StatefulWidget {
  const seriesstatuspage({super.key});

  @override
  State<seriesstatuspage> createState() => _seriesstatuspageState();
}

class _seriesstatuspageState extends State<seriesstatuspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 6,
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
                    // // Container(
                    // //     margin: EdgeInsets.only(left: 45, top: 15),
                    //     child: Image.asset('assets/volumn.png'))
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 70, top: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 30,
                        width: 100,
                        color: Color.fromARGB(255, 223, 90, 33),
                        child: Container(
                          margin: EdgeInsets.only(left: 25, top: 5),
                          child: Text(
                            'TEST',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 30),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        margin: EdgeInsets.only(left: 30, top: 5),
                        child: Text(
                          'T 20',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 120,
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
                              Image.asset('assets/india.png'),
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
                              Image.asset('assets/india.png'),
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
                width: 380,
                color: Colors.white,
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                  height: 54,
                  width: 380,
                  color: Color.fromARGB(255, 223, 90, 33),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Team',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Series',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Text(
                          'P',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          'W',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          'L',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          'T',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          'D',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'NRR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Pts',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
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
              ListView.builder(
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
                            margin: EdgeInsets.only(left: 5, top: 15),
                            child: CircleAvatar(
                              radius: 9,
                              backgroundImage: AssetImage('assets/india.png'),
                            ),
                          ),
                          Container(
                            width: 50,
                            margin: EdgeInsets.only(left: 5, top: 15),
                            child: Text(
                              'IND',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              '3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 38, top: 15),
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 15),
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 18, top: 15),
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              '6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 15),
                            child: Text(
                              '26',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25, top: 15),
                            child: Text(
                              '60',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        width: 380,
                        color: Colors.white,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
