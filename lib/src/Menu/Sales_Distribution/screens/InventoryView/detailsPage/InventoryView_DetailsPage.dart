import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/InventoryView/detailsPage/InventoryView_StockDetails.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/InventoryView/detailsPage/InventoryView_StockLog.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/InventoryView/detailsPage/InventoryView_StockTransfer.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class InventoryView_DetailsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stockDetails;
  final List<Map<String, dynamic>> stockLog;
  const InventoryView_DetailsScreen(this.stockDetails, this.stockLog,
      {super.key});

  @override
  State<InventoryView_DetailsScreen> createState() =>
      _InventoryView_DetailsScreenState();
}

class _InventoryView_DetailsScreenState
    extends State<InventoryView_DetailsScreen> {
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
                  InventoryView_StockDetails(stockDetails: widget.stockDetails),
                  InventoryView_StockLog(stockLog: widget.stockLog),
                  InventoryView_StockTransfer(),
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
                  Tab(icon: Icon(Icons.article)),
                  Tab(icon: Icon(Icons.timeline)),
                  Tab(icon: Icon(Icons.swap_horiz)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
