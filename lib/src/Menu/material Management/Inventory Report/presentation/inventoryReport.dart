import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class InventoryReport extends StatelessWidget {
  const InventoryReport({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'Item_Code': '21000001',
        'Item_Name': 'Carvaan Mini Legends kannada - Sunset Red',
        'Total_Qty': '1425',
        'Price': '289.29063',
        'Total_Value': '412,403.77590'
      },
      {
        'Item_Code': '21000003',
        'Item_Name': 'County Bluetooth Speaker with Built-in FM Radio - Black',
        'Total_Qty': '260',
        'Price': '1,940.19',
        'Total_Value': '504,451.32'
      },
      {
        'Item_Code': '11000001',
        'Item_Name': 'Antenna',
        'Total_Qty': '5,005',
        'Price': '114.52',
        'Total_Value': '573,218.24'
      },
      {
        'Item_Code': '11000002',
        'Item_Name': 'Carvaan Mini',
        'Total_Qty': '2932',
        'Price': '205.39',
        'Total_Value': '602,217.81'
      },
      {
        'Item_Code': '11000003',
        'Item_Name': 'Carvaan Mini Legends kannada - Sunset Red',
        'Total_Qty': '1425',
        'Price': '289.29',
        'Total_Value': '412,403.78'
      },
      {
        'Item_Code': '11000004',
        'Item_Name': 'County Bluetooth Speaker with Built-in FM Radio - Black',
        'Total_Qty': '260',
        'Price': '1,940.19',
        'Total_Value': '504,451.32'
      },
      {
        'Item_Code': '11000005',
        'Item_Name': 'Antenna',
        'Total_Qty': '5005',
        'Price': '114.52',
        'Total_Value': '573,218.24'
      },
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
            'Inventory Report',
            style: TextStyle(color: Colors.white),
          ),
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index]['Item_Code'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
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
                                      Icon(Icons.view_stream_outlined),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          items[index]['Item_Name'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    400
                                                ? 16
                                                : 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.double_arrow_outlined),
                                      SizedBox(width: 5),
                                      Text(items[index]['Total_Qty']),
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
                                      Text("₹"),
                                      Text(items[index]['Price'], maxLines: 2),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("₹"),
                                      Text(items[index]['Total_Value'],
                                          maxLines: 2),
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
