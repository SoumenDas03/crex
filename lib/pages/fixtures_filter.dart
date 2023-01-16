// ignore: unused_import
import 'package:flutter/material.dart';

// ignore: camel_case_types
class fixtures_filter extends StatefulWidget {
  const fixtures_filter({super.key});

  @override
  State<fixtures_filter> createState() => _fixtures_filterState();
}

// ignore: camel_case_types
class _fixtures_filterState extends State<fixtures_filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(
          onPressed: () => _show(context),
        ),
      ),
    );
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        builder: (ctx) => Opacity(
              opacity: 0.8,
              child: Container(
                height: 350.0,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0))),

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Filter Matches',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 175,
                            ),
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.close_sharp,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          width: 360,
                          color: Colors.greenAccent,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                "Team",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 10,
                              ),
                              DefaultTabController(
                                length: 3,
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
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('All'),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('Men'),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('Women'),
                                        ),
                                      ),
                                    ]),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 25,
                              ),

                              // ignore: prefer_const_constructors
                              Text(
                                "Format",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 25,
                              ),
                              DefaultTabController(
                                length: 5,
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

                                        height: 30, width: 75,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('All'),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('T 20'),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('ODI'),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('Test'),
                                        ),
                                      ),

                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('T 10'),
                                        ),
                                      ),
                                    ]),
                              ),

                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 25,
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                "Format",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 25,
                              ),
                              DefaultTabController(
                                length: 3,
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
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('All'),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 150,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('International'),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(left: 10),
                                        width: 75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // ignore: prefer_const_constructors
                                        child: Tab(
                                          text: ('Domestic'),
                                        ),
                                      ),
                                    ]),
                              ),

                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                  // ignore: prefer_const_constructors
                                  minimumSize: Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    //border radius equal to or more than 50% of width
                                  )),
                              onPressed: () {},
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Apply Filters",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
