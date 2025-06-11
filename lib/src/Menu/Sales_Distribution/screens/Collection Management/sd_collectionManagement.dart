import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_Collection_Management extends StatefulWidget {
  const sd_Collection_Management({super.key});

  @override
  State<sd_Collection_Management> createState() =>
      _sd_Collection_ManagementState();
}

class _sd_Collection_ManagementState extends State<sd_Collection_Management> {
  List<Map<String, dynamic>> items = [
    {
      'Transaction_Id': 'TNX12345',
      'Party_Code': '52500074',
      'Party_Name': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'Posting_Date': '10-06-2025',
      'Payment_Type': 'Collect',
      'Collected_Amount': '5,000.00000',
      'Created_By': 'S MOSES KAR',
      'Status': 'Reverse',
    },
    {
      'Transaction_Id': 'TXN0588',
      'Party_Code': '52500074',
      'Party_Name': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'Posting_Date': '10-06-2025',
      'Payment_Type': 'Collect',
      'Collected_Amount': '5,400.00000',
      'Created_By': 'Joy Shil',
      'Status': 'Collect',
    },
    {
      'Transaction_Id': 'S82103420',
      'Party_Code': '52500074',
      'Party_Name': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'Posting_Date': '10-06-2025',
      'Payment_Type': 'Collect',
      'Collected_Amount': '5,900.00000',
      'Created_By': 'Debika',
      'Status': 'Collect',
    },
    {
      'Transaction_Id': 'TRANSS050601',
      'Party_Code': '52500074',
      'Party_Name': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'Posting_Date': '10-06-2025',
      'Payment_Type': 'Collect',
      'Collected_Amount': '10000.00000',
      'Created_By': 'Debika',
      'Status': 'Reverse',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_CollectionM,
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index]['Transaction_Id'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                        'Posting Date : ${items[index]['Posting_Date']}'),
                                  ],
                                ),
                                Container(
                                  height: 42,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: GlobalColor.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: items[index]
                                                      ['Status'] ==
                                                  'Collect'
                                              ? Colors.blueAccent
                                              : Colors.orange,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Party Name',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Party_Name'].length > 20
                                        ? '${items[index]['Party_Name'].substring(0, 24)}...'
                                        : items[index]['Party_Name']),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Party Code',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Party_Code']),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Type : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Payment_Type']),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Collected Amount : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Collected_Amount']),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
