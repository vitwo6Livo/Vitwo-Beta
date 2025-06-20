import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/RFQ/presentation/details/RfqDetails.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class RequestForQuotationScreen extends StatefulWidget {
  const RequestForQuotationScreen({super.key});

  @override
  State<RequestForQuotationScreen> createState() =>
      _RequestForQuotationScreenState();
}

class _RequestForQuotationScreenState extends State<RequestForQuotationScreen> {
  List<Map<String, dynamic>> items = [
    {
      'RFQ_Code': 'PR2506032/2',
      'PR_Code': 'PR2506032',
      'Reference_Number': 'MRP1749538707',
      'Expected_Date': '04-06-2025',
      'Created_By': 'Mamoon',
      'Closing_Date': '04-06-2025',
      'Days_Left': '5',
    },
    {
      'RFQ_Code': 'PR2506032/2',
      'PR_Code': 'PR2506032',
      'Reference_Number': 'ABC123',
      'Expected_Date': '10-06-2025',
      'Created_By': 'Arif',
      'Closing_Date': '04-06-2025',
      'Days_Left': '0',
    },
    {
      'RFQ_Code': 'PR2506032/2',
      'PR_Code': 'PR2506032',
      'Reference_Number': 'MRP1749538707',
      'Expected_Date': '04-06-2025',
      'Created_By': 'Pritom',
      'Closing_Date': '04-06-2025',
      'Days_Left': '12',
    },
    {
      'RFQ_Code': 'PR2506032/2',
      'PR_Code': 'PR2506032',
      'Reference_Number': 'ABC123',
      'Expected_Date': '10-06-2025',
      'Created_By': 'Nitesh',
      'Closing_Date': '04-06-2025',
      'Days_Left': '30',
    },
    {
      'RFQ_Code': 'PR2506032/2',
      'PR_Code': 'PR2506032',
      'Reference_Number': 'MRP1749538707',
      'Expected_Date': '04-06-2025',
      'Created_By': 'Soni',
      'Closing_Date': '04-06-2025',
      'Days_Left': '2',
    },
    {
      'RFQ_Code': 'PR2506032/2',
      'PR_Code': 'PR2506032',
      'Reference_Number': 'ABC123',
      'Expected_Date': '10-06-2025',
      'Created_By': 'Piyush',
      'Closing_Date': '04-06-2025',
      'Days_Left': '8',
    },
  ];

  Color _getDueInDaysColor(String? due) {
    if (due == 'Received') return Colors.green;
    final parsed = int.tryParse(due ?? '');
    if (parsed != null) {
      if (parsed > 10) return Colors.green;
      if (parsed > 0 && parsed <= 10) return Colors.red;
    }
    return Colors.white;
  }

  String _getDueText(String? due) {
    if (due == 'Received') return 'Payment Received';
    final parsed = int.tryParse(due ?? '');
    if (parsed != null) {
      return parsed > 10
          ? '$parsed days Left'
          : parsed <= 10 && parsed > 0
              ? '$parsed days Left'
              : '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request For Quotation',
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
                  final dueText = items[index]['Days_Left'];
                  final dueColor = _getDueInDaysColor(dueText);
                  final dueLabel = _getDueText(dueText);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RfqDetailsScreen())); // Navigate to details screen
                      },
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index]['RFQ_Code'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle),
                                      SizedBox(width: 5),
                                      Text(items[index]['Reference_Number']),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.date_range),
                                      SizedBox(width: 5),
                                      Text(items[index]['Expected_Date']),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 5),
                                      Text(items[index]['Created_By'],
                                          maxLines: 2),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.last_page),
                                      SizedBox(width: 5),
                                      Text(items[index]['Closing_Date'],
                                          maxLines: 2),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: dueColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dueLabel,
                                      style: TextStyle(
                                        color: dueColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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
