// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:floating/floating.dart';
import 'package:flutter/material.dart';

class pipPage extends StatefulWidget {
  const pipPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<pipPage> createState() => _pipPageState();
}

class _pipPageState extends State<pipPage> with WidgetsBindingObserver {
  final floating = Floating();
  var map, data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
  //   if (lifecycleState == AppLifecycleState.inactive) {
  //     floating.enable(aspectRatio: Rational.square());
  //   }
  // }

  Future<void> enablePip(BuildContext context) async {
    final rational = const Rational(16, 12);
    final screenSize =
        MediaQuery.of(context).size * MediaQuery.of(context).devicePixelRatio;

    final status = await floating.enable(
      aspectRatio: rational,
      sourceRectHint: Rectangle<int>(
        0,
        0,
        screenSize.width.toInt(),
        screenSize.width ~/ rational.aspectRatio,
      ),
    );
    debugPrint('PiP enabled? $status');
  }

  getSingleCricketMatchDetails() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/match_scorecard?apikey=272ffee7-f333-43bd-babc-f9e045d698d3&id=${widget.id}'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];

      if (response.statusCode == 200) {
        return data;
        // ignore: use_build_context_synchronously
      } else {
        // ignore: avoid_print
        print('failed');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    enablePip(context);
    return FutureBuilder(
      future: getSingleCricketMatchDetails(),
      builder: (context, snapshot) {
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return PiPSwitcher(
            childWhenEnabled: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: Colors.black45,
                    ),
                    height: 30,
                    width: 125,
                    child: Center(
                      child: Text(
                        '${data["teamInfo"][0]["shortname"]} vs ${data["teamInfo"][1]["shortname"]}',
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(data["score"]
                                                      [data["score"].length - 1]
                                                  ["inning"]
                                              .substring(
                                                  0,
                                                  (data["score"][data["score"].length - 1]["inning"].indexOf(" ") != -1)
                                                      ? data["score"][data["score"].length - 1]["inning"]
                                                          .indexOf(" ")
                                                      : data["score"][data["score"].length - 1]["inning"]
                                                          .length) ==
                                          data["teamInfo"][0]["name"].substring(
                                              0,
                                              (data["teamInfo"][0]["name"].indexOf(" ") != -1)
                                                  ? data["teamInfo"][0]["name"].indexOf(" ")
                                                  : data["teamInfo"][0]["name"].length)
                                      ? data["teamInfo"][0]["img"]
                                      : data["teamInfo"][1]["img"]),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${data["score"][data["score"].length - 1]["r"]}-${data["score"][data["score"].length - 1]["w"]}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            data["score"][data["score"].length -
                                                    1]["o"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                                decoration: TextDecoration.none,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "CRR: " +
                                          (data["score"][data["score"].length -
                                                      1]["r"] /
                                                  data["score"][
                                                      data["score"].length -
                                                          1]["o"])
                                              .toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          decoration: TextDecoration.none,
                                          color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, top: 2),
                            width: 200,
                            child: Text(
                              data["status"],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            childWhenDisabled: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(163, 17, 17, 17),
                title: const Text("Go Back to Live Page"),
              ),
              body: Container(
                margin: const EdgeInsets.only(top: 350),
                child: Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Refreshing Current Score",
                        style: TextStyle(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
