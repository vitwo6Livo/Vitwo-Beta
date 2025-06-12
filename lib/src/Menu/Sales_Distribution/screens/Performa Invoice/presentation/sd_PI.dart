// import 'package:flutter/material.dart';
// import 'package:vitwo_beta/src/constants/colors.dart';
// import 'package:vitwo_beta/src/constants/text.dart';

// class sd_PI extends StatefulWidget {
//   const sd_PI({super.key});

//   @override
//   State<sd_PI> createState() => _sd_PIState();
// }

// class _sd_PIState extends State<sd_PI> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           GlobalText.SD_PI,
//           style: TextStyle(color: GlobalColor.appBarTextColor),
//         ),
//         backgroundColor: GlobalColor.appBarColor,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
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
      'Performa_Invoice_No': '174850471171',
      'Customer_Name': 'MY JIO MART	',
      'Invoice_Amount': '59,000.00000',
      'Created_At': '29-05-2025',
      'Created_By': 'SUBHASIS SANTRA',
      'Status': 'Active',
    },
    {
      'Performa_Invoice_No': '174850471171',
      'Customer_Name': 'MY JIO MART	',
      'Invoice_Amount': '3249.00000',
      'Created_At': '29-05-2025',
      'Created_By': 'SUBHASIS SANTRA',
      'Status': 'Closed',
    },
    {
      'Performa_Invoice_No': '174850471171',
      'Customer_Name': 'MY JIO MART	',
      'Invoice_Amount': '39000.00000',
      'Created_At': '29-05-2025',
      'Created_By': 'SUBHASIS SANTRA',
      'Status': 'Active',
    },
    {
      'Performa_Invoice_No': '174850471171',
      'Customer_Name': 'MY JIO MART	',
      'Invoice_Amount': '8000.00000',
      'Created_At': '29-05-2025',
      'Created_By': 'SUBHASIS SANTRA',
      'Status': 'Closed',
    },
    {
      'Performa_Invoice_No': '174850471171',
      'Customer_Name': 'MY JIO MART	',
      'Invoice_Amount': '59,000.00000',
      'Created_At': '29-05-2025',
      'Created_By': 'SUBHASIS SANTRA',
      'Status': 'Active',
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
                    onTap: () => _onTap(index),
                    child: Card(
                      elevation: 3,
                      color: isSelected ? Colors.blueGrey.shade100 : null,
                      child: Padding(
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
                                      items[index]['Performa_Invoice_No'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      items[index]['Created_At'],
                                      maxLines: 2,
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
                                          backgroundColor:
                                              items[index]['Status'] == 'Active'
                                                  ? Colors.green
                                                  : Colors.red,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          items[index]['Status'],
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer Name',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Customer_Name']),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Created By : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(items[index]['Created_By'], maxLines: 2),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Invoice Amount : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(
                                  items[index]['Invoice_Amount'],
                                  maxLines: 2,
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
