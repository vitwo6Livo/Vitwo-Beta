import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class ProcessedGRN extends StatelessWidget {
  const ProcessedGRN({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the processed GRN items
    List<Map<String, dynamic>> items = [
      {
        'Invoice_Number': '89764',
        'GRN_Number': 'GRN1750313037351',
        'GST_No': '19ACXPA8492M1ZK',
        'Vendor_Name': 'VIDEOHMS AGENCIES',
        'Total_Amount': '151,770.00'
      },
      {
        'Invoice_Number': '574678',
        'GRN_Number': 'GRN1750308194478',
        'GST_No': '24ABFFR9629G1ZX',
        'Vendor_Name': 'RISHABH DIGITAL',
        'Total_Amount': '198,275.00'
      },
      {
        'Invoice_Number': '12345',
        'GRN_Number': 'SRN1750242654394',
        'GST_No': '34AJQPS4293J1ZH',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'Total_Amount': '21,240.00'
      },
      {
        'Invoice_Number': '89764',
        'GRN_Number': 'GRN1750313037351',
        'GST_No': '19ACXPA8492M1ZK',
        'Vendor_Name': 'VIDEOHMS AGENCIES',
        'Total_Amount': '151,770.00'
      },
      {
        'Invoice_Number': '4567865',
        'GRN_Number': 'SRN1750241568756',
        'GST_No': '34AJQPS4293J1ZH',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'Total_Amount': '641.160'
      },
      {
        'Invoice_Number': '7654356',
        'GRN_Number': 'GRN1750075117909',
        'GST_No': '34AJQPS4293J1ZH',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'Total_Amount': '380,800.00'
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
            'Processed GRN',
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
                                        items[index]['Invoice_Number'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                      // Text(
                                      //   items[index]['PR_Code'],
                                      //   maxLines: 2,
                                      // ),
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
                                      Text(items[index]['GRN_Number']),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.receipt_long),
                                      SizedBox(width: 5),
                                      Text(items[index]['GST_No']),
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
                                      Text(items[index]['Vendor_Name'],
                                          maxLines: 2),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("₹"),
                                      Text(items[index]['Total_Amount'],
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
