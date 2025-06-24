import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Post%20Goods%20Issuance/detailsPage/PGI_DetailsPage.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_PGI extends StatefulWidget {
  const sd_PGI({super.key});

  @override
  State<sd_PGI> createState() => _sd_PGIState();
}

class _sd_PGIState extends State<sd_PGI> {
  List<Map<String, dynamic>> items = [
    {
      'PGINO': 'D1749455352870/1',
      'DeliveryDate': '09-06-2025',
      'CustomerPO': '90876',
      'CustomerCode': '52500041',
      'CustomerName': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'TotalItems': '1.000',
      'CreatedBy': 'Anjali Rana',
      'Status': 'Open',
      'BillingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'ShippingAddress':
          'KASGANJ, KUTUBPUR PATTI SORON ROAD NEELAM HOSPITAL KE SAMNE, 207123, Kasganj, Kasganj, Kasganj, Andaman and Nicobar Islands',
      'email': 'arana@vitwo.in',
      'phone': '6290013901',
      'PGIPostingDate': '09-06-2025',
      'ProfitCenter': 'Production',
      'ItemCode': '22000182',
      'ItemName': 'Spectacle',
      'QTY': '10.000',
      'BatchNO': 'PROD1748437991',
      'StorageLocation': 'FG Market Open',
      'Warehouse': 'WH-1',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_PGI,
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
                              builder: (context) => PGI_detailsScreen(items)));
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
                _buildRowText(null, items['PGINO'], 19),
                SizedBox(height: 5),
                _buildRowText(
                    Icons.local_shipping, items['DeliveryDate'], null),
              ],
            ),
            _buildStatusIndicator(items['Status']),
          ],
        ),
        SizedBox(height: 10),
        _buildRow(Icons.person, items['CustomerName']),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRowText(Icons.description, items['CustomerPO'], null),
            _buildRowText(Icons.shopping_cart, items['TotalItems'], null),
          ],
        ),
      ],
    ),
  );
}

_buildStatusIndicator(value) {
  return Container(
    height: 42,
    width: value == 'Invoice' ? 90 : 80,
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
                : value == 'Invoice'
                    ? Colors.green
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
