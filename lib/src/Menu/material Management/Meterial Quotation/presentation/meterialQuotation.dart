import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class MaterialQuotation extends StatelessWidget {
  const MaterialQuotation({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'RFQ_Number': 'PR2506032/2',
        'Vendor-Response_Ratio': '0/4',
        'Deadline_Date': '04-06-2025',
        'Created_By': 'Arif',
      },
      {
        'RFQ_Number': 'PR2506032/3',
        'Vendor-Response_Ratio': '1/4',
        'Deadline_Date': '05-06-2025',
        'Created_By': 'Mamoon',
      },
      {
        'RFQ_Number': 'PR2506032/4',
        'Vendor-Response_Ratio': '2/4',
        'Deadline_Date': '06-06-2025',
        'Created_By': 'Pritom',
      },
      {
        'RFQ_Number': 'PR2506032/5',
        'Vendor-Response_Ratio': '3/4',
        'Deadline_Date': '07-06-2025',
        'Created_By': 'Nitesh',
      },
      {
        'RFQ_Number': 'PR2506032/6',
        'Vendor-Response_Ratio': '4/4',
        'Deadline_Date': '08-06-2025',
        'Created_By': 'Soni',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Quotation',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['RFQ_Number'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                  // Text(
                                  //   items[index]['PR_Code'],
                                  //   maxLines: 2,
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.view_stream_outlined),
                                  SizedBox(width: 5),
                                  Text(items[index]['Vendor-Response_Ratio']),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.hourglass_bottom),
                                  SizedBox(width: 5),
                                  Text(items[index]['Deadline_Date']),
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
                                  Text(items[index]['Created_By'], maxLines: 2),
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
