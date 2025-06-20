import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Post%20Goods%20Issuance/detailsPage/PGI_Overview.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class PGI_detailsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const PGI_detailsScreen(this.items, {super.key});

  @override
  State<PGI_detailsScreen> createState() => _PGI_detailsScreenState();
}

class _PGI_detailsScreenState extends State<PGI_detailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
            // Tab Views on top part of screen
            Expanded(
              child: TabBarView(
                children: [
                  PGI_Overview(
                    itemDetails: widget.items,
                  ),
                  Center(child: Text('Company(INR)')),
                  Center(child: Text('Trail')),
                ],
              ),
            ),

            // Tab buttons floating at bottom
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
                  Tab(icon: Icon(Icons.print)),
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
