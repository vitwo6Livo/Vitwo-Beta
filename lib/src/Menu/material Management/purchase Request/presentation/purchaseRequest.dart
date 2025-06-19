import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class PurchaseRequest extends StatelessWidget {
  const PurchaseRequest({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'PR_Number': 'PR2506037',
        'PR_Date': '18-06-2025',
        'Required_Date': '30-06-2025',
        'Created_by': 'Sayan Das',
        'PR_Type': 'material',
        'Status': 'Open',
      },
      {
        'PR_Number': 'PR2506036',
        'PR_Date': '16-06-2025',
        'Required_Date': '16-06-2025',
        'Created_by': 'Anjali Rana',
        'PR_Type': 'material',
        'Status': 'Open',
      },
      {
        'PR_Number': 'PR2506028',
        'PR_Date': '10-06-2025',
        'Required_Date': '10-06-2025',
        'Created_by': 'Salim',
        'PR_Type': 'material',
        'Status': 'Closed',
      },
      {
        'PR_Number': 'PR2506018',
        'PR_Date': '09-06-2025',
        'Required_Date': '11-06-2025',
        'Created_by': 'Piyas Ghosh',
        'PR_Type': 'servicep',
        'Status': 'Closed',
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Purchase Request',
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SearchBarWidget(),
              exportButton(),
              SizedBox(width: 10),
              filterButton(),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Card(
                      elevation: 5,
                      // color: Colors.blueGrey.shade100,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index]['PR_Number'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: items[index]['Status'] == 'Open'
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    items[index]['Status'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    SizedBox(width: 5),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 120),
                                      child: Text(
                                        items[index]['Required_Date'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.category),
                                    SizedBox(width: 5),
                                    Text(items[index]['PR_Type']),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(width: 5),
                                    Text(items[index]['Created_by'],
                                        maxLines: 2),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.event_available),
                                    Text(items[index]['PR_Date'], maxLines: 2),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
