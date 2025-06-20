import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Performa%20Invoice/detailsPage/PIV_DetailsPage.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_PI extends StatefulWidget {
  const sd_PI({super.key});

  @override
  State<sd_PI> createState() => _sd_PIState();
}

class _sd_PIState extends State<sd_PI> {
  List<Map<String, dynamic>> items = [
    {
      'PerformaInvoiceNo': '174850471171',
      'CustomerName': 'MY JIO MART',
      'CustomerCode': '52500010',
      'InvoiceDate': '29-05-2025',
      'InvoiceAmount': '59,000.00000',
      'CreatedAt': '29-05-2025',
      'CreatedBy': 'SUBHASIS SANTRA',
      'Status': 'Active',
      'GSTIN': '08ABKFM6420H1Z6',
      'PAN': 'ABKFM6420H',
      'BillingAddress':
          'HOUSE NO.45, SURYA NAGARI, SADBHAWANA NAGAR ROAD, 335001, GANGANAGAR, GANGANAGAR, Sri Ganganagar, Rajasthan',
      'ShippingAddress':
          'HOUSE NO.45, SURYA NAGARI, SADBHAWANA NAGAR ROAD, 335001, GANGANAGAR, GANGANAGAR, Sri Ganganagar, Rajasthan',
      'PlaceOfSupply': '8(Rajasthan)',
      'email': 'subhasis@vitwo.in',
      'phone': '7001451025',
      'InvoiceTime': '13:13',
      'ValidTill': '05-06-2025',
      'CreditPeriod': '40',
      'SalesPerson': 'Joy',
      'FunctionalArea': 'IT',
      'ComplianceInvoiceType': 'R',
      'ReferenceDocumentLink': '',
      'ItemCode': '33000007',
      'ItemName': 'CLAIMZ',
      'HSN': '997331',
      'QTY': '1.000',
      'Currency': 'INR',
      'UnitPrice': '50.00000',
      'BaseAmount': '50.00000',
      'Discount': '0.00000',
      'TaxableAmount': '50000.00000',
      'GST_%': '18.000',
      'GSTAmount': '9000.00000',
      'TotalAmount': '59000.00000',
    },
  ];

  final Set<int> selectedIndices = {};
  bool isSelectionMode = false;

  void _onLongPress(int index) {
    setState(() {
      isSelectionMode = true;
      selectedIndices.add(index);
    });
  }

  void _onTap(int index) {
    if (!isSelectionMode) return;

    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
        if (selectedIndices.isEmpty) {
          isSelectionMode = false;
        }
      } else {
        selectedIndices.add(index);
      }
    });
  }

  void _exitSelectionMode() {
    setState(() {
      isSelectionMode = false;
      selectedIndices.clear();
    });
  }

  void _SelectAll() {
    setState(() {
      isSelectionMode = true;
      selectedIndices.addAll(List.generate(items.length, (index) => index));
    });
  }

  void _unSelectAll() {
    setState(() {
      isSelectionMode = true;
      selectedIndices.clear();
    });
  }

  void _delete(List<int> indicesToRemove) {
    setState(() {
      for (int index in indicesToRemove) {
        items.remove(index);
      }
      if (selectedIndices.isEmpty) {
        isSelectionMode = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isSelectionMode
              ? '${selectedIndices.length} Selected'
              : GlobalText.SD_PI,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        actions: isSelectionMode
            ? [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _delete(selectedIndices.toList());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.verified),
                  onPressed: selectedIndices.length == items.length
                      ? _unSelectAll
                      : _SelectAll,
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _exitSelectionMode,
                ),
              ]
            : null,
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
                  final isSelected = selectedIndices.contains(index);
                  return GestureDetector(
                    onLongPress: () => _onLongPress(index),
                    onTap: () {
                      _onTap(index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PIV_detailsScreen(items)));
                    },
                    child: Card(
                      elevation: 3,
                      color: isSelected ? Colors.blueGrey.shade100 : null,
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
                  items['PerformaInvoiceNo'],
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
              width: 90,
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
                      backgroundColor: items['Status'] == 'Active'
                          ? Colors.green
                          : Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      items['Status'],
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
            Icon(Icons.person, color: GlobalColor.primaryColor),
            SizedBox(width: 5),
            Flexible(
                child: Text(
              items['CustomerName'],
              softWrap: true,
              overflow: TextOverflow.fade,
            )),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.currency_rupee, color: GlobalColor.primaryColor),
            SizedBox(width: 5),
            Text(
              items['InvoiceAmount'],
              maxLines: 2,
            ),
          ],
        ),
      ],
    ),
  );
}
