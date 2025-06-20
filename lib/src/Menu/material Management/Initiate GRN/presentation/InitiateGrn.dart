import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class InitiateGRN extends StatelessWidget {
  const InitiateGRN({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'PO_Number': 'PO2506078',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'PO_Date': '16-06-2025',
        'PO_Type': 'material',
        'Price': 'INR 398,720',
      },
      {
        'PO_Number': 'PO2506073',
        'Vendor_Name': 'MY JIO MART',
        'PO_Date': '16-06-2025',
        'PO_Type': 'servicep',
        'Price': 'INR 295,000',
      },
      {
        'PO_Number': 'PO2506080',
        'Vendor_Name': 'WATCH WORLD',
        'PO_Date': '18-06-2025',
        'PO_Type': 'material',
        'Price': 'INR 250,000',
      },
      {
        'PO_Number': 'PO2506027',
        'Vendor_Name': 'DELHIVERY LIMITED',
        'PO_Date': '10-06-2025',
        'PO_Type': 'servicep',
        'Price': 'INR 150,000',
      },
      {
        'PO_Number': 'PO2506082',
        'Vendor_Name': 'WATCHES GALORE',
        'PO_Date': '20-06-2025',
        'PO_Type': 'material',
        'Price': 'INR 300,000',
      }
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalColor.appBarColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Initiate GRN',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SearchBarWidget(),
                exportButton(),
                SizedBox(width: 10),
                filterButton(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text("GRN Through PO",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GlobalColor.appBarColor,
                  )),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[index]['PO_Number'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.shopping_bag),
                                      SizedBox(width: 5),
                                      Text(items[index]['Vendor_Name']),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.category),
                                      SizedBox(width: 5),
                                      Text(items[index]['PO_Date']),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 5),
                                      Text(items[index]['PO_Type'],
                                          maxLines: 2),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(items[index]['Price'], maxLines: 2),
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
        ));
  }
}
