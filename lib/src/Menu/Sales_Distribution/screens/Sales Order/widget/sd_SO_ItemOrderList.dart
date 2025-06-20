import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
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
      'soNumber': 'SO2505027',
      'soDate': '07-03-2025',
      'deliveryDate': '07-03-2025',
      'CustomerCode': '52300001',
      'CustomerName': 'Mindtree Limited',
      'itemCode': '33000015',
      'itemName': 'Repairing Service',
      'QTY': '2.000',
      'UOM': 'PCS',
      'Tax_%': '18.00',
      'Discount_%': '0.0000',
      'TotalPrice': '88,500.00000',
      'CreatedBy': 'Anjali Rana',
      'DeliveryStatus': 'Open',
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
                      child: _buildCardData(items[index]),
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

_buildCardData(Map<String, dynamic> items) {
  return Padding(
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
                  items['soNumber'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.event, color: GlobalColor.primaryColor),
                    SizedBox(
                      width: 5,
                    ),
                    Text(items['soDate'], maxLines: 2),
                  ],
                ),
              ],
            ),
            Container(
              height: items['Status'] == 'Delivery Created' ? 70 : 42,
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
                      backgroundColor: items['Status'] == 'PGI'
                          ? Colors.green
                          : items['Status'] == 'Delivery Created'
                              ? Colors.orange
                              : items['Status'] == 'Open'
                                  ? Colors.blueAccent
                                  : null,
                    ),
                    SizedBox(width: 10),
                    Text(
                      (items['Status']?.length ?? 0) > 8
                          ? '${items['Status'].substring(0, 8)}\n${items['Status'].substring(9)}'
                          : items['Status'] ?? '',
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
                  items['CustomerName'].length > 25
                      ? '${items['CustomerName'].substring(0, 25)}...'
                      : items['CustomerName'],
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
                Text(items['CustomerCode']),
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
            Text(items['deliveryDate']),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              'Created By : ',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(items['CreatedBy']),
          ],
        ),
      ],
    ),
  );
}
