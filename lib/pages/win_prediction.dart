// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: camel_case_types
class win_prediction extends StatefulWidget {
  const win_prediction({super.key});

  @override
  State<win_prediction> createState() => _win_predictionState();
}

// ignore: camel_case_types
class _win_predictionState extends State<win_prediction> {
  int _value = 0;

  bool status = false;
  bool status2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background.jpeg",
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 35, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Real-time Win Probability ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 1,
                width: 350,
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'Select a view of your choice',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFFFF4D00)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStatePropertyAll(Colors.white),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 1;
                        });
                      }),
                  Text(
                    'Win Percentage View',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.grey,
                    size: 15,
                  )
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 40),
              height: 60,
              width: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'PAK 25%',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'DRAW 35%',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'IND 40%',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 60,
                        color: Colors.orangeAccent,
                      ),
                      Container(
                        height: 10,
                        width: 85,
                        color: Colors.green[900],
                      ),
                      Container(
                        height: 10,
                        width: 95,
                        color: Colors.blue,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Radio(
            //     fillColor: MaterialStatePropertyAll(Colors.white),
            //     value: 2,
            //     groupValue: _value,
            //     onChanged: (value) {
            //       setState(() {
            //         _value = 2;
            //       });
            //     }),

            // Container(
            //   height: 20,
            //   width: 20,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.amber)),
            // )

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStatePropertyAll(Colors.white),
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 2;
                        });
                      }),
                  Text(
                    'Number View',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.grey,
                    size: 15,
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PAK',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFFF4D00),
                    ),
                    child: Text(
                      '17',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                    ),
                    child: Text(
                      '17.5',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Container(
                    height: 35,
                    width: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'IND',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFFF4D00),
                    ),
                    child: Text(
                      '17',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                    ),
                    child: Text(
                      '17.5',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),
            Container(
              height: 1,
              width: 350,
              color: Colors.white,
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'Realtime Score Projection',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFFFF4D00)),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Mid Ov Score Projection',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                  Switch(
                    activeColor: Colors.blueGrey,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    value: status,
                    onChanged: (value) {
                      // ignore: avoid_print
                      print("VALUE : $value");
                      setState(() {
                        status = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.center,
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '50 Ov Runs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NO',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'YES',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Full Match Score Projection',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Switch(
                    activeColor: Colors.blueGrey,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    value: status2,
                    onChanged: (value) {
                      // ignore: avoid_print
                      print("VALUE : $value");
                      setState(() {
                        status2 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '100 Ov Runs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NO',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'YES',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
