import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_SO_ItemOrderList extends StatefulWidget {
  const sd_SO_ItemOrderList({super.key});

  @override
  State<sd_SO_ItemOrderList> createState() => _sd_SO_ItemOrderListState();
}

class _sd_SO_ItemOrderListState extends State<sd_SO_ItemOrderList> {
  List<Map<String, dynamic>> items = [
    {
      'SO_Number': 'SO2506021',
      'SO_Date': '09-06-2025',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Customer_Code': '52500041',
      'Created_By': 'Anjali Rana',
      'Status': 'PGI',
    },
    {
      'SO_Number': 'SO2506021',
      'SO_Date': '09-06-2025',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Customer_Code': '52500041',
      'Created_By': 'Anjali Rana',
      'Status': 'Open',
    },
    {
      'SO_Number': 'SO2506021',
      'SO_Date': '09-06-2025',
      'Delivery_Date': '09-06-2025',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Customer_Code': '52500041',
      'Created_By': 'Anjali Rana',
      'Status': 'Delivery Created',
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
                                    Text(items[index]['SO_Date'], maxLines: 2),
                                  ],
                                ),
                                Container(
                                  height:
                                      items[index]['Status'] ==
                                              'Delivery Created'
                                          ? 70
                                          : 42,
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
                                          backgroundColor:
                                              items[index]['Status'] == 'PGI'
                                                  ? Colors.green
                                                  : items[index]['Status'] ==
                                                      'Delivery Created'
                                                  ? Colors.orange
                                                  : items[index]['Status'] ==
                                                      'Open'
                                                  ? Colors.blueAccent
                                                  : null,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          (items[index]['Status']?.length ??
                                                      0) >
                                                  8
                                              ? '${items[index]['Status'].substring(0, 8)}\n${items[index]['Status'].substring(9)}'
                                              : items[index]['Status'] ?? '',
                                          textAlign: TextAlign.center,
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
                                    Text(
                                      items[index]['Customer_Name'].length > 25
                                          ? '${items[index]['Customer_Name'].substring(0, 25)}...'
                                          : items[index]['Customer_Name'],
                                    ),
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
                              children: [
                                Text(
                                  'Delivery Date : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Delivery_Date']),
                              ],
                            ),

                            SizedBox(height: 4),
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
