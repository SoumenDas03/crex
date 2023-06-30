// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class fixtures_series extends StatefulWidget {
  const fixtures_series({super.key});

  @override
  State<fixtures_series> createState() => _fixtures_seriesState();
}

// ignore: camel_case_types
class _fixtures_seriesState extends State<fixtures_series> {
  var map, data;

  Future<void> apiFetch() async {
    var status = true;

    await Future.wait([getSeriesList()]).then((v) {
      for (var item in v) {
        print('$item \n');
      }
    }).whenComplete(() {
      status = false;
    });

    print(status == true ? 'Loading' : 'FINISHED');
  }

  Future getSeriesList() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.cricapi.com/v1/series?apikey=a8ee5579-8994-41ba-af5d-4e2fcd2e9e91&offset=0'),
      );

      map = jsonDecode(response.body.toString());
      data = map["data"];
      if (response.statusCode == 200) {
        return data;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // ignore: prefer_const_constructors
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: FutureBuilder(
            future: apiFetch(),
            builder: (context, snapshot) {
              if (data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: isDarkMode
                            ? const AssetImage('assets/background.jpeg')
                            : const AssetImage("assets/bgLightMode.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 450,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_constructors
                                    CircleAvatar(
                                      radius: 25,
                                      // ignore: prefer_const_constructors
                                      backgroundImage:
                                          // ignore: prefer_const_constructors
                                          AssetImage('assets/matchlogo 1.png'),
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Container(
                                          width: 265,
                                          child: Text(
                                            data[index]["name"],
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "${DateFormat.yMMMEd().format(DateTime.parse(data[index]["startDate"]))}-" +
                                              data[index]["endDate"],
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
