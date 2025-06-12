import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_Quotation_All extends StatefulWidget {
  const sd_Quotation_All({super.key});

  @override
  State<sd_Quotation_All> createState() => _sd_Quotation_AllState();
}

class _sd_Quotation_AllState extends State<sd_Quotation_All> {
  List<Map<String, dynamic>> items = [
    {
      'Quotation_No': 'QUOT050620256886',
      'Customer_Name': 'MY JIO MART',
      'Quotation_Value': '4,248.00000',
      'Posting_Date': '05-06-2025',
      'Created_By': 'Mamoon',
      'Status': 'Approved',
    },
    {
      'Quotation_No': 'QUOT050620256886',
      'Customer_Name': 'MY JIO MART',
      'Quotation_Value': '4,248.00000',
      'Posting_Date': '05-06-2025',
      'Created_By': 'Sayan Das',
      'Status': 'Rejected',
    },
    {
      'Quotation_No': 'QUOT050620256886',
      'Customer_Name': 'MY JIO MART',
      'Quotation_Value': '4,248.00000',
      'Posting_Date': '05-06-2025',
      'Created_By': 'Manav Kothari',
      'Status': 'Pending',
    },
    {
      'Quotation_No': 'QUOT050620256886',
      'Customer_Name': 'MY JIO MART',
      'Quotation_Value': '4,248.00000',
      'Posting_Date': '05-06-2025',
      'Created_By': 'Joy Shil',
      'Status': 'Accepted',
    },
    {
      'Quotation_No': 'QUOT050620256886',
      'Customer_Name': 'MY JIO MART',
      'Quotation_Value': '4,248.00000',
      'Posting_Date': '05-06-2025',
      'Created_By': 'Chayan Sharma',
      'Status': 'Closed',
    },
    {
      'Quotation_No': 'QUOT050620256886',
      'Customer_Name': 'MY JIO MART',
      'Quotation_Value': '4,248.00000',
      'Posting_Date': '05-06-2025',
      'Created_By': 'SUBHASIS SANTRA',
      'Status': 'Expired',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                      items[index]['Quotation_No'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      items[index]['Posting_Date'],
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 42,
                                  width: 100,
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
                                          backgroundColor: items[index]
                                                          ['Status'] ==
                                                      'Approved' ||
                                                  items[index]['Status'] ==
                                                      'Accepted'
                                              ? Colors.green
                                              : items[index]['Status'] ==
                                                      'Pending'
                                                  ? Colors.yellow
                                                  : Colors.red,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          items[index]['Status'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Customer Name : ',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Customer_Name']),
                                  ],
                                ),
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
                                Text(items[index]['Created_By'], maxLines: 2),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quotation Value: ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(
                                  items[index]['Quotation_Value'],
                                  maxLines: 2,
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
       floatingActionButton: RippleAnimation(
        color: Colors.blue.shade200,
        ripplesCount: 2,
        duration: Duration(seconds: 3),
        maxRadius: 50,
        child: FloatingActionButton(
          backgroundColor: GlobalColor.primaryColor,
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
