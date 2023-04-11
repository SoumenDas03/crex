// ignore_for_file: unused_import
import 'package:crex/dashboard/fixtures_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/batter_Ranking.dart';
import 'package:crex/pages/allRounder_Ranking.dart';
import 'package:crex/pages/bestFigures.dart';
import 'package:crex/pages/bestSrtikeRate.dart';
import 'package:crex/pages/bowler_Ranking.dart';
import 'package:crex/pages/commentary.dart';
import 'package:crex/pages/cricket_home.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/pages/fantasy.dart';
import 'package:crex/pages/fantasyPoints.dart';
import 'package:crex/pages/fixtures.dart';
import 'package:crex/pages/fixtures_addTeam.dart';
import 'package:crex/pages/fixtures_addteam_second.dart';
import 'package:crex/pages/fixtures_calender.dart';
import 'package:crex/pages/fixtures_filter.dart';
import 'package:crex/pages/fixtures_pin.dart';
import 'package:crex/pages/fixtures_selectteam.dart';
import 'package:crex/pages/fixtures_series.dart';
import 'package:crex/pages/football_home.dart';
import 'package:crex/pages/highestScore.dart';
import 'package:crex/pages/info.dart';
import 'package:crex/pages/infoPlaying_xi_team.dart';
import 'package:crex/dashboard/infoTabviews.dart';
import 'package:crex/pages/info_morematches.dart';
import 'package:crex/pages/latestSquads_Squads.dart';
import 'package:crex/pages/latestSquads_matches.dart';
import 'package:crex/pages/latestSquadsOverviews.dart';
import 'package:crex/pages/latestSquads_pointsTable.dart';
import 'package:crex/pages/latestSquads_testSquadsTeam.dart';
import 'package:crex/pages/latestSquards_info.dart';
import 'package:crex/pages/live_first.dart';
import 'package:crex/pages/matches_players.dart';
import 'package:crex/pages/mostRuns.dart';
import 'package:crex/pages/mostSixes.dart';
import 'package:crex/pages/mostWickets.dart';
import 'package:crex/pages/news.dart';
import 'package:crex/pages/notifications.dart';
import 'package:crex/pages/live_second.dart';
import 'package:crex/pages/match_settings.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/more.dart';
import 'package:crex/pages/notifications_main.dart';
import 'package:crex/pages/players.dart';
import 'package:crex/pages/scorecard.dart';
import 'package:crex/pages/series.dart';
import 'package:crex/pages/series_details.dart';
import 'package:crex/pages/seriesstatus.dart';
import 'package:crex/pages/singlePlayer_info.dart';
import 'package:crex/pages/singlePlayer_matches.dart';
import 'package:crex/pages/singlePlayer_news.dart';
import 'package:crex/pages/singlePlayer_overview.dart';
import 'package:crex/pages/speech_settings.dart';
import 'package:crex/pages/team_ranking.dart';
import 'package:crex/pages/tennis_home.dart';
import 'package:crex/pages/topfantasypoints.dart';
import 'package:crex/pages/win_prediction.dart';
import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      child: Builder(builder: (BuildContext context) {     
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.black,
              iconTheme: const IconThemeData(color: Colors.white)),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const home_dashboard(),   
        );
      }),
    );
  }
}
