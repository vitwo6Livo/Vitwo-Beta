import 'package:flutter/material.dart';
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
    {
      'ItemCode': '210045401',
      'ItemName': 'Carvaan Mini Legends kannada - Sunset Red',
      'Type': 'FG Trading',
      'TotalQty': '1,425.574',
      'UOM': 'PCS',
      'ValuationClass': 'V',
      'Price(MW)': '289.29063',
      'TotalValue': '412,403.77590',
      'CreatedBy': 'Abhilash Agarwal',
    },
    {
      'ItemCode': '210006541',
      'ItemName': 'Carvaan Mini Legends kannada - Sunset Red',
      'Type': 'FG Trading',
      'TotalQty': '1,425.574',
      'UOM': 'PCS',
      'ValuationClass': 'V',
      'Price(MW)': '289.29063',
      'TotalValue': '412,403.77590',
      'CreatedBy': 'Somdutta Sengupta',
    },
    {
      'ItemCode': '44000008',
      'ItemName': 'Repairing Service',
      'Type': 'Service Purchase',
      'TotalQty': '900.000',
      'UOM': 'hour',
      'ValuationClass': '0',
      'Price(MW)': '	300.00000',
      'TotalValue': '270,000.00000',
      'CreatedBy': 'Sonie Kushwaha',
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
                    onTap: () {},
                    child: Card(
                      elevation: 3,
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[index]['ItemCode'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    items[index]['Type'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Item Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(items[index]['ItemName'].length > 20
                                          ? '${items[index]['ItemName'].substring(0, 25)}...'
                                          : items[index]['ItemName']),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Total Qty',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(items[index]['TotalQty']),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price(MW)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(items[index]['Price(MW)']),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Total Value',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(items[index]['TotalValue']),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
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
