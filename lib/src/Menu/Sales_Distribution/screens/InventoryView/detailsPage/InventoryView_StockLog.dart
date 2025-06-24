import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class InventoryView_StockLog extends StatefulWidget {
  final List<Map<String, dynamic>> stockLog;
  const InventoryView_StockLog({required this.stockLog, super.key});

  @override
  State<InventoryView_StockLog> createState() => _InventoryView_StockLogState();
}

class _InventoryView_StockLogState extends State<InventoryView_StockLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  ...widget.stockLog.map((item) => _buildStockLogCard(item)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockLogCard(Map<String, dynamic> stLog) {
    return GestureDetector(
      onTap: () => _buildBottomSheetView(stLog),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      stLog['DocumentNumber'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: GlobalColor.primaryColor, size: 16),
                      SizedBox(width: 4),
                      Text(stLog['Location'],
                          style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Item Name
              Row(
                children: [
                  Icon(Icons.shopping_bag,
                      color: GlobalColor.primaryColor, size: 18),
                  SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      stLog['ItemName'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Qty and UOM
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Qty: ${stLog['Qty']} ${stLog['UOM']}',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Text('Value: ₹${stLog['Value']}',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buildBottomSheetView(Map<String, dynamic> logDetails) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        context: context,
        builder: (context) => Container(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 40,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Text(
                            'Stock Log Details',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: GlobalColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildDetailRow(Icons.receipt_long_rounded,
                              'Document No', logDetails['DocumentNumber']),
                          _buildDetailRow(Icons.calendar_month, 'Posting Date',
                              logDetails['PostingDate']),
                          _buildDetailRow(Icons.location_on, 'Location',
                              logDetails['Location']),
                          _buildDetailRow(Icons.category, 'Item Group',
                              logDetails['ItemGroup']),
                          _buildDetailRow(
                              Icons.abc, 'Item Code', logDetails['ItemCode']),
                          _buildDetailRow(Icons.shopping_bag, 'Item Name',
                              logDetails['ItemName']),
                          _buildDetailRow(Icons.inventory, 'Movement Type',
                              logDetails['MovementType']),
                          _buildDetailRow(Icons.confirmation_number,
                              'Batch Number', logDetails['BatchNumber']),
                          _buildDetailRow(
                              Icons.scale, 'UOM', logDetails['UOM']),
                          _buildDetailRow(
                              Icons.numbers, 'Qty', logDetails['Qty']),
                          _buildDetailRow(Icons.price_check, 'Rate',
                              '₹${logDetails['Rate']}'),
                          _buildDetailRow(Icons.currency_rupee, 'Value',
                              '₹${logDetails['Value']}'),
                        ],
                      ),
                    ),
                  ))
            ])));
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: GlobalColor.primaryColor, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                SizedBox(height: 2),
                Text(value,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
