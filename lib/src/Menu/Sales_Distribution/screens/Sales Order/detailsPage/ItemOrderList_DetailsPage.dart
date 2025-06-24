import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class ItemOrderList_DetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemOrderList_DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final labelStyle =
        TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]);
    final valueStyle =
        const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

    Widget buildRowIcon(IconData icon, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: GlobalColor.primaryColor,
            ),
            SizedBox(width: 5),
            Text(value, style: valueStyle),
          ],
        ),
      );
    }

    Widget buildRow(String label, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: labelStyle),
            SizedBox(width: 5),
            Text(value, style: valueStyle),
          ],
        ),
      );
    }

    Widget buildSection(List<Widget> children) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: children),
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Item Order Details',
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
          backgroundColor: GlobalColor.primaryColor,
          iconTheme: IconThemeData(
            color: GlobalColor.appBarTextColor,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader('Sales Order Info'),
            buildSection([
              buildRowIcon(Icons.receipt, item['soNumber']),
              buildRowIcon(Icons.event, item['soDate']),
              buildRowIcon(Icons.local_shipping, item['deliveryDate']),
            ]),
            _buildHeader('Customer Details'),
            buildSection([
              buildRowIcon(Icons.person, item['CustomerName']),
              buildRowIcon(Icons.abc, item['CustomerCode']),
            ]),
            _buildHeader('Item Details'),
            buildSection([
              buildRowIcon(Icons.code, item['itemCode']),
              buildRowIcon(Icons.shopping_bag, item['itemName']),
              buildRowIcon(Icons.shopping_cart, item['QTY']),
            ]),
            _buildHeader('Price & Taxes'),
            buildSection([
              buildRow('UOM', item['UOM']),
              buildRow('Tax %', item['Tax_%']),
              buildRow('Discount %', item['Discount_%']),
              buildRow('Total Price', item['TotalPrice']),
            ]),
            _buildHeader('Other Info'),
            buildSection([buildRow('Created By', item['CreatedBy'])]),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: GlobalColor.primaryColor)),
      ],
    );
  }
}
