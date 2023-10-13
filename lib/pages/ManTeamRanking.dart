import 'package:flutter/material.dart';

class ManTeamRanking extends StatefulWidget {
  const ManTeamRanking({Key? key}) : super(key: key);

  @override
  State<ManTeamRanking> createState() => _ManTeamRankingState();
}

class _ManTeamRankingState extends State<ManTeamRanking> {
  Color _container1Color = Color(0xFF8B5A00);
  Color _container2Color = Color(0xFF8B5A00);
  Color _container3Color = Color(0xFF8B5A00);

  void _changeContainerColor(int containerNumber) {
    setState(() {
      if (containerNumber == 1) {
        _container1Color = Colors.red;
        _container2Color = Color(0xFF8B5A00);
        _container3Color = Color(0xFF8B5A00);
      } else if (containerNumber == 2) {
        _container1Color = Color(0xFF8B5A00);
        _container2Color = Colors.red;
        _container3Color = Color(0xFF8B5A00);
      } else if (containerNumber == 3) {
        // Toggle the third container's color when selected/deselected.
        if (_container3Color == Colors.red) {
          _container3Color = Color(0xFF8B5A00);
        } else {
          _container3Color = Colors.red;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _changeContainerColor(1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        color: _container1Color,
                        border: Border.all(
                          color: _container1Color,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text("ODI"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _changeContainerColor(2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      color: _container2Color == Colors.red
                          ? Colors.black
                          : Colors.amber, // Change color based on the condition
                      border: Border.all(
                        color: _container2Color == Colors.red
                            ? Colors.black
                            : Colors
                                .transparent, // Change border color based on the condition
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text("ODI"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _changeContainerColor(3);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        color: _container3Color,
                        border: Border.all(
                          color: _container3Color,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text("ODI"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
