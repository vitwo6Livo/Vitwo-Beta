import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/detailsPage/quotation_DetailsPage.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_Quotation_Accepted extends StatefulWidget {
  const sd_Quotation_Accepted({super.key});

  @override
  State<sd_Quotation_Accepted> createState() => _sd_Quotation_AcceptedState();
}

class _sd_Quotation_AcceptedState extends State<sd_Quotation_Accepted> {
  List<Map<String, dynamic>> items = [
    {
      'QuotationNo': 'QUOT050620256886',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'CustomerCode': '52500041',
      'QuotationValue': '335,139.83999',
      'PostingDate': '05-06-2025',
      'CreatedBy': 'Anjali Rana',
      'Status': 'Accepted',
      'GSTIN': '09ABUFM7000P1ZJ',
      'PAN': 'ABUFM7000P',
      'BillingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'ShippingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'PlaceOfSupply': '9(Uttar Pradesh)',
      'email': 'arana@vitwo.in',
      'phone': '6290013901',
      'ValidTill': '06-06-2025',
      'CurrencyRate': '1.00000',
      'CustomerCurrency': 'INR',
      'ComplianceInvoiceType': 'R',
      'ReferenceDocumentLink': 'No Attached File',
      'QuotationType': 'domestic',
      'INCOTERM': 'FOR',
      'ItemCode': '22000180',
      'ItemName': 'Vitwo Watch',
      'HSN': '70159010',
      'QTY': '50.000',
      'Currency': 'INR',
      'UnitPrice': '6000.00000',
      'BaseAmount': '300000.00000',
      'Discount': '768.00000',
      'TaxableAmount': '299232.00000',
      'GST_%': '12.000',
      'GSTAmount(INR)': '35907.84000',
      'TotalAmount': '335139.84000',
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
                              builder: (context) =>
                                  Quotation_detailsScreen(items)));
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

Widget _buildCardData(Map<String, dynamic> items) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: Quotation No and Status
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items['QuotationNo'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.event, color: GlobalColor.primaryColor),
                    SizedBox(width: 5),
                    Text(
                      items['ValidTill'],
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 42,
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
                      backgroundColor: items['Status'] == 'Approved' ||
                              items['Status'] == 'Accepted'
                          ? Colors.green
                          : items['Status'] == 'Pending'
                              ? Colors.yellow
                              : items['Status'] == 'Rejected' ||
                                      items['Status'] == 'Expired' ||
                                      items['Status'] == 'Closed'
                                  ? Colors.red
                                  : null,
                    ),
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

        // Customer Name with icon
        Row(
          children: [
            Icon(Icons.person, color: GlobalColor.primaryColor),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                items['CustomerName'],
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        // Created By with icon
        // Row(
        //   children: [
        //     Icon(Icons.create_outlined, color: Colors.grey.shade600, size: 20),
        //     SizedBox(width: 6),
        //     Flexible(child: Text(items['CreatedBy'], maxLines: 2)),
        //   ],
        // ),

        // SizedBox(height: 10),

        // Quotation Value with icon
        Row(
          children: [
            Icon(Icons.currency_rupee, color: GlobalColor.primaryColor),
            SizedBox(width: 6),
            Flexible(child: Text(items['QuotationValue'], maxLines: 2)),
          ],
        ),
      ],
    ),
  );
}
