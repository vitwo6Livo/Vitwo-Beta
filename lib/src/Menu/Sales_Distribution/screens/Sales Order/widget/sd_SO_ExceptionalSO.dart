import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_SO_ExceptionalSO extends StatefulWidget {
  const sd_SO_ExceptionalSO({super.key});

  @override
  State<sd_SO_ExceptionalSO> createState() => _sd_SO_ExceptionalSOState();
}

class _sd_SO_ExceptionalSOState extends State<sd_SO_ExceptionalSO> {
  List<Map<String, dynamic>> items = [
    {
      'SO_Number': 'SO2505027',
      'Customer_PO': 'CN0068',
      'Customer_Name': 'Mindtree Limited',
      'Customer_Code': '52300001',
      'Delivery_Date': '07-03-2025',
      'SO_Date': '07-03-2025',
      'Created_Date': '09-05-2025 16:47:19',
      'Total_Amount': '2,400.00000',
      'Created_By': 'Debika',
      'Type': 'PROJECT',
      'Status': 'Exceptional',
    },
    {
      'SO_Number': 'SO2505027',
      'Customer_PO': 'CN0068',
      'Customer_Name': 'Mindtree Limited',
      'Customer_Code': '52300001',
      'Delivery_Date': '07-03-2025',
      'SO_Date': '07-03-2025',
      'Created_Date': '09-05-2025 16:47:19',
      'Total_Amount': '2,400.00000',
      'Created_By': 'Joy Shil',
      'Type': 'SERVICE',
      'Status': 'Exceptional',
    },
    {
      'SO_Number': 'SO2505027',
      'Customer_PO': 'CN0068',
      'Customer_Name': 'Mindtree Limited',
      'Customer_Code': '52300001',
      'Delivery_Date': '07-03-2025',
      'SO_Date': '07-03-2025',
      'Created_Date': '09-05-2025 16:47:19',
      'Total_Amount': '2,400.00000',
      'Created_By': 'Joy Shil',
      'Type': 'SERVICE',
      'Status': 'Exceptional',
    },
    {
      'SO_Number': 'SO2505027',
      'Customer_PO': 'CN0068',
      'Customer_Name': 'Mindtree Limited',
      'Customer_Code': '52300001',
      'Delivery_Date': '07-03-2025',
      'SO_Date': '07-03-2025',
      'Created_Date': '09-05-2025 16:47:19',
      'Total_Amount': '2,400.00000',
      'Created_By': 'Joy Shil',
      'Type': 'GOODS',
      'Status': 'Exceptional',
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
                                      items[index]['SO_Number'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      items[index]['Created_Date'],
                                      maxLines: 2,
                                    ),
                                  ],
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
                                          backgroundColor: Colors.orange,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Customer Name',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Customer_Name']),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Customer Code',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Customer_Code']),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SO Date',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['SO_Date']),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Delivery Date',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Delivery_Date']),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Type : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(
                                  items[index]['Type'],
                                  maxLines: 2,
                                  style: TextStyle(
                                    color:
                                        items[index]['Type'] == 'SERVICE'
                                            ? Colors.green
                                            : items[index]['Type'] == 'GOODS'
                                            ? Colors.blueAccent
                                            : items[index]['Type'] == 'PROJECT'
                                            ? Colors.orange
                                            : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Total Amount : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Total_Amount']),
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
