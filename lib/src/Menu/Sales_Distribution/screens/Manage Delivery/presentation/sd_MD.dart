import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Manage%20Delivery/detailsPage/MD_DetailsPage.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_MD extends StatefulWidget {
  const sd_MD({super.key});

  @override
  State<sd_MD> createState() => _sd_MDState();
}

class _sd_MDState extends State<sd_MD> {
  List<Map<String, dynamic>> items = [
    {
      'DeliveryNumber': 'D1749455352870',
      'SONumber': 'SO2506021',
      'DeliveryDate': '09-06-2025',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'CustomerCode': '52500041',
      'TotalAmount': '55,804.00000',
      'TotalItems': '1.000',
      'Status': 'Open',
      'GSTIN': '09ABUFM7000P1ZJ',
      'PAN': 'ABUFM7000P',
      'BillingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'ShippingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'PlaceOfSupply': '--',
      'email': 'arana@vitwo.in',
      'phone': '6290013901',
      'PostingDate': '09-06-2025',
      'FunctionalArea': 'Production',
      'ReferenceDocumentLink': 'No Attached File',
      'ItemCode': '22000182',
      'ItemName': 'Spectacle',
      'QTY': '10.000',
      'StorageLOC': 'FG WH Reserve',
      'Warehouse': 'WH-1',
      'Batch': 'PROD1748437991',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_MD,
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MD_detailsScreen(items)));
                    },
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
                                      items[index]['DeliveryNumber'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.local_shipping,
                                          color: GlobalColor.primaryColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          items[index]['DeliveryDate'],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 42,
                                  width: items[index]['Status'] == 'Reversed'
                                      ? 100
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
                                                          'Reversed'
                                                      ? Colors.red
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
                                Icon(Icons.person,
                                    color: GlobalColor.primaryColor),
                                SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    items[index]['CustomerName'],
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.receipt_long_outlined,
                                        color: GlobalColor.primaryColor),
                                    SizedBox(width: 5),
                                    Text(items[index]['SONumber']),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee,
                                        color: GlobalColor.primaryColor),
                                    SizedBox(width: 5),
                                    Text(items[index]['TotalAmount']),
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
      ),
    );
  }
}
