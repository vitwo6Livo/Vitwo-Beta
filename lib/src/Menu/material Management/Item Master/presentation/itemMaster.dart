import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class ItemMaster extends StatelessWidget {
  const ItemMaster({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'Item-Code': '22000208',
        'Item_name': 'Civil Construction Services',
        'Group_name': 'Technical service',
        'Created_by': 'Arpan Bera',
        'price': '360',
        'Status': 'Active',
      },
      {
        'Item-Code': '19000043',
        'Item_name': 'Hp charger',
        'Group_name': 'Electrical',
        'Created_by': 'Nitesh Kumar Verma',
        'price': '400',
        'Status': 'Active',
      },
      {
        'Item-Code': '33000039',
        'Item_name': 'Consultancy Charges',
        'Group_name': 'SAAS',
        'Created_by': 'Sudip Mukherjee',
        'price': '18600',
        'Status': 'Active',
      },
      {
        'Item-Code': '22000210',
        'Item_name': 'Civil Construction Services',
        'Group_name': 'Technical service',
        'Created_by': 'Arpan Bera',
        'price': '1500',
        'Status': 'Active',
      },
      {
        'Item-Code': '22000211',
        'Item_name': 'Civil Construction Services',
        'Group_name': 'Technical service',
        'Created_by': 'Arpan Bera',
        'price': '800',
        'Status': 'Active',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Master',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Card(
                      elevation: 5,
                      // color: Colors.blueGrey.shade100,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index]['Item-Code'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: items[index]['Status'] == 'Active'
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    items[index]['Status'],
                                    style: TextStyle(color: Colors.white),
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
                                    Icon(Icons.shopping_bag),
                                    SizedBox(width: 5),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 120),
                                      child: Text(
                                        items[index]['Item_name'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.category),
                                    SizedBox(width: 5),
                                    Text(items[index]['Group_name']),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(width: 5),
                                    Text(items[index]['Created_by'],
                                        maxLines: 2),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(Icons.payments_outlined),
                                    Text("₹"),
                                    // SizedBox(width: 5),
                                    Text(items[index]['price'], maxLines: 2),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
