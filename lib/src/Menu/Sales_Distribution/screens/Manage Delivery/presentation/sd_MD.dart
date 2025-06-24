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
                              builder: (context) => MD_detailsScreen(items)));
                    },
                    child:
                        Card(elevation: 3, child: _buildCardData(items[index])),
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

_buildCardData(Map<String, dynamic> item) {
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
                _buildRowText(null, item['DeliveryNumber'], 19),
                _buildRowText(Icons.local_shipping, item['DeliveryDate'], null),
              ],
            ),
            _buildStatusIndicator(item['Status']),
          ],
        ),
        SizedBox(height: 15),
        _buildRow(Icons.person, item['CustomerName']),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRowText(Icons.receipt_long_outlined, item['SONumber'], null),
            _buildRowText(Icons.currency_rupee, item['TotalAmount'], null),
          ],
        ),
      ],
    ),
  );
}

_buildStatusIndicator(value) {
  return Container(
    height: 42,
    width: value == 'Reversed' ? 100 : 80,
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
            backgroundColor: value == 'Open'
                ? Colors.blueAccent
                : value == 'Reversed'
                    ? Colors.red
                    : null,
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
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
