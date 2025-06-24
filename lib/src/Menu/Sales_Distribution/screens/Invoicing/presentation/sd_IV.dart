import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Invoicing/detailsPage/IV_DetailsPage.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_IV extends StatefulWidget {
  const sd_IV({super.key});

  @override
  State<sd_IV> createState() => _sd_IVState();
}

class _sd_IVState extends State<sd_IV> {
  List<Map<String, dynamic>> items = [
    {
      'InvoiceNo': 'INV-0000000855',
      'InvoiceDate': '09-06-2025',
      'Status': 'Approved',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'CustomerCode': '52500041',
      'InvoiceAmount': '54500.00',
      'Due_in_Days': '40',
      'CreatedBy': 'Anjali Rana',
      'GSTIN': '09ABUFM7000P1ZJ',
      'PAN': 'ABUFM7000P',
      'BillingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'ShippingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'PlaceOfSupply': '9(Uttar Pradesh)',
      'email': 'arana@vitwo.in',
      'phone': '6290013901',
      'InvoiceTime': '13:25',
      'CreditPeriod': '40',
      'SalesPerson': 'Lakshmi Narayn Dutta',
      'FunctionalArea': 'Production',
      'ComplianceInvoiceType': 'R',
      'ItemCode': '22000182',
      'ItemName': 'Spectacle',
      'HSN': '9004',
      'QTY': '10.000',
      'Currency': 'INR',
      'Rate': '5000.00000',
      'BaseAmount': '50000.00000',
      'Discount': '1250.00000',
      'TaxableAmount': '48750.00000',
      'GST_%': '12.000',
      'GSTAmount': '5850.00000',
      'TotalAmount': '54600.00000',
    },
    {
      'InvoiceNo': 'INV-0000000855',
      'InvoiceDate': '09-06-2025',
      'Status': 'Approved',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'CustomerCode': '52500041',
      'InvoiceAmount': '54500.00',
      'Due_in_Days': '5',
      'CreatedBy': 'Anjali Rana',
      'GSTIN': '09ABUFM7000P1ZJ',
      'PAN': 'ABUFM7000P',
      'BillingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'ShippingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'PlaceOfSupply': '9(Uttar Pradesh)',
      'email': 'arana@vitwo.in',
      'phone': '6290013901',
      'InvoiceTime': '13:25',
      'CreditPeriod': '40',
      'SalesPerson': 'Lakshmi Narayn Dutta',
      'FunctionalArea': 'Production',
      'ComplianceInvoiceType': 'R',
      'ItemCode': '22000182',
      'ItemName': 'Spectacle',
      'HSN': '9004',
      'QTY': '10.000',
      'Currency': 'INR',
      'Rate': '5000.00000',
      'BaseAmount': '50000.00000',
      'Discount': '1250.00000',
      'TaxableAmount': '48750.00000',
      'GST_%': '12.000',
      'GSTAmount': '5850.00000',
      'TotalAmount': '54600.00000',
    },
    {
      'InvoiceNo': 'INV-0000000855',
      'InvoiceDate': '09-06-2025',
      'Status': 'Approved',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'CustomerCode': '52500041',
      'InvoiceAmount': '54500.00',
      'Due_in_Days': 'Received',
      'CreatedBy': 'Anjali Rana',
      'GSTIN': '09ABUFM7000P1ZJ',
      'PAN': 'ABUFM7000P',
      'BillingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'ShippingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'PlaceOfSupply': '9(Uttar Pradesh)',
      'email': 'arana@vitwo.in',
      'phone': '6290013901',
      'InvoiceTime': '13:25',
      'CreditPeriod': '40',
      'SalesPerson': 'Lakshmi Narayn Dutta',
      'FunctionalArea': 'Production',
      'ComplianceInvoiceType': 'R',
      'ItemCode': '22000182',
      'ItemName': 'Spectacle',
      'HSN': '9004',
      'QTY': '10.000',
      'Currency': 'INR',
      'Rate': '5000.00000',
      'BaseAmount': '50000.00000',
      'Discount': '1250.00000',
      'TaxableAmount': '48750.00000',
      'GST_%': '12.000',
      'GSTAmount': '5850.00000',
      'TotalAmount': '54600.00000',
    },
  ];

  Color _getDueInDaysColor(String? due) {
    if (due == 'Received') return Colors.green;
    final parsed = int.tryParse(due ?? '');
    if (parsed != null) {
      if (parsed > 10) return Colors.green;
      if (parsed > 0 && parsed <= 10) return Colors.red;
    }
    return Colors.white;
  }

  String _getDueText(String? due) {
    if (due == 'Received') return 'Payment Received';
    final parsed = int.tryParse(due ?? '');
    if (parsed != null) {
      return parsed > 10
          ? 'Due in $parsed days'
          : parsed <= 10 && parsed > 0
              ? 'Overdue by $parsed days'
              : '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalText.SD_IV,
            style: TextStyle(color: GlobalColor.appBarTextColor)),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final item = items[index];
                final dueText = item['Due_in_Days'];
                final dueColor = _getDueInDaysColor(dueText);
                final dueLabel = _getDueText(dueText);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IV_detailsScreen(items)));
                  },
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: _buildCardData(item, dueColor, dueLabel),
                  ),
                );
              },
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

_buildCardData(Map<String, dynamic> item, dueColor, dueLabel) {
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
                _buildRowText(null, item['InvoiceNo'], 19),
                const SizedBox(height: 6),
                _buildRowText(Icons.event, item['InvoiceDate'], null),
              ],
            ),
            _buildStatusIndicator(item['Status']),
          ],
        ),
        const SizedBox(height: 15),
        _buildRow(Icons.person, item['CustomerName']),
        const SizedBox(height: 10),
        _buildRowText(Icons.currency_rupee, item['InvoiceAmount'], null),
        const SizedBox(height: 5),
        item['Due_in_Days'] == ''
            ? SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_buildDueStatusIndicator(dueColor, dueLabel)],
              ),
      ],
    ),
  );
}

_buildStatusIndicator(value) {
  return Container(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: GlobalColor.OptionsColor,
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: value == 'Approved'
              ? Colors.green
              : value == 'Reversed'
                  ? Colors.red
                  : Colors.grey,
        ),
        const SizedBox(width: 8),
        Text(
          value ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

_buildDueStatusIndicator(dueColor, dueLabel) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 8,
    ),
    decoration: BoxDecoration(
      color: dueColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      dueLabel,
      style: TextStyle(
        color: dueColor,
        fontWeight: FontWeight.w600,
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
