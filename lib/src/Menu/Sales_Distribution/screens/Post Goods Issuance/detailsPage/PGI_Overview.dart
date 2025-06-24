import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class PGI_Overview extends StatefulWidget {
  final List<Map<String, dynamic>> itemDetails;
  const PGI_Overview({super.key, required this.itemDetails});

  @override
  State<PGI_Overview> createState() => _PGI_OverviewState();
}

class _PGI_OverviewState extends State<PGI_Overview> {
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
            _buildHeader('Other Info'),
            const SizedBox(height: 10),
            _buildOtherInfo(generalDetails),
            const SizedBox(height: 20),
            _buildHeader('Other Details'),
            const SizedBox(height: 10),
            _buildOtherDetails(generalDetails),
            const SizedBox(height: 20),
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

  _buildOtherInfo(Map<String, dynamic> otherDetails) {
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
                    Text('PGI Posting Date'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['PGIPostingDate'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.receipt_long, color: GlobalColor.primaryColor),
                    Text(
                      'Profit Center',
                    ),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['ProfitCenter'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer PO Number',
                    ),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['CustomerPO'],
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
                          item['BatchNO'],
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
                          item['ItemName'].toString().length > 23
                              ? '${item['ItemName'].toString().substring(0, 23)}...'
                              : item['ItemName'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
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
                          item['StorageLocation'],
                          style: TextStyle(fontWeight: FontWeight.bold),
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

  _buildOtherDetails(Map<String, dynamic> otherDetail) {
    return Card(
        elevation: 3,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: GlobalColor.primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    otherDetail['CreatedBy'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ])));
  }
}
