import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_IV extends StatefulWidget {
  const sd_IV({super.key});

  @override
  State<sd_IV> createState() => _sd_IVState();
}

class _sd_IVState extends State<sd_IV> {
  List<Map<String, dynamic>> items = [
    {
      'Invoice_No': 'INV-0000000855',
      'Invoice_Date': '09-06-2025',
      'Status': 'Approved',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Due_in_Days': '40',
      'Created_By': 'Anjali Rana',
    },
    {
      'Invoice_No': 'INV-0000000855',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': 'Received',
      'Created_By': 'Anjali Rana',
      'Status': 'Approved',
    },
    {
      'Invoice_No': 'INV-0000000855',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '10',
      'Created_By': 'Anjali Rana',
      'Status': 'Approved',
    },
    {
      'Invoice_No': 'INV-0000000855',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '',
      'Created_By': 'Anjali Rana',
      'Status': 'Reversed',
    },
    {
      'Invoice_No': 'INV-0000000855',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '',
      'Created_By': 'Anjali Rana',
      'Status': 'Reversed',
    },
    {
      'Invoice_No': 'INV-0000000855',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '5',
      'Created_By': 'Anjali Rana',
      'Status': 'Approved',
    },
    {
      'Invoice_No': 'INV-0000000855',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.000000000000',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '',
      'Created_By': 'Anjali Rana',
      'Status': 'Reversed',
    },
  ];

  Color _getDueInDaysColor(String? due) {
    if (due == 'Received') {
      return Colors.green;
    }

    final parsed = int.tryParse(due ?? '');
    if (parsed != null && parsed > 10) {
      return Colors.green;
    } else if (parsed != null && parsed > 0 && parsed <= 10) {
      return Colors.red;
    }

    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_IV,
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
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final dueText =
                      items[index]['Due_in_Days'].toString().isNotEmpty
                          ? items[index]['Due_in_Days']
                          : '';

                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index]['Invoice_No'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      items[index]['Invoice_Date'],
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: _getDueInDaysColor(
                                    items[index]['Due_in_Days'],
                                  ),
                                  child: Center(
                                    child:
                                        items[index]['Due_in_Days'] ==
                                                'Received'
                                            ? Icon(
                                              Icons.verified,
                                              color: Colors.white,
                                            )
                                            : Text(
                                              dueText,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                  ),
                                ),
                                Container(
                                  height: 42,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: GlobalColor.OptionsColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor:
                                              items[index]['Status'] ==
                                                      'Approved'
                                                  ? Colors.green
                                                  : items[index]['Status'] ==
                                                      'Reversed'
                                                  ? Colors.red
                                                  : null,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          items[index]['Status'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  'Customer Name : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(
                                  items[index]['Customer_Name'].length > 24
                                      ? '${items[index]['Customer_Name'].substring(0, 24)}...'
                                      : items[index]['Customer_Name'],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Invoice Amount : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Invoice_Amount']),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Created By : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Created_By']),
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
