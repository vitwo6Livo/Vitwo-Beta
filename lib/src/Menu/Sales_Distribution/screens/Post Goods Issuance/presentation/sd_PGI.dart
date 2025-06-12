import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_PGI extends StatefulWidget {
  const sd_PGI({super.key});

  @override
  State<sd_PGI> createState() => _sd_PGIState();
}

class _sd_PGIState extends State<sd_PGI> {
  List<Map<String, dynamic>> items = [
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Open',
    },
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Invoice',
    },
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Open',
    },
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Open',
    },
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Invoice',
    },
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Open',
    },
    {
      'PGI_NO': 'D1749455352870/1',
      'Delivery_Date': '09-06-2025',
      'Customer_PO': '90876',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Total_Items': '1.000',
      'Created_By': 'Anjali Rana',
      'Status': 'Invoice',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_PGI,
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
                                      items[index]['PGI_NO'],
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
                                  width: items[index]['Status'] == 'Invoice'
                                      ? 90
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
                                                          'Invoice'
                                                      ? Colors.green
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
                                  'Customer PO : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Customer_PO']),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Total Items : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Total_Items']),
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
