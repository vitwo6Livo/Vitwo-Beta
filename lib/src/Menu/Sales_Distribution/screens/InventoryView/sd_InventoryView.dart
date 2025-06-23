import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/InventoryView/detailsPage/InventoryView_DetailsPage.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_InventoryView extends StatefulWidget {
  const sd_InventoryView({super.key});

  @override
  State<sd_InventoryView> createState() => _sd_InventoryViewState();
}

class _sd_InventoryViewState extends State<sd_InventoryView> {
  List<Map<String, dynamic>> items = [
    {
      'ItemCode': '21000001',
      'ItemName': 'Carvaan Mini Legends kannada - Sunset Red',
      'Type': 'FG Trading',
      'TotalQty': '1,425.574',
      'UOM': 'PCS',
      'ValuationClass': 'V',
      'Price(MW)': '289.29063',
      'TotalValue': '412,403.77590',
      'CreatedBy': 'Salim',
    },
  ];
  List<Map<String, dynamic>> stockDetails = [
    {
      'Type': 'RM-WH',
      'Open': '975.0000',
      'Reserve': '0.0000',
    },
    {
      'Type': 'FG-WH',
      'Open': '97.5690',
      'Reserve': '328.0000',
    },
    {
      'Type': 'FG-MKT',
      'Open': '25.0000',
      'Reserve': '0.0000',
    },
  ];
  List<Map<String, dynamic>> stockLog = [
    {
      'Location': 'Bengaluru',
      'PostingDate': '20-05-2025',
      'DocumentNumber': 'D1747738007535/1',
      'ItemGroup': 'FG Mini',
      'ItemCode': '21000001',
      'ItemName': 'Carvaan Mini Legends kannada - Sunset Red',
      'Type': 'FG Market Open',
      'BatchNumber': 'GRN1745218072500',
      'UOM': 'PCS',
      'MovementType': 'PGI',
      'Qty': '5.0000',
      'Rate': '289.29',
      'Value': '1,446.45',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_InventoryView,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InventoryView_DetailsScreen(
                                  stockDetails, stockLog)));
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

Widget _buildCardData(Map<String, dynamic> items) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item Code & Type
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              items['ItemCode'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                items['Type'],
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: GlobalColor.primaryColor,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),

        Row(
          children: [
            Icon(Icons.shopping_bag, color: GlobalColor.primaryColor, size: 20),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                items['ItemName'],
                style: TextStyle(fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
                Icon(Icons.inventory_2,
                    color: GlobalColor.primaryColor, size: 20),
                SizedBox(width: 6),
                Text(
                  '${items['TotalQty']} ${items['UOM']}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Price(MW): ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  '₹${items['Price(MW)']}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.currency_rupee,
                color: GlobalColor.primaryColor, size: 18),
            SizedBox(width: 4),
            Text(
              items['TotalValue'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}
