import 'dart:math';
import 'dart:ui';
import 'package:crex/dashboard/rankingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:crex/dashboard/ranking_dashboard.dart';
import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/dashboard/matches_dashboard.dart';
import 'package:crex/dashboard/series_dashboard.dart';
import 'package:crex/pages/cricket_home.dart';
import 'package:crex/pages/fixtures.dart';
import 'package:crex/pages/matches.dart';
import 'package:crex/pages/notifications_main.dart';
import 'package:crex/pages/series.dart';
import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_changer.dart';

class more extends StatefulWidget {
  const more({super.key});

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> with WidgetsBindingObserver {
  bool flag = false;
  bool isPipAvailable = false;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
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
                margin: const EdgeInsets.only(top: 50, right: 290),
                child: Text(
                  'More',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(9),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFFF4D00),
                        child: Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text(
                      'Join as Expert',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, right: 260),
                child: Text(
                  'Ranking',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Players Ranking',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: isDarkMode
                            ? Icon(
                                CupertinoIcons.person_3_fill,
                                size: 30,
                              )
                            : Icon(
                                CupertinoIcons.person_3_fill,
                                size: 30,
                              )),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Team Ranking',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, right: 260),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 15),
              //   height: 40,
              //   width: 320,
              //   color: isDarkMode
              //       ? const Color.fromARGB(255, 26, 26, 26)
              //       : Colors.white,
              //   child: Row(
              //     // ignore: prefer_const_literals_to_create_immutables
              //     children: [
              //       Padding(
              //           padding: const EdgeInsets.only(left: 10),
              //           child: isDarkMode
              //               ? Icon(
              //                   Icons.language,
              //                   size: 30,
              //                 )
              //               : Icon(
              //                   Icons.language,
              //                   size: 30,
              //                 )),
              //       const Padding(
              //         padding: EdgeInsets.only(left: 10),
              //         child: Text(
              //           'Language',
              //           style: TextStyle(
              //               fontSize: 16, fontWeight: FontWeight.w500),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const notification_main(),
                    ));
                  },
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.notifications,
                          size: 27,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Notification',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    flag == true
                        ? flag = false
                        : flag == false
                            ? flag = true
                            : false;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 40,
                  width: 320,
                  color: isDarkMode
                      ? const Color.fromARGB(255, 26, 26, 26)
                      : Colors.white,
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.mode_night_outlined,
                          size: 27,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Change Theme',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: flag,
                child: Container(
                  child: Column(
                    children: [
                      RadioListTile<ThemeMode>(
                          title: const Text('Light Mode'),
                          value: ThemeMode.light,
                          groupValue: themeChanger.themeMode,
                          onChanged: themeChanger.setTheme),
                      RadioListTile<ThemeMode>(
                          title: const Text('Dark Mode'),
                          value: ThemeMode.dark,
                          groupValue: themeChanger.themeMode,
                          onChanged: themeChanger.setTheme),
                      RadioListTile<ThemeMode>(
                          title: const Text('System Mode'),
                          value: ThemeMode.system,
                          groupValue: themeChanger.themeMode,
                          onChanged: themeChanger.setTheme),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, right: 260),
                child: Text(
                  'Support',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.chat_bubble,
                          size: 30,
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Feedback',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, right: 260),
                child: Text(
                  'About Us',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: isDarkMode
                          ? Image.asset(
                              'assets/contact.png',
                              scale: 2,
                            )
                          : Image.asset(
                              'assets/contact.png',
                              color: Colors.black,
                              scale: 2,
                            ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Contact',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: isDarkMode
                          ? Image.asset(
                              'assets/privacy.png',
                              scale: 2,
                            )
                          : Image.asset(
                              'assets/privacy.png',
                              scale: 2,
                              color: Colors.black,
                            ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 40,
                width: 320,
                color: isDarkMode
                    ? const Color.fromARGB(255, 26, 26, 26)
                    : Colors.white,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.text_snippet_sharp)),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 150),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Follow Us On:',
                      style: TextStyle(fontSize: 13),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/facebook.png'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/twitter.png'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/instagram.png'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color:
                isDarkMode ? const Color(0xFFFF2E00) : const Color(0xFFDFDFDF),
          ),
          height: 60,
          child: Stack(
            children: [
              // Positioned(
              //   bottom: 0,
              //   child: Container(
              //     height: 45,
              //     width: MediaQuery.of(context).size.width,
              //     color: const Color(0xFFFF4D00),
              //   ),
              // ),
              Positioned(
                left: 10,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const home_dashboard(),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 17),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.home,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const series_dashboard(),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/series.png',
                                color: Colors.black,
                                scale: 4,
                              ),
                            ),
                            const Text(
                              'Series',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const matches_dashboard(),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/matches.png',
                                color: Colors.black,
                                scale: 4,
                              ),
                            ),
                            const Text(
                              'Matches',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const rankingPage(),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child:Icon(Icons.leaderboard
                               ,
                                color: Colors.black,
                             
                              ),
                            ),
                            const Text(
                              'Ranking',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: null,
                      child: Container(
                        margin: const EdgeInsets.only(left: 23),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/more.png',
                                scale: 4,color: isDarkMode
                                      ? const Color(0xFFFF2E00)
                                      : const Color(0xFFFF4D00),
                              ),
                            ),
                            const Text(
                              'More',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
