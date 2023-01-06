import 'package:crex/pages/commentary.dart';
import 'package:crex/pages/fantasyPage.dart';
import 'package:crex/pages/infoPage.dart';
import 'package:crex/pages/live_india.dart';
import 'package:crex/pages/live_pak.dart';
import 'package:crex/pages/scorecard.dart';
import 'package:crex/pages/seriesstatus.dart';
import 'package:flutter/material.dart';

class infoTabViews extends StatefulWidget {
  const infoTabViews({super.key});

  @override
  State<infoTabViews> createState() => _infoTabViewsState();
}

class _infoTabViewsState extends State<infoTabViews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const TabBar(
              labelStyle: TextStyle(fontSize: 12),
              labelPadding: EdgeInsets.only(right: 10),
              indicatorPadding:
                  EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
              indicatorColor: Colors.black,
              labelColor: Color(0xFFFF4D00),
              unselectedLabelColor: Colors.white,
              
              tabs: [
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
                  text: 'Series Status',
                ),
                // Tab(
                //   text: 'Grephs',
                // ),
              ]),
          ),
          body:  const TabBarView(
            children: <Widget>[
              info(),
              fantasypage(),
              commententary(),
              live_india(),
              scorecard(),
              seriesstatuspage(),
            ],
        ),
      ),
    ),
    );
  }
}
