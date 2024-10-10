import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;
import 'package:kardly/historytabs/all_history.dart';
import 'package:kardly/historytabs/received_history.dart';
import 'package:kardly/historytabs/sent_history.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding:
            const EdgeInsets.only(top: 30, bottom: 40, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Transaction history',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'BricolageGrotesque SemiBold',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(8)),
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Color(0xFF232532),
                      borderRadius: BorderRadius.circular(8)),
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color.fromARGB(255, 136, 136, 136),
                  labelStyle: const TextStyle(
                      fontSize: 10, fontFamily: 'Montserrat Regular'),
                  tabs: const [
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0), // Adjust the padding as needed
                        child: Text('All'),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0), // Adjust the padding as needed
                        child: Text('Sent'),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0), // Adjust the padding as needed
                        child: Text('Received'),
                      ),
                    )
                  ]),
            ),
            const Expanded(
                child: TabBarView(
              children: [AllHistory(), SentHistory(), ReceivedHistory()],
            ))
          ],
        ),
      ),
    );
  }
}
