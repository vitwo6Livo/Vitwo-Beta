import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class IV_Overview extends StatefulWidget {
  final List<Map<String, dynamic>> itemDetails;
  const IV_Overview({super.key, required this.itemDetails});

  @override
  State<IV_Overview> createState() => _IV_OverviewState();
}

class _IV_OverviewState extends State<IV_Overview> {
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
                    Text('Invoice Date'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['InvoiceDate'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.receipt_long, color: GlobalColor.primaryColor),
                    Text(
                      'Invoice Time',
                    ),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['InvoiceTime'],
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
                    Text('Creadit Period'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['CreditPeriod'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.date_range, color: GlobalColor.primaryColor),
                    Text('Sales Person'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['SalesPerson'],
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
                    // Icon(Icons.receipt, color: GlobalColor.primaryColor),
                    Text('Compliance Invoice Type'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['ComplianceInvoiceType'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.link, color: GlobalColor.primaryColor),
                    Text('Functional Area'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['FunctionalArea'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
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
        GestureDetector(
          onTap: () {
            _buildBottomSheetView(item);
          },
          child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  /// Top Row: Item Code & HSN
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Icon(Icons.abc, color: GlobalColor.primaryColor),
                  //         SizedBox(width: 6),
                  //         Text(
                  //           item['itemCode'],
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Icon(Icons.receipt_long,
                  //             color: GlobalColor.primaryColor),
                  //         SizedBox(width: 6),
                  //         Text(
                  //           item['HSN'],
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 15),

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
                      Row(
                        children: [
                          Icon(Icons.shopping_cart,
                              color: GlobalColor.primaryColor),
                          SizedBox(width: 6),
                          Text(
                            item['QTY'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: GlobalColor.primaryColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildBottomSheetView(Map<String, dynamic> itemDetails) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25),
            topStart: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) => Container(
            padding: EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              bottom: 30,
              top: 8,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            'Item Details',
                            style: TextStyle(
                                color: GlobalColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.abc, color: GlobalColor.primaryColor),
                              SizedBox(width: 6),
                              Text(
                                itemDetails['ItemCode'],
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
                                itemDetails['HSN'],
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
                          Icon(Icons.shopping_bag,
                              color: GlobalColor.primaryColor),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              itemDetails['ItemName'],
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
                                itemDetails['QTY'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      _buildIconRow('Currency', itemDetails['Currency']),
                      _buildIconRow('Unit Price',
                          '${itemDetails['Currency']} ${itemDetails['Rate']}'),
                      _buildIconRow('Base Amount',
                          '${itemDetails['Currency']} ${itemDetails['BaseAmount']}'),
                      _buildIconRow('Discount',
                          '${itemDetails['Currency']} ${itemDetails['Discount']}'),
                      _buildIconRow('Taxable Amount',
                          '${itemDetails['Currency']} ${itemDetails['TaxableAmount']}'),
                      _buildIconRow('GST %', '${itemDetails['GST_%']} %'),
                      _buildIconRow('GST Amount',
                          '${itemDetails['Currency']} ${itemDetails['GSTAmount']}'),
                      Divider(),
                      _buildIconRow('Total Amount',
                          '${itemDetails['Currency']} ${itemDetails['TotalAmount']}'),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              )
            ])));
  }

  Widget _buildIconRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
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
