// ignore_for_file: file_names

import 'package:crex/dashboard/fixtures_dashboard.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/fixtures_selectteam.dart';
import 'package:crex/pages/fixtures_series.dart';
import 'package:crex/pages/more.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class fixtures_addTeam extends StatefulWidget {
  const fixtures_addTeam({super.key});

  @override
  State<fixtures_addTeam> createState() => _fixtures_addTeamState();
}

// ignore: camel_case_types
class _fixtures_addTeamState extends State<fixtures_addTeam> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        // ignore: prefer_const_constructors

        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: const Color(0xFFFF4D00),
        //   title: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: SizedBox(
        //       width: 325,
        //       height: 50,
        //       child: DefaultTabController(
        //         length: 3,
        //         child: Padding(
        //           padding: const EdgeInsets.all(5),
        //           child: TabBar(
        //               // ignore: prefer_const_constructors
        //               labelPadding: EdgeInsets.all(5),
        //               indicator: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(25)),
        //               unselectedLabelColor: Colors.white,
        //               labelColor: Colors.black,
        //               // ignore: prefer_const_literals_to_create_immutables
        //               tabs: [
        //                 // ignore: prefer_const_constructors
        //                 Text(
        //                   "Cricket",
        //                   // ignore: prefer_const_constructors
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 15),
        //                 ),
        //                 // ignore: prefer_const_constructors
        //                 Text(
        //                   "Football",
        //                   // ignore: prefer_const_constructors
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 15),
        //                 ),
        //                 // ignore: prefer_const_constructors
        //                 Text(
        //                   "Tennis",
        //                   // ignore: prefer_const_constructors
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 15),
        //                 ),
        //               ]),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
            fit: BoxFit.fill,
          )),
          child: Column(children: [
            // DefaultTabController(
            //   initialIndex: 2,
            //   length: 3,
            //   child: Row(
            //     children: [
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         // ignore: prefer_const_constructors
            //         margin: EdgeInsets.only(left: 20),
            //         // alignment: Alignment.center,

            //         width: 200,
            //         height: 45,

            //         // ignore: prefer_const_constructors
            //         child: TabBar(
            //             // ignore: prefer_const_constructors
            //             indicatorColor: Color(0xFFFF4D00),
            //             indicatorWeight: 2,
            //             // indicatorSize: TabBarIndicatorSize.label,
            //             // padding: EdgeInsets.only(right: 2),
            //             // ignore: prefer_const_constructors
            //             labelPadding: EdgeInsets.all(0),
            //             unselectedLabelColor: Colors.white,
            //             // ignore: prefer_const_constructors
            //             labelColor: Color(0xFFFF4D00),
            //             // ignore: prefer_const_constructors
            //             labelStyle: TextStyle(
            //                 fontSize: 12.0, fontWeight: FontWeight.bold),
            //             // ignore: prefer_const_literals_to_create_immutables
            //             tabs: [
            //               // ignore: prefer_const_constructors
            //               InkWell(
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) =>
            //                             const fixtures_dashboard(),
            //                       ));
            //                 },
            //                 child: const Tab(
            //                   text: ('Day'),
            //                 ),
            //               ),
            //               InkWell(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                           builder: (context) =>
            //                               const fixtures_series(),
            //                         ));
            //                   },
            //                   child: const Text("Series")),
            //               InkWell(
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) =>
            //                             const fixtures_addTeam(),
            //                       ));
            //                 },
            //                 child: const Text("My Team"),
            //               ),
            //             ]),
            //       ),
            //       // ignore: prefer_const_constructors
            //       SizedBox(
            //         width: 90,
            //       ),
            //       Container(
            //           // ignore: prefer_const_constructors
            //           margin: EdgeInsets.only(top: 20),
            //           child: InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) =>
            //                             const fixtures_dashboard()));
            //               },
            //               child: Image.asset("assets/three_line.png")))
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 1,
            //   width: 350,
            //   color: Colors.greenAccent,
            // ),
            // DefaultTabController(
            //   length: 7,
            //   child: Container(
            //     // ignore: prefer_const_constructors
            //     margin: EdgeInsets.only(
            //       top: 20,
            //     ),
            //     alignment: Alignment.center,
            //     //margin: EdgeInsets.only(left: 10),
            //     width: 320,
            //     height: 45,
            //     // ignore: prefer_const_constructors
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         // ignore: prefer_const_constructors
            //         borderRadius: BorderRadius.only(
            //             // ignore: prefer_const_constructors
            //             topRight: Radius.circular(10),
            //             // ignore: prefer_const_constructors
            //             topLeft: Radius.circular(10))),
            //     // ignore: prefer_const_constructors
            //     child: TabBar(
            //         // ignore: prefer_const_constructors
            //         indicatorColor: Color(0xFFFF4D00),
            //         indicatorWeight: 3,
            //         // indicatorSize: TabBarIndicatorSize.label,
            //         // ignore: prefer_const_constructors
            //         padding: EdgeInsets.only(right: 10),
            //         // ignore: prefer_const_constructors
            //         labelPadding: EdgeInsets.all(0),
            //         unselectedLabelColor: Colors.black,
            //         // ignore: prefer_const_constructors
            //         labelColor: Color(0xFFFF4D00),
            //         labelStyle:
            //             // ignore: prefer_const_constructors
            //             TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            //         // ignore: prefer_const_literals_to_create_immutables
            //         tabs: [
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('All'),
            //           ),
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('Men'),
            //           ),
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('T20'),
            //           ),
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('ODI'),
            //           ),
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('International'),
            //           ),
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('Test'),
            //           ),
            //           // ignore: prefer_const_constructors
            //           Tab(
            //             text: ('League'),
            //           ),
            //         ]),
            //   ),
            // ),
            // ignore: prefer_const_constructors
            // SizedBox(
            //   height: 75,
            // ),
            // ignore: prefer_const_constructors

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  Image.asset(
                    "assets/addteam.png",
                    color: Colors.white,
                  ),
                  // ignore: prefer_const_constructors
                  Positioned(
                      top: 70,
                      left: 60,
                      // ignore: prefer_const_constructors
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        // ignore: prefer_const_constructors
                        child: Text(
                          "+",
                          // ignore: prefer_const_constructors
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ))
                ]),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,

                  height: 50,
                  width: 225,
                  // ignore: prefer_const_constructors
                  child: Text(
                    textAlign: TextAlign.center,
                    "Add your fav teams here to see all of their matches",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey[900],
                          // ignore: prefer_const_constructors
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //border radius equal to or more than 50% of width
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const fixtures_selectteam(),
                            ));
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        "+ Add teams",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                ),
              ],
            ),
          ]),
        ),
        // bottomNavigationBar: Container(
        //   height: 75,
        //   color: Colors.black,
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         bottom: 0,
        //         child: ClipRRect(
        //           // ignore: prefer_const_constructors
        //           borderRadius: BorderRadius.only(
        //               // ignore: prefer_const_constructors
        //               topRight: Radius.circular(20),
        //               // ignore: prefer_const_constructors
        //               topLeft: Radius.circular(20)),
        //           child: Container(
        //             height: 45,
        //             width: MediaQuery.of(context).size.width,
        //             color: const Color(0xFFFF4D00),
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         bottom: 20,
        //         left: 10,
        //         child: Row(
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => const home_dashboard(),
        //                 ));
        //               },
        //               child: Container(
        //                 // ignore: prefer_const_constructors
        //                 margin: EdgeInsets.only(left: 17),
        //                 child: Column(
        //                   // ignore: prefer_const_literals_to_create_immutables
        //                   children: [
        //                     // ignore: prefer_const_constructors
        //                     CircleAvatar(
        //                       backgroundColor: Colors.white,
        //                       // ignore: prefer_const_constructors
        //                       child: Icon(
        //                         Icons.home,
        //                         color: Colors.black,
        //                       ),
        //                     ),
        //                     // ignore: prefer_const_constructors
        //                     Text(
        //                       'Home',
        //                       // ignore: prefer_const_constructors
        //                       style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w500),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             InkWell(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => const series_dashboard(),
        //                 ));
        //               },
        //               child: Container(
        //                 // ignore: prefer_const_constructors
        //                 margin: EdgeInsets.only(left: 23),
        //                 child: Column(
        //                   children: [
        //                     CircleAvatar(
        //                       backgroundColor: Colors.white,
        //                       child: Image.asset(
        //                         'assets/series.png',
        //                         scale: 1.2,
        //                         color: Colors.black,
        //                       ),
        //                     ),
        //                     // ignore: prefer_const_constructors
        //                     Text(
        //                       'Series',
        //                       // ignore: prefer_const_constructors
        //                       style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w500),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             InkWell(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => const matches_dashboard(),
        //                 ));
        //               },
        //               child: Container(
        //                 // ignore: prefer_const_constructors
        //                 margin: EdgeInsets.only(left: 23),
        //                 child: Column(
        //                   children: [
        //                     CircleAvatar(
        //                       backgroundColor: Colors.white,
        //                       child: Image.asset(
        //                         'assets/matches.png',
        //                         scale: 1.2,
        //                         color: Colors.black,
        //                       ),
        //                     ),
        //                     // ignore: prefer_const_constructors
        //                     Text(
        //                       'Matches',
        //                       // ignore: prefer_const_constructors
        //                       style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w500),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             InkWell(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => const fixtures_dashboard(),
        //                 ));
        //               },
        //               child: Container(
        //                 // ignore: prefer_const_constructors
        //                 margin: EdgeInsets.only(left: 23),
        //                 child: Column(
        //                   children: [
        //                     CircleAvatar(
        //                       backgroundColor: Colors.white,
        //                       child: Image.asset(
        //                         'assets/fixtures.png',
        //                         scale: 1.2,
        //                         color: const Color(0xFFFF4D00),
        //                       ),
        //                     ),
        //                     // ignore: prefer_const_constructors
        //                     Text(
        //                       'Fixtures',
        //                       // ignore: prefer_const_constructors
        //                       style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w500),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             InkWell(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => const more(),
        //                 ));
        //               },
        //               child: Container(
        //                 // ignore: prefer_const_constructors
        //                 margin: EdgeInsets.only(left: 23),
        //                 child: Column(
        //                   children: [
        //                     CircleAvatar(
        //                       backgroundColor: Colors.white,
        //                       child: Image.asset(
        //                         'assets/more.png',
        //                         scale: 1.2,
        //                         color: Colors.black,
        //                       ),
        //                     ),
        //                     // ignore: prefer_const_constructors
        //                     Text(
        //                       'More',
        //                       // ignore: prefer_const_constructors
        //                       style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w500),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
