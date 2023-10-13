import 'package:crex/pages/manRankingPage.dart';
import 'package:flutter/material.dart';

class rankingPage extends StatefulWidget {
  const rankingPage({super.key});

  @override
  State<rankingPage> createState() => _rankingPageState();
}

class _rankingPageState extends State<rankingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ranking Details',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const menRankingPage(),
                        ));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('assets/virat.png'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  'Mens Ranking',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(),
                                child: Text(
                                  'Teams & Players',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
