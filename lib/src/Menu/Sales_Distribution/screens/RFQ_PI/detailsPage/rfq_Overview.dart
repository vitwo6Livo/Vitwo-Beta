import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class RFQ_Overview extends StatefulWidget {
  final List<Map<String, dynamic>> itemDetails;
  const RFQ_Overview({super.key, required this.itemDetails});

  @override
  State<RFQ_Overview> createState() => _RFQ_OverviewState();
}

class _RFQ_OverviewState extends State<RFQ_Overview> {
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

  // Widget _buildDropDownOption() {
  //   return DropdownButton<String>(
  //     value: dropdownvalue,
  //     icon: const Icon(Icons.keyboard_arrow_down),
  //     items: option.map((String item) {
  //       return DropdownMenuItem<String>(
  //         value: item,
  //         child: Text(item),
  //       );
  //     }).toList(),
  //     onChanged: (String? newValue) {
  //       if (newValue != null) {
  //         setState(() {
  //           dropdownvalue = newValue;
  //         });
  //       }
  //     },
  //   );
  // }

  // Widget _buildSlideToAct(String action) {
  //   if (action == 'None') return SizedBox();
  //   return SlideAction(
  //     outerColor: GlobalColor.primaryColor,
  //     sliderButtonIconSize: 20,
  //     sliderButtonIconPadding: 10,
  //     height: 60,
  //     textStyle: TextStyle(
  //         fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
  //     innerColor: Colors.white,
  //     text: 'Slide to $action',
  //     submittedIcon: Icon(
  //       Icons.check,
  //       color: Colors.white,
  //     ),
  //     onSubmit: () {
  //       // Handle your action here
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: GlobalColor.primaryColor,
  //         content: Text(
  //           '$action Action Done',
  //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  //         ),
  //       ));
  //       Navigator.pop(context);
  //     },
  //   );
  // }

  _buildCustomerDetails(Map<String, dynamic> customer) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Customer Name and Code Row
            Row(
              children: [
                Icon(Icons.person, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(
                  customer['CustomerName'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                        Icon(Icons.receipt_long,
                            color: GlobalColor.primaryColor),
                        SizedBox(width: 6),
                        Text(
                          item['HSN'],
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
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item['ItemName'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
