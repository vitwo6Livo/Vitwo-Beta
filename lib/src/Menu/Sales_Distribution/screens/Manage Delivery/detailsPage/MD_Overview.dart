import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class MD_Overview extends StatefulWidget {
  final List<Map<String, dynamic>> itemDetails;
  const MD_Overview({super.key, required this.itemDetails});

  @override
  State<MD_Overview> createState() => _MD_OverviewState();
}

class _MD_OverviewState extends State<MD_Overview> {
  List<String> option = [
    'None',
    'Create Invoice',
    'Create Delivery',
    'Close SO'
  ];
  String dropdownvalue = 'None';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> generalDetails =
        widget.itemDetails.isNotEmpty ? widget.itemDetails[0] : {};

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            _buildHeader('Items'),
            const SizedBox(height: 10),
            ...widget.itemDetails
                .map((item) => _buildItemDetails(item))
                .toList(),
            const SizedBox(height: 20),
            _buildHeader('Customer Details'),
            const SizedBox(height: 10),
            _buildCustomerDetails(generalDetails),
            const SizedBox(height: 20),
            _buildHeader('Contact Info'),
            const SizedBox(height: 10),
            _buildContactInfo(generalDetails),
            const SizedBox(height: 20),
            _buildHeader('Other Details'),
            const SizedBox(height: 10),
            _buildOtherDetails(generalDetails),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  _buildHeader(String header) {
    return Text(header,
        style: TextStyle(
            color: GlobalColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20));
  }

  _buildCustomerDetails(Map<String, dynamic> customer) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: GlobalColor.primaryColor),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        customer['CustomerName'],
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.abc, color: GlobalColor.primaryColor),
                    SizedBox(width: 5),
                    Text(
                      customer['CustomerCode'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),

            // GSTIN and PAN Row
            Row(
              children: [
                Icon(Icons.account_balance, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  customer['GSTIN'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.credit_card, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  customer['PAN'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 15),

            // Billing Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.home, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    customer['BillingAddress'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            // Shipping Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.local_shipping, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    customer['ShippingAddress'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            // Place of Supply
            Row(
              children: [
                Icon(Icons.location_on, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    customer['PlaceOfSupply'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildContactInfo(Map<String, dynamic> contact) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.mail, color: GlobalColor.primaryColor),
                SizedBox(width: 10),
                Text(contact['email'],
                    style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone, color: GlobalColor.primaryColor),
                SizedBox(width: 10),
                Text(
                  contact['phone'],
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildOtherDetails(Map<String, dynamic> otherDetails) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.calendar_today, color: GlobalColor.primaryColor),
                    Text('Posting Date'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['PostingDate'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.receipt_long, color: GlobalColor.primaryColor),
                    Text(
                      'Delivery Date',
                    ),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['DeliveryDate'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.timer, color: GlobalColor.primaryColor),
                    Text('Functional Area'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['FunctionalArea'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.date_range, color: GlobalColor.primaryColor),
                    Text('Reference Document Link'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['ReferenceDocumentLink'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildItemDetails(Map<String, dynamic> item) {
    return Column(
      children: [
        Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                /// Top Row: Item Code & HSN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.abc, color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['ItemCode'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.format_list_numbered,
                            color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['Batch'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),

                /// Middle Row: Item Name & Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shopping_bag,
                            color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['ItemName'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.shopping_cart,
                            color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['QTY'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                        Icon(Icons.location_on,
                            color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['StorageLOC'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.warehouse, color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['Warehouse'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
