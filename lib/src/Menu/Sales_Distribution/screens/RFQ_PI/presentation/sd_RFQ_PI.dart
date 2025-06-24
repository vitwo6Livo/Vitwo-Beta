import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/RFQ_PI/detailsPage/rfq_DetailsPage.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_RFQ_PI extends StatefulWidget {
  const sd_RFQ_PI({super.key});

  @override
  State<sd_RFQ_PI> createState() => _sd_RFQ_PIState();
}

class _sd_RFQ_PIState extends State<sd_RFQ_PI> {
  List<Map<String, dynamic>> items = [
    {
      'RFQNumber': 'ORDER1749030632',
      'CustomerCode': '52500068',
      'CustomerName': 'Tata Consultancy Services Limited',
      'GSTIN': '29AAACR4849R2ZG',
      'PAN': 'AAACR4849R',
      'email': 'subhasis@vitwo.in',
      'phone': '7001451025',
      'ItemCode': '33000019',
      'ItemName': 'Freight',
      'HSN': '996519',
      'QTY': '2.000',
      'RequestType': 'Placeorder',
      'CreatedAt': '04-06-2025 15:20:32',
      'CreatedBy': 'Tata Consultancy Services Limited',
      'Status': true,
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
              : GlobalText.SD_RFQ_PI,
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
                  final isSelected = selectedIndices.contains(index);
                  return GestureDetector(
                    onLongPress: () => _onLongPress(index),
                    onTap: () {
                      _onTap(index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RFQ_detailsScreen(items)));
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
                _buildRowText(null, items['RFQNumber'], 19),
                SizedBox(height: 5),
                _buildRowText(Icons.event, items['CreatedAt'], null),
              ],
            ),
            _buildStatusIndicator(items['Status'])
          ],
        ),
        SizedBox(height: 15),
        _buildRow(Icons.person, items['CustomerName']),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRowText(Icons.abc, items['CustomerCode'], null),
            SizedBox(height: 10),
            _buildRowText(
                Icons.shopping_cart_checkout, items['RequestType'], null),
          ],
        ),
      ],
    ),
  );
}

_buildStatusIndicator(value) {
  return Container(
    height: 42,
    width: value ? 80 : 100,
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
            backgroundColor: value ? Colors.green : Colors.red,
          ),
          SizedBox(width: 10),
          Text(
            value ? 'Active' : 'In Active',
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
