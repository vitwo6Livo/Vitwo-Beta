import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/widget/sd_Quotation_Accepted.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/widget/sd_Quotation_All.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/widget/sd_Quotation_Approved.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/widget/sd_Quotation_Closed.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/widget/sd_Quotation_Pending.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/widget/sd_Quotation_Rejected.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_Quotation extends StatefulWidget {
  const sd_Quotation({super.key});

  @override
  State<sd_Quotation> createState() => _sd_QuotationState();
}

class _sd_QuotationState extends State<sd_Quotation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_Quotation,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            ButtonsTabBar(
              backgroundColor: GlobalColor.primaryColor,
              unselectedBackgroundColor: Colors.grey.shade300,
              unselectedLabelStyle: TextStyle(color: Colors.grey),
              labelSpacing: 10,
              contentPadding: EdgeInsets.only(right: 12, left: 15),
              borderWidth: 0,
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(icon: Icon(Icons.all_inbox), text: 'All'),
                Tab(icon: Icon(Icons.pending), text: 'Pending'),
                Tab(icon: Icon(Icons.done), text: 'Approved'),
                Tab(icon: Icon(Icons.verified), text: 'Accepted'),
                Tab(icon: Icon(Icons.cancel), text: 'Rejected'),
                Tab(icon: Icon(Icons.close), text: 'Closed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: const [
                  sd_Quotation_All(),
                  sd_Quotation_Pending(),
                  sd_Quotation_Approved(),
                  sd_Quotation_Accepted(),
                  sd_Quotation_Rejected(),
                  sd_Quotation_Closed(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
