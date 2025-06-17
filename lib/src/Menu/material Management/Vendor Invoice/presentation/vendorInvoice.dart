import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class VendorInvoice extends StatelessWidget {
  const VendorInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'GRN/SRN_Number': 'GRN1750075117909',
        'PO-No': 'PO2506078',
        'Vendor_Code': '62500075',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'Status': 'Reverse',
      },
      {
        'GRN/SRN_Number': 'SRN1750053933854',
        'PO-No': 'PO2506074',
        'Vendor_Code': '62500081',
        'Vendor_Name': 'HMB ISPAT PRIVATE LIMITED',
        'Status': 'Active',
      },
      {
        'GRN/SRN_Number': '	GRN1749727226964',
        'PO-No': 'PO2506060|PO2506061',
        'Vendor_Code': '62500094',
        'Vendor_Name': 'SUZLON ENERGY LIMITED',
        'Status': 'Active',
      },
      {
        'GRN/SRN_Number': 'SRN1750053933856',
        'PO-No': 'PO2506038|PO2505105',
        'Vendor_Code': '62500033',
        'Vendor_Name': 'MY JIO MART',
        'Status': 'Active',
      },
      {
        'GRN/SRN_Number': 'GRN1749715481695	',
        'PO-No': 'PO2506033',
        'Vendor_Code': '62500075',
        'Vendor_Name': 'FAB TECH',
        'Status': 'Active',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vendor Invoice',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['GRN/SRN_Number'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.view_stream_outlined),
                                  SizedBox(width: 5),
                                  Text(items[index]['PO-No']),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.hourglass_bottom),
                                  SizedBox(width: 5),
                                  Text(items[index]['Vendor_Code']),
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
