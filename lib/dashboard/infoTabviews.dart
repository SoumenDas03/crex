// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_const_constructors

import 'package:crex/dashboard/fixtures_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/commentary.dart';
import 'package:crex/pages/fantasy.dart';
import 'package:crex/pages/graph.dart';
import 'package:crex/pages/info.dart';
import 'package:crex/pages/live_second.dart';
import 'package:crex/pages/more.dart';

import 'package:crex/pages/scorecard.dart';
import 'package:crex/pages/seriesstatus.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class infoTabViews extends StatefulWidget {
  const infoTabViews({Key? key, required this.id, required this.seriesId, required this.theme})
      : super(key: key);

  final String id;
  final String seriesId;
  final String theme;

  @override
  State<infoTabViews> createState() => _infoTabViewsState();
}

// ignore: camel_case_types
class _infoTabViewsState extends State<infoTabViews> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 3,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            title: TabBar(
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 12),
                labelPadding: EdgeInsets.only(right: 10),
                indicatorPadding:
                    EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                indicatorColor: Colors.black,
                labelColor: Color(0xFFFF4D00),
                unselectedLabelColor: isDarkMode ? Colors.white : Colors.black,
                tabs: const [
                  Tab(
                    text: 'Info',
                  ),
                  Tab(text: 'Fantasy'),
                  Tab(
                    text: 'Commentary',
                  ),
                  Tab(
                    text: 'Live',
                  ),
                  Tab(
                    text: 'Scorecard',
                  ),
                  Tab(
                    text: 'Graphs',
                  ),
                  Tab(
                    text: 'Series Status',
                  ),
                ]),
          ),
          body: TabBarView(
            children: <Widget>[
              info(
                id: widget.id,
                theme: widget.theme,
              ),
              fantasy(
                id: widget.id,
                theme: widget.theme,
              ),
              commententary(
                id: widget.id,
                theme: widget.theme,
              ),
              live_second(
                id: widget.id,
                theme: widget.theme,
              ),
              scorecard(
                id: widget.id,
                theme: widget.theme,
              ),
              graph(id: widget.id, theme: widget.theme,),
              seriesstatus(id: widget.id, seriesId: widget.seriesId, theme: widget.theme,),
            ],
          ),
          // bottomNavigationBar: Container(
          //   color: Colors.black,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //         // ignore: prefer_const_constructors
          //         topRight: Radius.circular(20),
          //         // ignore: prefer_const_constructors
          //         topLeft: Radius.circular(20),
          //       ),
          //       color: isDarkMode
          //           ? const Color(0xFFFF2E00)
          //           : const Color(0xFFDFDFDF),
          //     ),
          //     height: 60,
          //     child: Stack(
          //       children: [
          //         Positioned(
          //           bottom: 5,
          //           left: 10,
          //           child: Row(
          //             children: [
          //               InkWell(
          //                 onTap: null,
          //                 child: Container(
          //                   // ignore: prefer_const_constructors
          //                   margin: EdgeInsets.only(left: 17),
          //                   child: Column(
          //                     // ignore: prefer_const_literals_to_create_immutables
          //                     children: [
          //                       // ignore: prefer_const_constructors
          //                       CircleAvatar(
          //                         backgroundColor: Colors.white,
          //                         // ignore: prefer_const_constructors
          //                         child: Icon(
          //                           Icons.home,
          //                           color: const Color(0xFFFF4D00),
          //                         ),
          //                       ),
          //                       // ignore: prefer_const_constructors
          //                       Text(
          //                         'Home',
          //                         // ignore: prefer_const_constructors
          //                         style: TextStyle(
          //                             fontSize: 12,
          //                             color: isDarkMode
          //                                 ? Colors.white
          //                                 : Colors.black,
          //                             fontWeight: FontWeight.w500),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => const series_dashboard(),
          //                   ));
          //                 },
          //                 child: Container(
          //                   // ignore: prefer_const_constructors
          //                   margin: EdgeInsets.only(left: 23),
          //                   child: Column(
          //                     children: [
          //                       CircleAvatar(
          //                         backgroundColor: Colors.white,
          //                         child: Image.asset(
          //                           'assets/series.png',
          //                           color: Colors.black,
          //                           scale: 1.2,
          //                         ),
          //                       ),
          //                       // ignore: prefer_const_constructors
          //                       Text(
          //                         'Series',
          //                         // ignore: prefer_const_constructors
          //                         style: TextStyle(
          //                             fontSize: 12,
          //                             color: isDarkMode
          //                                 ? Colors.white
          //                                 : Colors.black,
          //                             fontWeight: FontWeight.w500),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => const matches_dashboard(),
          //                   ));
          //                 },
          //                 child: Container(
          //                   // ignore: prefer_const_constructors
          //                   margin: EdgeInsets.only(left: 23),
          //                   child: Column(
          //                     children: [
          //                       CircleAvatar(
          //                         backgroundColor: Colors.white,
          //                         child: Image.asset(
          //                           'assets/matches.png',
          //                           color: Colors.black,
          //                           scale: 1.2,
          //                         ),
          //                       ),
          //                       // ignore: prefer_const_constructors
          //                       Text(
          //                         'Matches',
          //                         // ignore: prefer_const_constructors
          //                         style: TextStyle(
          //                             fontSize: 12,
          //                             color: isDarkMode
          //                                 ? Colors.white
          //                                 : Colors.black,
          //                             fontWeight: FontWeight.w500),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => const fixtures_dashboard(),
          //                   ));
          //                 },
          //                 child: Container(
          //                   // ignore: prefer_const_constructors
          //                   margin: EdgeInsets.only(left: 23),
          //                   child: Column(
          //                     children: [
          //                       CircleAvatar(
          //                         backgroundColor: Colors.white,
          //                         child: Image.asset(
          //                           'assets/fixtures.png',
          //                           color: Colors.black,
          //                           scale: 1.2,
          //                         ),
          //                       ),
          //                       // ignore: prefer_const_constructors
          //                       Text(
          //                         'Fixtures',
          //                         // ignore: prefer_const_constructors
          //                         style: TextStyle(
          //                             fontSize: 12,
          //                             color: isDarkMode
          //                                 ? Colors.white
          //                                 : Colors.black,
          //                             fontWeight: FontWeight.w500),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => const more(),
          //                   ));
          //                 },
          //                 child: Container(
          //                   // ignore: prefer_const_constructors
          //                   margin: EdgeInsets.only(left: 23),
          //                   child: Column(
          //                     children: [
          //                       CircleAvatar(
          //                         backgroundColor: Colors.white,
          //                         child: Image.asset(
          //                           'assets/more.png',
          //                           color: Colors.black,
          //                           scale: 1.2,
          //                         ),
          //                       ),
          //                       // ignore: prefer_const_constructors
          //                       Text(
          //                         'More',
          //                         // ignore: prefer_const_constructors
          //                         style: TextStyle(
          //                             fontSize: 12,
          //                             color: isDarkMode
          //                                 ? Colors.white
          //                                 : Colors.black,
          //                             fontWeight: FontWeight.w500),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
