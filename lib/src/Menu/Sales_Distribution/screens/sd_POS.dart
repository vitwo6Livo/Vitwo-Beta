import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class sd_POS extends StatelessWidget {
  final List<String> categories = [
    "All",
    "FG Mini",
    "Speaker FM",
    "Portable Speaker"
  ];

  final List<Map<String, dynamic>> products = List.generate(10, (index) {
    return {
      "name": "Product ${index + 1}",
      "price": 5000 + (index * 1000),
      "stock": index % 3 == 0 ? "Out of stock" : "In stock",
    };
  });

  final List<Map<String, dynamic>> items = [
    {"product": "iPhone X", "quantity": 1, "total": 64000},
    {"product": "Apple", "quantity": 2, "total": 10000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Goods Invoice',
            style: TextStyle(color: GlobalColor.appBarTextColor)),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomerInfo(),
            const SizedBox(height: 20),
            Text("Items Info", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildItemList(),
            const SizedBox(height: 20),
            _buildFilterTabs(),
            const SizedBox(height: 10),
            _buildProductGrid(),
            const SizedBox(height: 30), // Space for buttons at bottom
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: Text("Cancel",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Payment",
                    style: TextStyle(color: GlobalColor.primaryColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Customer",
                iconColor: GlobalColor.primaryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: GlobalColor.primaryColor,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: GlobalColor.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(15)),
              ),
              items: ["Customer A", "Customer B"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Sales Person",
                iconColor: GlobalColor.primaryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: GlobalColor.primaryColor,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: GlobalColor.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(15)),
              ),
              items: ["Sales 1", "Sales 2"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                Text("Walk In Customer"),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Barcode Scanner",
                hintText: "Enter item code and batch number...",
                iconColor: GlobalColor.primaryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: GlobalColor.primaryColor,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: GlobalColor.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ...items.map((item) => ListTile(
                  title: Text(item['product']),
                  subtitle: Text("Qty: ${item['quantity']}"),
                  trailing: Text(
                    "₹${item['total']}",
                    style: TextStyle(fontSize: 16),
                  ),
                )),
            Divider(),
            _buildAmountRow("Sub Total", "₹74,000"),
            _buildAmountRow("Total Discount", "₹0.00"),
            _buildAmountRow("Total Amount", "₹74,000", bold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: bold ? TextStyle(fontWeight: FontWeight.bold) : null),
          Text(value,
              style: bold ? TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((cat) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(cat),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset('assets/pictures/vitwoGoods.PNG',
                        fit: BoxFit.contain)), // replace with your asset
                Text(product['name'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹${product['price']}"),
                Text(
                  product['stock'],
                  style: TextStyle(
                    color: product['stock'] == "Out of stock"
                        ? Colors.red
                        : Colors.green,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
