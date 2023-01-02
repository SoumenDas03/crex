// ignore_for_file: unused_import

import 'package:crex/pages/commentary.dart';
import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/dashboard.dart';
import 'package:crex/pages/fixtures.dart';
import 'package:crex/pages/fixtures_addTeam.dart';
import 'package:crex/pages/fixtures_calender.dart';
import 'package:crex/pages/fixtures_filter.dart';
import 'package:crex/pages/fixtures_pin.dart';
import 'package:crex/pages/fixtures_series.dart';
import 'package:crex/pages/football_home.dart';
import 'package:crex/pages/live_india.dart';
import 'package:crex/pages/live_match.dart';
import 'package:crex/pages/live_pak.dart';
import 'package:crex/pages/match_settings.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/more.dart';
import 'package:crex/pages/scorecard.dart';
import 'package:crex/pages/series.dart';
import 'package:crex/pages/speech_settings.dart';
import 'package:crex/pages/tennis_home.dart';
import 'package:crex/pages/win_prediction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const scorecard(),
    );
  }
}
