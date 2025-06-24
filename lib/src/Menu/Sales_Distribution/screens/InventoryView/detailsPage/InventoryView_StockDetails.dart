import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class InventoryView_StockDetails extends StatelessWidget {
  final List<Map<String, dynamic>> stockDetails;
  const InventoryView_StockDetails({super.key, required this.stockDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ...stockDetails.map((item) => _buildStockDetailsCard(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildStockDetailsCard(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type with icon
            Row(
              children: [
                Icon(Icons.warehouse, color: GlobalColor.primaryColor),
                SizedBox(width: 8),
                Text(
                  item['Type'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Open & Reserve
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabelValue('Open', item['Open'], Icons.inventory_2),
                _buildLabelValue('Reserve', item['Reserve'], Icons.lock),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelValue(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: GlobalColor.primaryColor, size: 18),
        SizedBox(width: 6),
        Text(
          "$label: ",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
