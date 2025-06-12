import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_SO_DoneJobs extends StatefulWidget {
  const sd_SO_DoneJobs({super.key});

  @override
  State<sd_SO_DoneJobs> createState() => _sd_SO_DoneJobsState();
}

class _sd_SO_DoneJobsState extends State<sd_SO_DoneJobs> {
  List<Map<String, dynamic>> items = [
    {
      'SO_Number': 'SO2506021',
      'Customer_PO': 'CUSSS2802',
      'SO_Date': '06-06-2025',
      'Created_Date': '06-06-2025',
      'Delivery_Date': '06-06-2025',
      'Customer_Code': '52500041',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Type': 'PROJECT',
      'Total_Amount': '4,047.40000',
      'Total_Item': '1.000',
      'JO_Status': 'Done',
    },
    {
      'SO_Number': 'SO2506021',
      'Customer_PO': 'CUSSS2802',
      'SO_Date': '06-06-2025',
      'Created_Date': '06-06-2025',
      'Delivery_Date': '06-06-2025',
      'Customer_Code': '52500041',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Type': 'PROJECT',
      'Total_Amount': '4,047.40000',
      'Total_Item': '1.000',
      'JO_Status': 'Done',
    },
    {
      'SO_Number': 'SO2506021',
      'Customer_PO': 'CUSSS2802',
      'SO_Date': '06-06-2025',
      'Created_Date': '06-06-2025',
      'Delivery_Date': '06-06-2025',
      'Customer_Code': '52500041',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Type': 'PROJECT',
      'Total_Amount': '4,047.40000',
      'Total_Item': '1.000',
      'JO_Status': 'Done',
    },
    {
      'SO_Number': 'SO2506021',
      'Customer_PO': 'CUSSS2802',
      'SO_Date': '06-06-2025',
      'Created_Date': '06-06-2025',
      'Delivery_Date': '06-06-2025',
      'Customer_Code': '52500041',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Type': 'PROJECT',
      'Total_Amount': '4,047.40000',
      'Total_Item': '1.000',
      'JO_Status': 'Done',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index]['SO_Number'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                                Container(
                                  height: 42,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: GlobalColor.OptionsColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.blueAccent,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          items[index]['JO_Status'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Container(
                                //   height: 42,
                                //   width: 100,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     color: GlobalColor.OptionsColor,
                                //   ),
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(9.0),
                                //     child: Row(
                                //       children: [
                                //         CircleAvatar(
                                //           radius: 5,
                                //           backgroundColor:
                                //               items[index]['Status'] == 'Open'
                                //                   ? Colors.blueAccent
                                //                   : null,
                                //         ),
                                //         SizedBox(width: 10),
                                //         Text(
                                //           items[index]['Status'],
                                //           style: TextStyle(
                                //             color: Colors.white,
                                //             fontSize: 13,
                                //             fontWeight: FontWeight.bold,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Customer Name',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(
                                      items[index]['Customer_Name'].length > 25
                                          ? '${items[index]['Customer_Name'].substring(0, 25)}...'
                                          : items[index]['Customer_Name'],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Customer Code',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Customer_Code']),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Customer PO',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Customer_PO']),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Delivery Date',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Delivery_Date']),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Type : ',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(
                                  items[index]['Type'],
                                  style: TextStyle(
                                    color:
                                        items[index]['Type'] == 'PROJECT'
                                            ? Colors.orange
                                            : items[index]['Type'] == 'GOODS'
                                            ? Colors.blueAccent
                                            : Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Total_Amount']),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Total Item',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(items[index]['Total_Item']),
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
