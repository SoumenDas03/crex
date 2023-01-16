// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class bestFigures extends StatefulWidget {
  const bestFigures({super.key});

  @override
  State<bestFigures> createState() => _bestFiguresState();
}

// ignore: camel_case_types
class _bestFiguresState extends State<bestFigures> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          image: DecorationImage(
        // ignore: prefer_const_constructors
        image: AssetImage(
          "assets/background.jpeg",
        ),
        fit: BoxFit.fill,
      )),
      child: Column(children: [
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors

              // ignore: prefer_const_constructors
              SizedBox(
                width: 5,
              ),
              // ignore: prefer_const_constructors
              Icon(
                Icons.arrow_circle_left,
                color: Colors.white,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 10,
              ),
              // ignore: prefer_const_constructors
              Text(
                "IND vs Pak in Series",
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          // ignore: prefer_const_constructors

          // alignment: Alignment.topLeft,
          //margin: EdgeInsets.only(left: 10),
          width: 350,
          height: 50,

          // ignore: prefer_const_constructors
          child: DefaultTabController(
            initialIndex: 5,
            length: 6,
            // ignore: prefer_const_constructors
            child: TabBar(
                isScrollable: true,
                // ignore: prefer_const_constructors
                indicatorColor: Color(0xFFFF4D00),
                // indicatorWeight: 3,
                // indicatorSize: TabBarIndicatorSize.label,
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(left: 10),
                // ignore: prefer_const_constructors
                labelPadding: EdgeInsets.only(right: 15),
                unselectedLabelColor: Colors.white,
                // ignore: prefer_const_constructors
                labelColor: Color(0xFFFF4D00),
                // ignore: prefer_const_constructors
                labelStyle:
                    // ignore: prefer_const_constructors
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  // ignore: prefer_const_constructors

                  // ignore: prefer_const_constructors
                  Tab(
                    text: ('Fantasy Points'),
                  ),
                  // ignore: prefer_const_constructors
                  Tab(
                    text: ('Most Runs'),
                  ),
                  // ignore: prefer_const_constructors
                  Tab(
                    text: ('Most Wickets'),
                  ),
                  // ignore: prefer_const_constructors
                  Tab(
                    text: ('Most Six'),
                  ),
                  const Tab(
                    text: ('Highest Score'),
                  ),
                  // ignore: prefer_const_constructors
                  Tab(
                    text: ('Best Figures'),
                  ),
                ]),
          ),
        ),
        Container(
          height: 1,
          width: 350,
          color: Colors.blueGrey,
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 25,
        ),
        DefaultTabController(
          length: 4,
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

                  height: 30, width: 75,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  // ignore: prefer_const_constructors
                  child: Tab(
                    text: ('All'),
                  ),
                ),
                // ignore: prefer_const_constructors
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 10),
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  // ignore: prefer_const_constructors
                  child: Tab(
                    text: ('Last 5 Matches'),
                  ),
                ),
                // ignore: prefer_const_constructors
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 10),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  // ignore: prefer_const_constructors
                  child: Tab(
                    text: ('at Venue'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 10),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  // ignore: prefer_const_constructors
                  child: Tab(
                    text: ('vs IND'),
                  ),
                ),
              ]),
        ),
        // ignore: prefer_const_constructors

        // ignore: prefer_const_constructors
        SizedBox(
          height: 270,
          child: ListView.builder(
              // ignore: prefer_const_constructors
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 15,
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 40,
                          // ignore: prefer_const_constructors
                          child: Text(
                            "1",
                            // ignore: prefer_const_constructors
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(fontSize: 50, color: Colors.blueGrey),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // ignore: prefer_const_constructors
                                  Text(
                                    "V. Kohli",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Text(
                                    ".",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  Container(
                                    // ignore: prefer_const_constructors
                                    margin: EdgeInsets.only(top: 5),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      "IND",
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              // ignore: prefer_const_constructors
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "912-5",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "4 Inn",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 15,
                        ),
                        // ignore: prefer_const_constructors
                        ClipOval(
                          // ignore: prefer_const_constructors
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.blueGrey,
                            // ignore: prefer_const_constructors
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,

                              // ignore: prefer_const_constructors
                              backgroundImage: AssetImage("assets/virat.jpg"),
                              // child: Icon(
                              //   Icons.person,
                              //   color: Colors.white,
                              //   size: 35,
                              // ),
                              radius: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 1,
                      width: 360,
                      color: Colors.blueGrey,
                    ),
                  ],
                );
              }),
        ),
        // ignore: prefer_const_constructors
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(left: 25),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Text(
                "Top Players",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 80,
              ),
              // ignore: prefer_const_constructors
              Text(
                "Recent Matches",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 15, color: Colors.white),
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

        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),

        SizedBox(
          width: 325,
          child: Opacity(
            opacity: 0.8,
            child: Container(
              width: 325,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey[900],
              ),

              // width: 200,

              child: Column(
                children: [
                  Container(
                    // ignore: prefer_const_constructors
                    margin: EdgeInsets.all(5),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 30,
                          // ignore: prefer_const_constructors
                          child: Text(
                            "Pos",
                            // ignore: prefer_const_constructors
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    fontSize: 13.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 5,
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 100,
                          // ignore: prefer_const_constructors
                          child: Text(
                            "Name",
                            // ignore: prefer_const_constructors
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    fontSize: 13.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 2,
                        ),
                        // ignore: prefer_const_constructors
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          // ignore: prefer_const_constructors
                          child: Text(
                            "Inn",
                            // ignore: prefer_const_constructors
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    fontSize: 13.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 2,
                        ),
                        // ignore: prefer_const_constructors

                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 2,
                        ),
                        // ignore: prefer_const_constructors
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          // ignore: prefer_const_constructors
                          child: Text(
                            "R - W",
                            // ignore: prefer_const_constructors
                            style:
                                // ignore: prefer_const_constructors
                                TextStyle(
                                    fontSize: 13.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 330,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 185,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      "1",
                                      // ignore: prefer_const_constructors
                                      style:
                                          // ignore: prefer_const_constructors
                                          TextStyle(
                                              fontSize: 13.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    width: 100,
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          "Virat Kohli",
                                          // ignore: prefer_const_constructors
                                          style:
                                              // ignore: prefer_const_constructors
                                              TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "India",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    width: 2,
                                  ),
                                  // ignore: prefer_const_constructors
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    // ignore: prefer_const_constructors
                                    child: const Text(
                                      "4",
                                      // ignore: prefer_const_constructors
                                      style:
                                          // ignore: prefer_const_constructors
                                          TextStyle(
                                              fontSize: 13.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors

                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // ignore: prefer_const_constructors
                                  Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    // ignore: prefer_const_constructors
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          "912",
                                          // ignore: prefer_const_constructors
                                          style:
                                              // ignore: prefer_const_constructors
                                              TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          " - ",
                                          // ignore: prefer_const_constructors
                                          style:
                                              // ignore: prefer_const_constructors
                                              TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "5",
                                          // ignore: prefer_const_constructors
                                          style:
                                              // ignore: prefer_const_constructors
                                              TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
