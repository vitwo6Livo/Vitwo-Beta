import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class MyItems extends StatelessWidget {
  const MyItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'Item-Code': '	11000418',
        'Item_name': 'PVC Pipe',
        'Group_name': 'test_po',
        'Created_by': 'Arpan Bera',
        'price': '360',
        'Status': 'Active',
      },
      {
        'Item-Code': '11000419',
        'Item_name': 'HDPE Pipe',
        'Group_name': 'test_po',
        'Created_by': 'Arpan Bera',
        'price': '400',
        'Status': 'Active',
      },
      {
        'Item-Code': '11000420',
        'Item_name': 'Copper Wire',
        'Group_name': 'test_po',
        'Created_by': 'Arpan Bera',
        'price': '3500',
        'Status': 'Inactive',
      },
      {
        'Item-Code': '11000421',
        'Item_name': 'Aluminium Sheet',
        'Group_name': 'test_po',
        'Created_by': 'Arpan Bera',
        'price': '1500',
        'Status': 'Active',
      },
      {
        'Item-Code': '11000422',
        'Item_name': 'Steel Rod',
        'Group_name': 'test_po',
        'Created_by': 'Arpan Bera',
        'price': '800',
        'Status': 'Active',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Items',
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
                  return Card(
                    elevation: 3,
                    color: Colors.blueGrey.shade100,
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
                                  Text(items[index]['Item_name']),
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
                                  Text(items[index]['Created_by'], maxLines: 2),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.paid_outlined),
                                  SizedBox(width: 5),
                                  Text(items[index]['price'], maxLines: 2),
                                ],
                              ),
                            ],
                          ),
                        ],
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
