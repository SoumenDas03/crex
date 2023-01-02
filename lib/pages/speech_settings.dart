import 'package:flutter/material.dart';

import 'audio_player.dart';

// ignore: camel_case_types
class speech_settings extends StatefulWidget {
  const speech_settings({super.key});

  @override
  State<speech_settings> createState() => _speech_settingsState();
}

// ignore: camel_case_types
class _speech_settingsState extends State<speech_settings> {
  int _value = 0;
  bool status = false;
  bool status1 = false;
  bool status2 = false;

  // ignore: prefer_const_constructors
  final player = audio_player();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void dispose() {
    super.dispose();
  }

  String? time(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join('.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    // ignore: prefer_const_constructors
                    image: AssetImage(
                      "assets/background.jpeg",
                    ),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 35, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'Speech Settings (Accesibility) ',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(
                          onPressed: () {},
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Container(
                    height: 1,
                    width: 350,
                    color: Colors.white,
                  ),
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey[700],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Speech ',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 200,
                            ),
                            IconButton(
                                onPressed: () {},
                                // ignore: prefer_const_constructors
                                icon: Icon(
                                  Icons.notifications_off,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: 320,
                          color: Colors.white30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Ball to Ball Speech',
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 120,
                            ),
                            Switch(
                              activeColor: Colors.blueGrey,
                              activeTrackColor: Colors.grey,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              value: status,
                              onChanged: (value) {
                                // ignore: avoid_print
                                print("VALUE : $value");
                                setState(() {
                                  status = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: 320,
                          color: Colors.white30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Session Speech',
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 135,
                            ),
                            Switch(
                              activeColor: Colors.blueGrey,
                              activeTrackColor: Colors.grey,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              value: status1,
                              onChanged: (value) {
                                // ignore: avoid_print
                                print("VALUE : $value");
                                setState(() {
                                  status1 = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: 320,
                          color: Colors.white30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Odds Speech',
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 150,
                            ),
                            Switch(
                              activeColor: Colors.blueGrey,
                              activeTrackColor: Colors.grey,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              value: status2,
                              onChanged: (value) {
                                // ignore: avoid_print
                                print("VALUE : $value");
                                setState(() {
                                  status2 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(left: 25),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Speech Voice',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Opacity(
                  opacity: 1,
                  child: Container(
                      height: 150,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[700],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 16.5,
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 18,
                              ),
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 16.5,
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 18,
                              ),
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 16.5,
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 18,
                              ),
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 16.5,
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 18,
                              ),
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 16.5,
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 18,
                              ),
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 16.5,
                              )
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            // ignore: prefer_const_constructors
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            // ignore: prefer_const_constructors
                            child: Text(
                              'Selected',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  'Ball',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      // ignore: prefer_const_constructors
                                      color: Color(0xFFFF4D00),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Colors.amber,
                                ),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  '6',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      // ignore: prefer_const_constructors
                                      color: Color(0xFFFF4D00),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Colors.amber,
                                ),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  '4',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      // ignore: prefer_const_constructors
                                      color: Color(0xFFFF4D00),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Colors.amber,
                                ),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  'Wicket',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 12,
                                      // ignore: prefer_const_constructors
                                      color: Color(0xFFFF4D00),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Colors.amber,
                                ),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  '1',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      // ignore: prefer_const_constructors
                                      color: Color(0xFFFF4D00),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(left: 25),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Speech Language',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 340,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[700],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 1;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'Hindi',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 2;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'English',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 3,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 3;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'Bangla',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 4,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 4;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'Telugu',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 5,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 5;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'Tamil',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 6,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 6;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'Kannada',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              // ignore: prefer_const_constructors
                              fillColor: MaterialStatePropertyAll(Colors.white),
                              value: 7,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 7;
                                });
                              }),
                          // ignore: prefer_const_constructors
                          Text(
                            'Malayalam',
                            // ignore: prefer_const_constructors
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(left: 25),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Speech Language',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[700],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.speaker_rounded,
                        color: Colors.white54,
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 5,
                      ),
                      Slider(
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {},
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                )
              ]),
            )));
  }
}
