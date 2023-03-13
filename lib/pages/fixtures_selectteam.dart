// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:crex/provider/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class fixtures_selectteam extends StatefulWidget {
  const fixtures_selectteam({super.key});

  @override
  State<fixtures_selectteam> createState() => _fixtures_selectteamState();
}

class _fixtures_selectteamState extends State<fixtures_selectteam> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: isDarkMode
                      ? AssetImage('assets/background.jpeg')
                      : AssetImage("assets/bgLightMode.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, left: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 45),
                        child: Text(
                          'Add favourite team',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? Colors.white : Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 45),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: isDarkMode ? Colors.white : Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 1,
                  width: 380,
                  color: isDarkMode ? Colors.white : Colors.grey,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        filled: true,
                        hintText: "Search Items",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.black.withOpacity(0.85),
                        focusColor: Colors.white,
                        suffixIcon: Container(
                          // color: Colors.black.withOpacity(0),
                          margin: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        suffixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'International Teams',
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150, top: 20),
                      child: Text(
                        'See All >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    )
                  ],
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/india.png')),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 40, top: 85),
                        child: Text(
                          'IND',
                          style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 11),
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'Indian Premier League 2022',
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 130),
                      child: Text(
                        'See All >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, top: 15, right: 10),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isDarkMode ? Colors.white : Colors.black),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset('assets/kkr.png'),
                    );
                  },
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'Popular Leagues',
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 183),
                      child: Text(
                        'See All >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 14),
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isDarkMode ? Colors.white : Colors.black),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage("assets/leagues.png"),
                              fit: BoxFit.fill)),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
