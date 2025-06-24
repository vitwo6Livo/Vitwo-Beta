import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/detailsPage/quotation_DetailsPage.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_Quotation_Approved extends StatefulWidget {
  const sd_Quotation_Approved({super.key});

  @override
  State<sd_Quotation_Approved> createState() => _sd_Quotation_ApprovedState();
}

class _sd_Quotation_ApprovedState extends State<sd_Quotation_Approved> {
  List<Map<String, dynamic>> items = [
    {
      'QuotationNo': 'QUOT050620256886',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'CustomerCode': '52500041',
      'QuotationValue': '335,139.83999',
      'PostingDate': '05-06-2025',
      'CreatedBy': 'Anjali Rana',
      'Status': 'Approved',
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                SearchBarWidget(),
                exportButton(),
                SizedBox(width: 5),
                filterButton(),
              ],
            ),
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
                _buildRowText(null, items['QuotationNo'], 19),
                SizedBox(height: 5),
                _buildRowText(
                    Icons.event, items['ValidTill'], null, Colors.red),
              ],
            ),
            _buildStatusIndicator(items['Status']),
          ],
        ),

        SizedBox(height: 15),
        _buildRow(Icons.person, items['CustomerName']),
        SizedBox(height: 10),

        _buildRow(Icons.currency_rupee, items['QuotationValue']),
      ],
    ),
  );
}

_buildStatusIndicator(value) {
  return Container(
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
            backgroundColor: value == 'Approved' || value == 'Accepted'
                ? Colors.green
                : value == 'Pending'
                    ? Colors.yellow
                    : value == 'Rejected' ||
                            value == 'Expired' ||
                            value == 'Closed'
                        ? Colors.red
                        : null,
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildRow(IconData icon, String label) {
  return Row(
    children: [
      Icon(icon, color: GlobalColor.primaryColor),
      SizedBox(width: 5),
      Flexible(
        child: Text(
          label,
          softWrap: true,
          overflow: TextOverflow.fade,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget _buildRowText(IconData? icon, String label, double? size,
    [Color? colors]) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (icon == null) SizedBox(),
      if (icon != null) Icon(icon, color: GlobalColor.primaryColor),
      SizedBox(width: 5),
      Text(
        label,
        softWrap: true,
        overflow: TextOverflow.fade,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors ?? Colors.black,
            fontSize: size ?? 14.0),
      ),
    ],
  );
}


