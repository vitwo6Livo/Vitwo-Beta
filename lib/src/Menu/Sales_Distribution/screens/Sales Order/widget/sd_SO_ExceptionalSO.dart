import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/detailsPage/so_DetailsPage.dart';
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
      'soNumber': 'SO2505027',
      'customerOrderNo': 'CN0068',
      'CustomerName': 'Mindtree Limited',
      'CustomerCode': '52300001',
      'GSTIN': '33AABCM8839K1Z4',
      'PAN': 'AABCM8839K',
      'BillingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'ShippingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'PlaceOfSupply': '--',
      'email': 'salim.lab3@gmail.com',
      'phone': '9836813031',
      'deliveryDate': '07-03-2025',
      'postingDate': '07-03-2025',
      'postingTime': '16:46',
      'validTill': '',
      'creditPeriod': '45',
      'salesPerson': 'Salim',
      'functionalArea': 'IT',
      'complianceInvoiceType': 'null',
      'referenceDocumentLink': 'No Attached File',
      'soDate': '07-03-2025',
      'CreatedDate': '09-05-2025 16:47:19',
      'TotalAmount': '2,400.00000',
      'CreatedBy': 'Debika',
      'Type': 'SERVICE',
      'Status': 'Exceptional',
      'itemCode': '33000015',
      'itemName': 'Repairing Service',
      'HSN': '995419',
      'QTY': '2.000',
      'Currency': 'INR',
      'unitPrice': '1200.00000',
      'baseAmount': '2400.00000',
      'Discount': '0.00000',
      'taxableAmount': '2400.00000',
      'gst_%': '0.000',
      'gstAmount': '0.00000',
      'totalAmount': '2400.00000',
    },
    {
      'soNumber': 'SO2505027',
      'customerOrderNo': 'CN0068',
      'CustomerName': 'Mindtree Limited',
      'CustomerCode': '52300001',
      'GSTIN': '33AABCM8839K1Z4',
      'PAN': 'AABCM8839K',
      'BillingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'ShippingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'PlaceOfSupply': '--',
      'email': 'salim.lab3@gmail.com',
      'phone': '9836813031',
      'deliveryDate': '07-03-2025',
      'postingDate': '07-03-2025',
      'postingTime': '16:46',
      'validTill': '',
      'creditPeriod': '45',
      'salesPerson': 'Salim',
      'functionalArea': 'IT',
      'complianceInvoiceType': 'null',
      'referenceDocumentLink': 'No Attached File',
      'soDate': '07-03-2025',
      'CreatedDate': '09-05-2025 16:47:19',
      'TotalAmount': '2,400.00000',
      'CreatedBy': 'Debika',
      'Type': 'SERVICE',
      'Status': 'Exceptional',
      'itemCode': '33000015',
      'itemName': 'Repairing Service',
      'HSN': '995419',
      'QTY': '2.000',
      'Currency': 'INR',
      'unitPrice': '1200.00000',
      'baseAmount': '2400.00000',
      'Discount': '0.00000',
      'taxableAmount': '2400.00000',
      'gst_%': '0.000',
      'gstAmount': '0.00000',
      'totalAmount': '2400.00000',
    },
    {
      'soNumber': 'SO2505027',
      'customerOrderNo': 'CN0068',
      'CustomerName': 'Mindtree Limited',
      'CustomerCode': '52300001',
      'GSTIN': '33AABCM8839K1Z4',
      'PAN': 'AABCM8839K',
      'BillingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'ShippingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'PlaceOfSupply': '--',
      'email': 'salim.lab3@gmail.com',
      'phone': '9836813031',
      'deliveryDate': '07-03-2025',
      'postingDate': '07-03-2025',
      'postingTime': '16:46',
      'validTill': '',
      'creditPeriod': '45',
      'salesPerson': 'Salim',
      'functionalArea': 'IT',
      'complianceInvoiceType': 'null',
      'referenceDocumentLink': 'No Attached File',
      'soDate': '07-03-2025',
      'CreatedDate': '09-05-2025 16:47:19',
      'TotalAmount': '2,400.00000',
      'CreatedBy': 'Debika',
      'Type': 'SERVICE',
      'Status': 'Exceptional',
      'itemCode': '33000015',
      'itemName': 'Repairing Service',
      'HSN': '995419',
      'QTY': '2.000',
      'Currency': 'INR',
      'unitPrice': '1200.00000',
      'baseAmount': '2400.00000',
      'Discount': '0.00000',
      'taxableAmount': '2400.00000',
      'gst_%': '0.000',
      'gstAmount': '0.00000',
      'totalAmount': '2400.00000',
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SO_detailsScreen(items)));
                    },
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
                items['validTill'].toString().isEmpty
                    ? SizedBox()
                    : Row(
                        children: [
                          Icon(
                            Icons.event,
                            color: GlobalColor.primaryColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            items['validTill'],
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
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
                        backgroundColor: items['Status'] == 'Open'
                            ? Colors.blueAccent
                            : items['Status'] == 'Pending'
                                ? Colors.yellow
                                : items['Status'] == 'Exceptional'
                                    ? Colors.orange
                                    : null),
                    SizedBox(width: 10),
                    Text(
                      items['Status'],
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
            Row(
              children: [
                Icon(Icons.person, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  items['CustomerName'].toString().length > 23
                      ? '${items['CustomerName'].toString().substring(0, 23)}...'
                      : items['CustomerName'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.abc, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  items['CustomerCode'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping_rounded,
                    color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  items['deliveryDate'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                    items['Type'] == 'SERVICE'
                        ? Icons.build
                        : items['Type'] == 'GOODS'
                            ? Icons.extension
                            : items['Type'] == 'PROJECT'
                                ? Icons.file_copy
                                : null,
                    color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  items['Type'],
                  maxLines: 2,
                  style: TextStyle(
                    color: items['Type'] == 'SERVICE'
                        ? Colors.green
                        : items['Type'] == 'GOODS'
                            ? Colors.blueAccent
                            : items['Type'] == 'PROJECT'
                                ? Colors.orange
                                : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
