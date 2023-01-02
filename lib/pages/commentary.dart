// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class commententary extends StatelessWidget {
  const commententary({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
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
          )),

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                // alignment: Alignment.topLeft,
                //margin: EdgeInsets.only(left: 10),
                width: 350,
                height: 50,

                child: TabBar(
                    indicatorColor: Color(0xFFFF4D00),
                    // indicatorWeight: 3,
                    // indicatorSize: TabBarIndicatorSize.label,
                    padding: EdgeInsets.only(right: 0),
                    labelPadding: EdgeInsets.only(right: 0),
                    unselectedLabelColor: Colors.white,
                    labelColor: Color(0xFFFF4D00),
                    labelStyle:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      Tab(
                        text: ('Info'),
                      ),
                      Tab(
                        text: ('Fantasty'),
                      ),
                      Tab(
                        text: ('Commentary'),
                      ),
                      Tab(
                        text: ('Live'),
                      ),
                      Tab(
                        text: ('Scorecard'),
                      ),
                      Tab(
                        text: ('Graphs'),
                      )
                    ]),
              ),
              Container(
                height: 1,
                width: 350,
                color: Colors.white,
              ),
              SizedBox(
                height: 8,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  height: 160,
                  width: 400,
                  color: Colors.blueGrey[900],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 25),
                            child: Icon(
                              Icons.volume_off,
                              color: Colors.white,
                            )),
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
                                            AssetImage('assets/india.jpg'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'IND',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '29-0',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
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
                          height: 2,
                          width: 400,
                          color: Colors.blueGrey[500],
                        ),
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
                        )
                      ],
                    ),
                  ),
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/virat.jpg'),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'V Kohli',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '120 (60)  *',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/jasprit.jpg'),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'J Bumrah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '10 (6)  *',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      height: 110,
                      width: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/m_nawaz.png'),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'M Nawaz',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '22-6 (4.2)  *',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 1,
                width: 320,
                color: Colors.blueGrey[500],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   radius: 18,

                      // )

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          '0',
                          style: TextStyle(color: Colors.white),
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
                        width: 5,
                      ),

                      Text(
                        '10',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 28,
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Over 82',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          '6',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFF4D00),
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          'W',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          '0',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        alignment: Alignment.center,
                        height: 22,
                        width: 22,
                        child: Text(
                          'NB',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 1,
                width: 320,
                color: Colors.blueGrey[500],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  'The oldest classcical British and Latin writing had little or no spance between world and could be written in (alterneting derections).',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
