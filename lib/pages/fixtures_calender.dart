import 'package:crex/pages/fixtures_series.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: camel_case_types
class fixtures_calender extends StatefulWidget {
  const fixtures_calender({super.key});

  @override
  State<fixtures_calender> createState() => _fixtures_calenderState();
}

// ignore: camel_case_types
class _fixtures_calenderState extends State<fixtures_calender> {
  // ignore: unused_field, prefer_final_fields
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // ignore: prefer_final_fields
  DateTime _focusedDay = DateTime.now();
  // ignore: unused_field
  DateTime? _selectedDate;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 175, 173, 173),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: DefaultTabController(
            length: 3,
            child: Row(
              children: [
                const Text("Cricket this year"),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 100,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/three_line.png"))
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // ignore: prefer_const_constructors

              DefaultTabController(
                length: 7,
                child: Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 20, left: 15),
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(left: 10),
                  width: 335,
                  height: 45,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                      // ignore: prefer_const_constructors
                      topRight: Radius.circular(10),
                      // ignore: prefer_const_constructors
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  child: TabBar(
                      // ignore: prefer_const_constructors
                      indicatorColor: Color(0xFFFF4D00),
                      indicatorWeight: 3,
                      // indicatorSize: TabBarIndicatorSize.label,
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(right: 10),
                      // ignore: prefer_const_constructors
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelColor: Colors.black,
                      // ignore: prefer_const_constructors
                      labelColor: Color(0xFFFF4D00),
                      labelStyle:
                          // ignore: prefer_const_constructors
                          TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('All'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Men'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('T20'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('ODI'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('International'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('Test'),
                        ),
                        // ignore: prefer_const_constructors
                        Tab(
                          text: ('League'),
                        ),
                      ]),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 360,
                color: Colors.blueGrey,
                // ignore: prefer_const_constructors
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      "<",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 100,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "December",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 100,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      ">",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors

              Container(
                // ignore: prefer_const_constructors
                margin: EdgeInsets.only(left: 10, top: 10),
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 120,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // ignore: prefer_const_constructors
                                image: DecorationImage(
                                    // ignore: prefer_const_constructors
                                    image: AssetImage(
                                      "assets/matchlogo 1.png",
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 10,
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              "IND vs PAK, 2022",
                              // ignore: prefer_const_constructors
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              Container(
                height: 1,
                width: 360,
                color: Colors.grey,
              ),

              Container(
                color: Colors.blueGrey,
                // ignore: prefer_const_constructors
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const fixtures_series(),
                            ));
                      },
                      child: TableCalendar(
                          focusedDay: DateTime.now(),
                          firstDay: DateTime(1900),
                          lastDay: DateTime(2100)),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
