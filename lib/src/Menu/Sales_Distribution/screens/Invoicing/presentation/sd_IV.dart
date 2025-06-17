import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class sd_IV extends StatefulWidget {
  const sd_IV({super.key});

  @override
  State<sd_IV> createState() => _sd_IVState();
}

class _sd_IVState extends State<sd_IV> {
  List<Map<String, dynamic>> items = [
    {
      'Invoice_No': 'INV-0000000855',
      'Invoice_Date': '09-06-2025',
      'Status': 'Approved',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.00',
      'Due_in_Days': '40',
      'Created_By': 'Anjali Rana',
    },
    {
      'Invoice_No': 'INV-0000000856',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.00',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': 'Received',
      'Created_By': 'Anjali Rana',
      'Status': 'Approved',
    },
    {
      'Invoice_No': 'INV-0000000857',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.00',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '10',
      'Created_By': 'Anjali Rana',
      'Status': 'Approved',
    },
    {
      'Invoice_No': 'INV-0000000858',
      'Customer_Name': 'MAC MAYBELLINE INTERNATIONAL SALON',
      'Invoice_Amount': '54500.00',
      'Invoice_Date': '09-06-2025',
      'Due_in_Days': '',
      'Created_By': 'Anjali Rana',
      'Status': 'Reversed',
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
          ? 'Due in $parsed days'
          : parsed <= 10 && parsed > 0
              ? 'Overdue by $parsed days'
              : '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalText.SD_IV,
            style: TextStyle(color: GlobalColor.appBarTextColor)),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Row(
              children: [
                Expanded(child: SearchBarWidget()),
                const SizedBox(width: 8),
                exportButton(),
                const SizedBox(width: 8),
                filterButton(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final item = items[index];
                final dueText = item['Due_in_Days'];
                final dueColor = _getDueInDaysColor(dueText);
                final dueLabel = _getDueText(dueText);

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
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
                                  item['Invoice_No'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(item['Invoice_Date']),
                              ],
                            ),
                            Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: GlobalColor.OptionsColor,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor:
                                        item['Status'] == 'Approved'
                                            ? Colors.green
                                            : item['Status'] == 'Reversed'
                                                ? Colors.red
                                                : Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item['Status'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        _buildInfoRow(
                            'Customer Name : ', item['Customer_Name'] ?? '',
                            maxLength: 24),
                        const SizedBox(height: 10),
                        _buildInfoRow(
                            'Invoice Amount : ', item['Invoice_Amount'] ?? ''),
                        const SizedBox(height: 10),
                        _buildInfoRow(
                            'Created By : ', item['Created_By'] ?? ''),
                        items[index]['Due_in_Days'] == ''
                            ? SizedBox()
                            : Row(
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
                              ),
                      ],
                    ),
                  ),
                );
              },
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

  Widget _buildInfoRow(String label, String value, {int? maxLength}) {
    final displayValue = maxLength != null && value.length > maxLength
        ? '${value.substring(0, maxLength)}...'
        : value;

    return Row(
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
        Expanded(child: Text(displayValue)),
      ],
    );
  }
}
