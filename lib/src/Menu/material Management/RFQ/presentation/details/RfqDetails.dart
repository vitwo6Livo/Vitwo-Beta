import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/RFQ/presentation/details/RfqOverView.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class RfqDetailsScreen extends StatelessWidget {
  const RfqDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Details Page',
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
          backgroundColor: GlobalColor.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  RfqOverview(),
                  Center(child: Text('Trail')),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
              bottom: 10, right: 90), // To make it "float"
          child: Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: ButtonsTabBar(
                backgroundColor: Colors.grey.shade600,
                unselectedBackgroundColor: Colors.grey.shade400,
                unselectedLabelStyle: TextStyle(
                  color: Colors.grey.shade800,
                ),
                contentPadding: EdgeInsets.only(right: 12, left: 15),
                borderWidth: 0,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(icon: Icon(Icons.all_inbox)),
                  Tab(icon: Icon(Icons.track_changes)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
