// import 'package:flutter/material.dart';
// import 'package:vitwo_beta/src/constants/colors.dart';
// import 'package:vitwo_beta/src/constants/text.dart';

// class sd_SO extends StatefulWidget {
//   const sd_SO({super.key});

//   @override
//   State<sd_SO> createState() => _sd_SOState();
// }

// class _sd_SOState extends State<sd_SO> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           GlobalText.SD_SO,
//           style: TextStyle(color: GlobalColor.appBarTextColor),
//         ),
//         backgroundColor: GlobalColor.appBarColor,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//     );
//   }
// }

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_DoneJobs.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_ItemOrderList.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_ALL.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_ExceptionalSO.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_OpenSO.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_Pending.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/widget/sd_SO_PendingJobs.dart';

import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_SO extends StatefulWidget {
  const sd_SO({super.key});

  @override
  State<sd_SO> createState() => _sd_SOState();
}

class _sd_SOState extends State<sd_SO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_SO,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: DefaultTabController(
        length: 7,
        child: Column(
          children: [
            ButtonsTabBar(
              backgroundColor: GlobalColor.menuOptionColor,
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
                Tab(icon: Icon(Icons.pending), text: 'Pending SO'),
                Tab(icon: Icon(Icons.open_in_browser), text: 'Open SO'),
                Tab(icon: Icon(Icons.no_accounts), text: 'Exceptional SO'),
                Tab(icon: Icon(Icons.list), text: 'Item Order List'),
                Tab(icon: Icon(Icons.pending_actions), text: 'Pending Jobs'),
                Tab(icon: Icon(Icons.done_all), text: 'Done Jobs'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: const [
                  sd_SO_All(),
                  sd_SO_Pending(),
                  sd_SO_OpenSO(),
                  sd_SO_ExceptionalSO(),
                  sd_SO_ItemOrderList(),
                  sd_SO_PendingJobs(),
                  sd_SO_DoneJobs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
