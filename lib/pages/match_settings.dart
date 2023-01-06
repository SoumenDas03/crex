// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace

import 'package:crex/pages/speech_settings.dart';
import 'package:crex/pages/win_prediction.dart';
import 'package:flutter/material.dart';

class match_settings extends StatefulWidget {
  const match_settings({super.key});

  @override
  State<match_settings> createState() => _match_settingsState();
}

class _match_settingsState extends State<match_settings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
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
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                // alignment: Alignment.topLeft,
                //margin: EdgeInsets.only(left: 10),
                width: 350,
                height: 50,

                // ignore: prefer_const_constructors
                child: TabBar(
                    indicatorColor: Color(0xFFFF4D00),
                    // indicatorWeight: 3,
                    // indicatorSize: TabBarIndicatorSize.label,
                    padding: EdgeInsets.only(left: 10),
                    labelPadding: EdgeInsets.only(right: 0),
                    unselectedLabelColor: Colors.white,
                    labelColor: Color(0xFFFF4D00),
                    labelStyle:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      // ignore: prefer_const_constructors

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
                        text: ('Graph'),
                      ),
                      Tab(
                        text: ('Series'),
                      ),
                      Tab(
                        text: ('Status'),
                      ),
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
                  width: 350,
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
                                            AssetImage('assets/pakistan.jpg'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'PAK',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '140-3',
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
                                            '18.3',
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
                                '6',
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
                              'CCR : ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.5),
                            ),
                            Text(
                              '9.58',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'RRR : ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.5),
                            ),
                            Text(
                              '2.58',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Target : ',
                              style: TextStyle(
                                  color: Color(0xFFFF4D00), fontSize: 12.5),
                            ),
                            Text(
                              '340',
                              style: TextStyle(
                                  color: Color(0xFFFF4D00), fontSize: 12.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'assets/live_tv.png',
                              width: 75,
                            )
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
                          'Over 18',
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
                          'Over 19',
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
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 350,
                color: Colors.white,
                child: Text(
                  'PAK need 200 runs in 183 balls',
                  style: TextStyle(
                      color: Color(0xFFFF4D00),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white, width: 0.5)

                    color: Colors.blueGrey[900],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PAKISTAN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 25,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'PAK',
                                style: TextStyle(
                                    color: Color(0xFFFF4D00),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.sports_cricket_sharp,
                                size: 15,
                                color: Color(0xFFFF4D00),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          // border: Border.all(
                          //     color: Colors.white, width: 0.5)

                          color: Colors.black45,
                        ),
                        child: Text(
                          '16',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            // border: Border.all(
                            //     color: Colors.white, width: 0.5)

                            color: Colors.white),
                        child: Text(
                          '22',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'View',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white, width: 0.5)

                    color: Colors.blueGrey[900],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '20 Ov Runs',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                // border: Border.all(
                                //     color: Colors.white, width: 0.5)

                                color: Colors.black45,
                              ),
                              child: Text(
                                'NO 79',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5),
                                  // border: Border.all(
                                  //     color: Colors.white, width: 0.5)

                                  color: Colors.white),
                              child: Text(
                                'YES 200',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 1,
                          width: 325,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Open 150',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Min 120',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Max 150',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            '10 runs in 9 balls',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Batter',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      Text(
                        'R',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'B',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '4s',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '6s',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'SR',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                width: 350,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(0),
                  // border: Border.all(color: Colors.white, width: 0.5)

                  color: Colors.blueGrey[900],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Babar Azam(Captain)',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            '19',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '7',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '89.98',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 350,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(0),
                        // border: Border.all(color: Colors.white, width: 0.5)

                        color: Colors.black45,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Fawad Alam',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.sports_cricket,
                                color: Color(0xFFFF4D00)),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '8',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '49.98',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 1.5,
                      width: 350,
                      color: Colors.white54,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "P'ship : 58(30)",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bowler',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 135,
                      ),
                      Text(
                        'O',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'M',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'R',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'W',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Eco',
                        style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(0),
                  // border: Border.all(color: Colors.white, width: 0.5)

                  color: Colors.blueGrey[900],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Jasprit Bumrah',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            '2.0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '30',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '7.60',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white, width: 0.5)

                    color: Colors.blueGrey[900],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Who will win ?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[100]),
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Text(
                              'Total Votes:2,25,222',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey[100]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 1,
                          width: 325,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              // border: Border.all(
                              //     color: Colors.white, width: 0.5)

                              color: Colors.amber,
                            ),
                            child: Text(
                              'IND',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.5),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Text('DRAW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.5),
                                // border: Border.all(
                                //     color: Colors.white, width: 0.5)

                                color: Colors.green),
                            child: Text(
                              'PAK',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 90,
                width: 335,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(color: Colors.white, width: 0.5)

                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PAK *',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            'IND',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Batting',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF4D00),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.sports_cricket,
                          size: 18,
                          color: Color(0xFFFF4D00),
                        ),
                        SizedBox(
                          width: 135,
                        ),
                        Text(
                          '340-5/',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '100',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 335,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(color: Colors.white, width: 0.5)

                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Share Score',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 180,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    // border: Border.all(color: Colors.white, width: 0.5)
                    color: Colors.blueGrey[900],
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Match Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.blueGrey[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const win_prediction(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.propane,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Win Probability View',
                                  style: TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const speech_settings(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.album,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Speech Settings (Accessibility)',
                                    style: TextStyle(color: Colors.white70))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // showModalBottomSheet(
                              //     isScrollControlled: true,
                              //     // shape: RoundedRectangleBorder(
                              //     //   borderRadius: BorderRadiusDirectional.only(
                              //     //       topStart: Radius.circular(45), topEnd: Radius.circular(45)),
                              //     // ),
                              //     elevation: 5,
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return StatefulBuilder(
                              //           builder: (context, setState) {
                              //         return SizedBox(
                              //           height: 375,
                              //           child: DefaultTabController(
                              //             length: 2,
                              //             child: Scaffold(
                              //               appBar: AppBar(
                              //                 backgroundColor: Colors.black,
                              //                 automaticallyImplyLeading: false,
                              //                 title: TabBar(
                              //                   // labelColor: Colors.amber,
                              //                   indicatorColor:
                              //                       Color(0xFFFF4D00),
                              //                   tabs: [
                              //                     Tab(
                              //                       text: "Live Match",
                              //                     ),
                              //                     Tab(text: "Series Updates"),
                              //                   ],
                              //                 ),
                              //                 actions: [
                              //                   Padding(
                              //                     padding:
                              //                         const EdgeInsets.all(10),
                              //                     child: IconButton(
                              //                         onPressed: () {
                              //                           Navigator.pop(context);
                              //                         },
                              //                         icon: Icon(
                              //                           Icons.close,
                              //                           color: Colors.white,
                              //                         )),
                              //                   )
                              //                 ],
                              //               ),
                              //               body: Container(
                              //                 color: Colors.black,
                              //                 child: TabBarView(
                              //                   children: [
                              //                     Column(
                              //                       children: [
                              //                         Row(
                              //                           mainAxisAlignment:
                              //                               MainAxisAlignment
                              //                                   .center,
                              //                           children: [
                              //                             // ignore: prefer_const_constructors
                              //                             Container(
                              //                               margin:
                              //                                   EdgeInsets.only(
                              //                                       left: 25),
                              //                               width: 200,
                              //                               child: Text(
                              //                                 "IND vs PAK Notifications",
                              //                                 // ignore: prefer_const_constructors
                              //                                 style: TextStyle(
                              //                                     color: Colors
                              //                                         .white),
                              //                               ),
                              //                             ),
                              //                             // ignore: prefer_const_constructors
                              //                             SizedBox(
                              //                               width: 75,
                              //                             ),
                              //                             Switch(
                              //                               activeColor:
                              //                                   Colors.blueGrey,
                              //                               activeTrackColor:
                              //                                   Colors.grey,
                              //                               inactiveThumbColor:
                              //                                   Colors.white,
                              //                               inactiveTrackColor:
                              //                                   Colors.grey,
                              //                               value: status,
                              //                               onChanged: (value) {
                              //                                 // ignore: avoid_print
                              //                                 print(
                              //                                     "VALUE : $value");
                              //                                 setState(() {
                              //                                   status = value;
                              //                                 });
                              //                               },
                              //                             ),
                              //                           ],
                              //                         ),
                              //                         SizedBox(
                              //                           height: 10,
                              //                         ),
                              //                         Container(
                              //                           alignment:
                              //                               Alignment.center,
                              //                           height: 200,
                              //                           child: ListView.builder(
                              //                               scrollDirection:
                              //                                   Axis.horizontal,
                              //                               itemCount: 5,
                              //                               itemBuilder:
                              //                                   (context,
                              //                                       index) {
                              //                                 return Column(
                              //                                   children: [
                              //                                     Container(
                              //                                       // ignore: prefer_const_constructors
                              //                                       margin: EdgeInsets.only(
                              //                                           left:
                              //                                               20,
                              //                                           right:
                              //                                               10,
                              //                                           top:
                              //                                               25),
                              //                                       child:
                              //                                           Stack(
                              //                                         clipBehavior:
                              //                                             Clip.none,
                              //                                         children: [
                              //                                           Container(
                              //                                             transform:
                              //                                                 Matrix4.rotationX(0),
                              //                                             height:
                              //                                                 125,
                              //                                             width:
                              //                                                 125,
                              //                                             // padding: EdgeInsets.symmetric(
                              //                                             //     vertical: 1, horizontal: 1),
                              //                                             decoration:
                              //                                                 BoxDecoration(
                              //                                               border:
                              //                                                   Border.all(color: Colors.blue),
                              //                                               color:
                              //                                                   Colors.black,
                              //                                               borderRadius:
                              //                                                   BorderRadius.circular(25),
                              //                                               boxShadow: [
                              //                                                 BoxShadow(
                              //                                                   color: Colors.white38.withOpacity(0.5),
                              //                                                   offset: Offset(0, -5),
                              //                                                   // blurRadius: 5,
                              //                                                   spreadRadius: 1,
                              //                                                 )
                              //                                               ],
                              //                                             ),
                              //                                             child:
                              //                                                 Container(
                              //                                               margin:
                              //                                                   EdgeInsets.all(12),
                              //                                               child:
                              //                                                   Image.asset(
                              //                                                 'assets/tennis_background.jpeg',
                              //                                               ),
                              //                                             ),
                              //                                           ),
                              //                                           Positioned(
                              //                                             bottom:
                              //                                                 120,
                              //                                             left:
                              //                                                 85,
                              //                                             child:
                              //                                                 CircleAvatar(
                              //                                               backgroundColor:
                              //                                                   Colors.amber,
                              //                                               radius:
                              //                                                   12,
                              //                                               child:
                              //                                                   Icon(
                              //                                                 Icons.done,
                              //                                                 size: 12,
                              //                                               ),
                              //                                             ),
                              //                                           ),
                              //                                         ],
                              //                                       ),
                              //                                     ),
                              //                                     SizedBox(
                              //                                       height: 8,
                              //                                     ),
                              //                                     Container(
                              //                                       width: 100,

                              //                                       // ignore: prefer_const_constructors
                              //                                       child: Text(
                              //                                         textAlign:
                              //                                             TextAlign
                              //                                                 .center,
                              //                                         "Weckets",
                              //                                         style: TextStyle(
                              //                                             color: Colors
                              //                                                 .white,
                              //                                             fontSize:
                              //                                                 18),
                              //                                       ),
                              //                                     )
                              //                                   ],
                              //                                 );
                              //                               }),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                     Column(
                              //                       children: [
                              //                         Row(
                              //                           mainAxisAlignment:
                              //                               MainAxisAlignment
                              //                                   .center,
                              //                           children: [
                              //                             // ignore: prefer_const_constructors
                              //                             Container(
                              //                               margin:
                              //                                   EdgeInsets.only(
                              //                                       left: 25),
                              //                               width: 200,
                              //                               child: Text(
                              //                                 "INDIA tour of PAKISTAN 2022 Notifications",
                              //                                 // ignore: prefer_const_constructors
                              //                                 style: TextStyle(
                              //                                     color: Colors
                              //                                         .white),
                              //                               ),
                              //                             ),
                              //                             // ignore: prefer_const_constructors
                              //                             SizedBox(
                              //                               width: 75,
                              //                             ),
                              //                             Switch(
                              //                               activeColor:
                              //                                   Colors.blueGrey,
                              //                               activeTrackColor:
                              //                                   Colors.grey,
                              //                               inactiveThumbColor:
                              //                                   Colors.white,
                              //                               inactiveTrackColor:
                              //                                   Colors.grey,
                              //                               value: status1,
                              //                               onChanged: (value) {
                              //                                 // ignore: avoid_print
                              //                                 print(
                              //                                     "VALUE : $value");
                              //                                 setState(() {
                              //                                   status1 = value;
                              //                                 });
                              //                               },
                              //                             ),
                              //                           ],
                              //                         ),
                              //                         SizedBox(
                              //                           height: 10,
                              //                         ),
                              //                         Container(
                              //                           alignment:
                              //                               Alignment.center,
                              //                           height: 200,
                              //                           child: ListView.builder(
                              //                               scrollDirection:
                              //                                   Axis.horizontal,
                              //                               itemCount: 5,
                              //                               itemBuilder:
                              //                                   (context,
                              //                                       index) {
                              //                                 return Column(
                              //                                   children: [
                              //                                     Container(
                              //                                       // ignore: prefer_const_constructors
                              //                                       margin: EdgeInsets.only(
                              //                                           left:
                              //                                               20,
                              //                                           right:
                              //                                               10,
                              //                                           top:
                              //                                               25),
                              //                                       child:
                              //                                           Stack(
                              //                                         clipBehavior:
                              //                                             Clip.none,
                              //                                         children: [
                              //                                           Container(
                              //                                             transform:
                              //                                                 Matrix4.rotationX(0),
                              //                                             height:
                              //                                                 125,
                              //                                             width:
                              //                                                 125,
                              //                                             // padding: EdgeInsets.symmetric(
                              //                                             //     vertical: 1, horizontal: 1),
                              //                                             decoration:
                              //                                                 BoxDecoration(
                              //                                               border:
                              //                                                   Border.all(color: Colors.blue),
                              //                                               color:
                              //                                                   Colors.black,
                              //                                               borderRadius:
                              //                                                   BorderRadius.circular(25),
                              //                                               boxShadow: [
                              //                                                 BoxShadow(
                              //                                                   color: Colors.white38.withOpacity(0.5),
                              //                                                   offset: Offset(0, -5),
                              //                                                   // blurRadius: 5,
                              //                                                   spreadRadius: 1,
                              //                                                 )
                              //                                               ],
                              //                                             ),
                              //                                             child:
                              //                                                 Container(
                              //                                               margin:
                              //                                                   EdgeInsets.all(12),
                              //                                               child:
                              //                                                   Image.asset(
                              //                                                 'assets/tennis_background.jpeg',
                              //                                               ),
                              //                                             ),
                              //                                           ),
                              //                                           Positioned(
                              //                                             bottom:
                              //                                                 120,
                              //                                             left:
                              //                                                 85,
                              //                                             child:
                              //                                                 CircleAvatar(
                              //                                               backgroundColor:
                              //                                                   Colors.amber,
                              //                                               radius:
                              //                                                   12,
                              //                                               child:
                              //                                                   Icon(
                              //                                                 Icons.done,
                              //                                                 size: 12,
                              //                                               ),
                              //                                             ),
                              //                                           ),
                              //                                         ],
                              //                                       ),
                              //                                     ),
                              //                                     SizedBox(
                              //                                       height: 8,
                              //                                     ),
                              //                                     Container(
                              //                                       width: 100,

                              //                                       // ignore: prefer_const_constructors
                              //                                       child: Text(
                              //                                         textAlign:
                              //                                             TextAlign
                              //                                                 .center,
                              //                                         "Toss",
                              //                                         style: TextStyle(
                              //                                             color: Colors
                              //                                                 .white,
                              //                                             fontSize:
                              //                                                 18),
                              //                                       ),
                              //                                     )
                              //                                   ],
                              //                                 );
                              //                               }),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         );
                              //       });
                              //     });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Notification Settings',
                                    style: TextStyle(color: Colors.white70))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ])),
              SizedBox(
                height: 100,
              )
            ]),
          ),
        ),
      ),
    );
  }

  bool status = false;

  bool status1 = false;
}
