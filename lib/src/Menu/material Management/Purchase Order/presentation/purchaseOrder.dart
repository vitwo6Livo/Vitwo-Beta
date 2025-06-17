import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class PurchaseOrder extends StatelessWidget {
  const PurchaseOrder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'PO_Number': '	PO2506078	',
        'Vendor_code': '62500075',
        'Total_Amount': 'INR 398,720',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'PO_Type': 'material',
        'Status': 'Open',
      },
      {
        'PO_Number': '	PO2506079	',
        'Vendor_code': '62500076',
        'Total_Amount': 'INR 150,000',
        'Vendor_Name': 'TIME TECH',
        'PO_Type': 'material',
        'Status': 'Closed',
      },
      {
        'PO_Number': '	PO2506080	',
        'Vendor_code': '62500077',
        'Total_Amount': 'INR 250,000',
        'Vendor_Name': 'WATCH WORLD',
        'PO_Type': 'material',
        'Status': 'Open',
      },
      {
        'PO_Number': '	PO2506081	',
        'Vendor_code': '62500078',
        'Total_Amount': 'INR 500,000',
        'Vendor_Name': 'TIME ZONE',
        'PO_Type': 'material',
        'Status': 'Closed',
      },
      {
        'PO_Number': '	PO2506082	',
        'Vendor_code': '62500079',
        'Total_Amount': 'INR 300,000',
        'Vendor_Name': 'WATCHES GALORE',
        'PO_Type': 'material',
        'Status': 'Open',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Purchase Order',
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
                  return Card(
                    elevation: 3,
                    color: Colors.blueGrey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items[index]['PO_Number'],
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
                                  Icon(Icons.shopping_bag),
                                  SizedBox(width: 5),
                                  Text(items[index]['Vendor_code']),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.category),
                                  SizedBox(width: 5),
                                  Text(items[index]['Total_Amount']),
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
                                  Text(items[index]['Vendor_Name'],
                                      maxLines: 2),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.paid_outlined),
                                  SizedBox(width: 5),
                                  Text(items[index]['PO_Type'], maxLines: 2),
                                ],
                              ),
                            ],
                          ),
                        ],
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
