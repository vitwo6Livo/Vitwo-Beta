import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_MD extends StatefulWidget {
  const sd_MD({super.key});

  @override
  State<sd_MD> createState() => _sd_MDState();
}

class _sd_MDState extends State<sd_MD> {
  List<Map<String, dynamic>> items = [
    {
      'Delivery_Number': 'D1749455352870',
      'SO_Number': 'SO2506021',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Amount': '55,804.00000',
      'Total_Items': '1.000',
      'Status': 'Open',
    },
    {
      'Delivery_Number': 'D1749455352870',
      'SO_Number': 'SO2506021',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Amount': '55,804.00000',
      'Total_Items': '1.000',
      'Status': 'Reversed',
    },
    {
      'Delivery_Number': 'D1749455352870',
      'SO_Number': 'SO2506021',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Amount': '55,804.00000',
      'Total_Items': '1.000',
      'Status': 'Reversed',
    },
    {
      'Delivery_Number': 'D1749455352870',
      'SO_Number': 'SO2506021',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Amount': '55,804.00000',
      'Total_Items': '1.000',
      'Status': 'Open',
    },
    {
      'Delivery_Number': 'D1749455352870',
      'SO_Number': 'SO2506021',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Amount': '55,804.00000',
      'Total_Items': '1.000',
      'Status': 'Open',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_MD,
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

          // List View
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
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
                                      items[index]['Delivery_Number'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      items[index]['Delivery_Date'],
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 42,
                                  width: items[index]['Status'] == 'Reversed'
                                      ? 100
                                      : 80,
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
                                              items[index]['Status'] == 'Open'
                                                  ? Colors.blueAccent
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
                                  items[index]['Customer_Name'].length > 20
                                      ? '${items[index]['Customer_Name'].substring(0, 24)}...'
                                      : items[index]['Customer_Name'],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'SO Number : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['SO_Number']),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Items',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Total_Items']),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Total_Amount']),
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
