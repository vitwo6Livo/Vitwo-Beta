import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Collection%20Management/detailsScreen/CollectionManagement_DetailsPage.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_Collection_Management extends StatefulWidget {
  const sd_Collection_Management({super.key});

  @override
  State<sd_Collection_Management> createState() =>
      _sd_Collection_ManagementState();
}

class _sd_Collection_ManagementState extends State<sd_Collection_Management> {
  List<Map<String, dynamic>> items = [
    {
      'TransactionId': 'TNX12345',
      'PartyCode': '52500074',
      'PartyName': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'PostingDate': '10-06-2025',
      'PaymentType': 'Collect',
      'CollectedAmount': '5,000.00000',
      'CreatedBy': 'S MOSES KAR',
      'Status': 'Reverse',
    },
    {
      'TransactionId': 'TNX12345',
      'PartyCode': '52500074',
      'PartyName': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'PostingDate': '10-06-2025',
      'PaymentType': 'POS-Offline',
      'CollectedAmount': '5,000.00000',
      'CreatedBy': 'S MOSES KAR',
      'Status': 'Collected',
    },
    {
      'TransactionId': 'TNX12345',
      'PartyCode': '52500074',
      'PartyName': 'BHIKHARAM CHANDMAL MITHAI NAMKINS PRIVATE LIMITED',
      'PostingDate': '10-06-2025',
      'PaymentType': 'POS-Online',
      'CollectedAmount': '5,000.00000',
      'CreatedBy': 'S MOSES KAR',
      'Status': 'Reverse',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_CollectionM,
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
                              builder: (context) =>
                                  CollectionManagement_detailsScreen()));
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRowText(null, items['TransactionId'], 19),
                SizedBox(height: 5),
                _buildRowText(Icons.event, items['PostingDate'], null),
              ],
            ),
            Column(
              children: [
                _buildStatusIndicator(items['Status']),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                        items['PaymentType'] == 'Collect'
                            ? Icons.handshake
                            : items['PaymentType'] == 'POS-Offline'
                                ? Icons.point_of_sale
                                : items['PaymentType'] == 'POS-Online'
                                    ? Icons.phonelink
                                    : Icons.money,
                        color: GlobalColor.primaryColor),
                    SizedBox(width: 5),
                    Text(items['PaymentType']),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        _buildRow(Icons.person, items['PartyName']),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRowText(Icons.abc, items['PartyCode'], null),
            _buildRowText(Icons.currency_rupee, items['CollectedAmount'], null),
          ],
        ),
        SizedBox(height: 10),
        _buildRowText(Icons.edit, items['CreatedBy'], null),
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
      color: GlobalColor.primaryColor,
    ),
    child: Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor:
                value == 'Collected' ? Colors.blueAccent : Colors.orange,
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
