// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class latestSquads_pointsTable extends StatefulWidget {
  const latestSquads_pointsTable({super.key});

  @override
  State<latestSquads_pointsTable> createState() =>
      _latestSquads_pointsTableState();
}

class _latestSquads_pointsTableState extends State<latestSquads_pointsTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  itemCount: 9,
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
                                          AssetImage("assets/india.png"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'INDIA',
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
                                  '3',
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
                                width:20,
                                child: Text(
                                  '6',
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
                                  '6',
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
                                  '6',
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
                                  '60',
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
      ),
    );
  }
}
