// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class topfantasypoints extends StatefulWidget {
  const topfantasypoints({super.key});

  @override
  State<topfantasypoints> createState() => _topfantasypointsState();
}

class _topfantasypointsState extends State<topfantasypoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 50),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 50,
                  ),
                  child: const Text(
                    'Top Fantasy Points',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: 380,
              color: const Color.fromARGB(255, 91, 90, 90),
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Container(
                  // height: 650,
                  // width: 330,
                  color: const Color.fromARGB(255, 23, 21, 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 220,
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 18, top: 15),
                                  child: const Text(
                                    'Virat Kohli',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 18, top: 5),
                                  child: const Text(
                                    '165.0 pts',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 18, top: 5),
                                  child: const Text(
                                    'Batsman IND',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 20,
                          ),
                          // ignore: prefer_const_constructors
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            // ignore: prefer_const_constructors
                            child: CircleAvatar(
                              radius: 43,
                              // ignore: prefer_const_constructors
                              backgroundImage: AssetImage("assets/virat.jpg"),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1,
                        width: 380,
                        color: const Color.fromARGB(255, 91, 90, 90),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 10),
                            child: const Text(
                              'EVENT',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 120, top: 10),
                            child: const Text(
                              'ACTUAL',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 10),
                            child: const Text(
                              'POINTS',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 380,
                        color: Colors.blueGrey,
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: const Text(
                                        'Announced',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: const Text(
                                        '1',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: const Text(
                                        '8',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  width: 380,
                                  color: const Color.fromARGB(255, 91, 90, 90),
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
            ),
          ],
        ),
      ),
    );
  }
}
