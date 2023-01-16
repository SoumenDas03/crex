// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class info_morematchespage extends StatefulWidget {
  const info_morematchespage({super.key});

  @override
  State<info_morematchespage> createState() => _info_morematchespageState();
}

class _info_morematchespageState extends State<info_morematchespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background.jpeg',
                ),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 40),
                      child: Text(
                        'IND vs PAK Matches',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 170, top: 40),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 380,
                  color: Color.fromARGB(255, 124, 122, 122),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // ignore: prefer_const_literals_to_create_immutables
                      stops: [
                        0.5,
                        0.8,
                      ],
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color.fromARGB(255, 230, 98, 42),
                        Color.fromARGB(255, 246, 75, 1),
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          backgroundImage: AssetImage('assets/matchlogo 1.png'),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'IND vs PAK,2022',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 246, 242, 242)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6, right: 25),
                            child: Text(
                              '04 Dec - 26 Dec',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 246, 242, 242)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 140, top: 15),
                        child: Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 120,
                        width: 330,
                        color: Colors.blueGrey[900],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                '1st ODI on 06 Dec',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 1,
                              width: 380,
                              color: Color.fromARGB(255, 124, 122, 122),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage:
                                        AssetImage('assets/india.png'),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    'PAK',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    '300 - 9',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  height: 16,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 45,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    '42.3',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 165, 163, 163),
                                        fontSize: 10),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  margin: EdgeInsets.only(left: 15, top: 20),
                                  child: Text(
                                    'IND Won',
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage:
                                        AssetImage('assets/india.png'),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    'PAK',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    '300 - 9',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  height: 16,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 45,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    '42.3',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 165, 163, 163),
                                        fontSize: 10),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'by 3 Wicket',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontSize: 9),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 120,
                        width: 330,
                        color: Colors.blueGrey[900],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                '3rd ODI on 10 Dec',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 1,
                              width: 380,
                              color: Color.fromARGB(255, 124, 122, 122),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 15),
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage:
                                                AssetImage('assets/india.png'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 5, top: 15),
                                          child: Text(
                                            'IND',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage:
                                                AssetImage('assets/india.png'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 5, top: 10),
                                          child: Text(
                                            'PAK',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 100, top: 13),
                                  height: 60,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 50),
                                      child: Text(
                                        'Starts from',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 47, top: 3),
                                      child: Text(
                                        '11:30 AM',
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 18),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       margin: EdgeInsets.only(left: 10, top: 10),
                            //       child: CircleAvatar(
                            //         radius: 10,
                            //         backgroundImage: AssetImage('assets/indialogo.png'),
                            //       ),
                            //     ),
                            //     Container(
                            //       margin: EdgeInsets.only(left: 5, top: 10),
                            //       child: Text(
                            //         'PAK',
                            //         style: TextStyle(color: Colors.white, fontSize: 11),
                            //       ),
                            //     ),

                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Opacity(
                      opacity: 0.8,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color: Colors.blueGrey[900],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('assets/matchlogo 1.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 225,
                                      margin:
                                          EdgeInsets.only(top: 20, left: 10),
                                      child: Text(
                                        'ICC WC,2022',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 25),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6, right: 170),
                                  child: Text(
                                    '30 May - 14 Jul',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
