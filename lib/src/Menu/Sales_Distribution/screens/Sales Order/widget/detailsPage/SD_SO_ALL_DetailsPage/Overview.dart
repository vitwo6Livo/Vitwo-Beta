import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<Map<String, dynamic>> customerDetails = [
    {
      'CustomerName': 'Mindtree Limited',
      'CustomerCode': '52300001',
      'GSTIN': '33AABCM8839K1Z4',
      'PAN': 'AABCM8839K',
      'BillingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'ShippingAddress':
          'Hardy block, 5th Floor, Rajiv Gandhi salai, 600113, Taramani, Taramani, Chennai, Tamil Nadu',
      'PlaceOfSupply': '--',
    },
  ];
  List<Map<String, dynamic>> contactDetails = [
    {
      'email': 'salim.lab3@gmail.com',
      'phone': '9836813031',
    },
  ];
  List<Map<String, dynamic>> otherDetails = [
    {
      'customerOrderNo': 'CN0068',
      'postingDate': '07-03-2025',
      'postingTime': '16:46',
      'deliveryDate': '07-03-2025',
      'validTill': '23-05-2025',
      'creditPeriod': '45',
      'salesPerson': 'Salim',
      'functionalArea': 'IT',
      'complianceInvoiceType': 'null',
      'referenceDocumentLink': 'No Attached File',
    },
  ];
  List<Map<String, dynamic>> itemDetails = [
    {
      'itemCode': '33000015',
      'itemName': 'Repairing Service',
      'HSN': '995419',
      'QTY': '2.000',
      'Currency': 'INR',
      'unitPrice': '1200.00000',
      'baseAmount': '2400.00000',
      'Discount': '0.00000',
      'taxableAmount': '2400.00000',
      'gst_%': '0.000',
      'gstAmount': '0.00000',
      'totalAmount': '2400.00000',
    },
  ];

  bool isExpanded = false;
  List<String> option = [
    'None',
    'Create Invoice',
    'Create Delivery',
    'Close SO'
  ];
  String dropdownvalue = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // Item Details
            _buildHeader('Items'),
            SizedBox(height: 10),
            ...itemDetails.map((item) => _buildItemDetails(item)).toList(),
            SizedBox(height: 20),

            // Customer info
            _buildHeader('Customer Details'),
            SizedBox(height: 10),
            _buildCustomerDetails(customerDetails[0]),
            SizedBox(height: 20),

            // Contact info
            _buildHeader('Contact Info'),
            SizedBox(height: 10),
            _buildContactInfo(contactDetails[0]),
            SizedBox(height: 20),

            // Other Details
            _buildHeader('Other Details'),
            SizedBox(height: 10),
            _buildOtherDetails(otherDetails[0]),
            SizedBox(height: 20),

            // Bottom spacing for floating action button
            SizedBox(height: 60),
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

  Widget _buildDropDownOption() {
    return DropdownButton<String>(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: option.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            dropdownvalue = newValue;
          });
        }
      },
    );
  }

  Widget _buildSlideToAct(String action) {
    if (action == 'None') return SizedBox();
    return SlideAction(
      outerColor: GlobalColor.primaryColor,
      sliderButtonIconSize: 20,
      sliderButtonIconPadding: 10,
      height: 60,
      textStyle: TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      innerColor: Colors.white,
      text: 'Slide to $action',
      submittedIcon: Icon(
        Icons.check,
        color: Colors.white,
      ),
      onSubmit: () {
        // Handle your action here
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: GlobalColor.primaryColor,
          content: Text(
            '$action Action Done',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ));
        Navigator.pop(context);
      },
    );
  }

  _buildCustomerDetails(Map<String, dynamic> customer) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Customer Name and Code Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: GlobalColor.primaryColor),
                    SizedBox(width: 5),
                    Text(
                      customer['CustomerName'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.code, color: GlobalColor.primaryColor),
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
            // Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.receipt_long, color: GlobalColor.primaryColor),
                    Text(
                      'Customer Order No',
                    ),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['customerOrderNo'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.calendar_today, color: GlobalColor.primaryColor),
                    Text('Posting Date'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['postingDate'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),

            // Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.access_time, color: GlobalColor.primaryColor),
                    Text('Posting Time'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['postingTime'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.local_shipping, color: GlobalColor.primaryColor),
                    Text('Delivery Date'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['deliveryDate'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),

            // Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.timer, color: GlobalColor.primaryColor),
                    Text('Valid Till'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['validTill'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.date_range, color: GlobalColor.primaryColor),
                    Text('Credit Period'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['creditPeriod'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),

            // Row 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.person, color: GlobalColor.primaryColor),
                    Text('Sales Person'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['salesPerson'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.business_center,
                    //     color: GlobalColor.primaryColor),
                    Text('Functional Area'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['functionalArea'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),

            // Row 5
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.receipt, color: GlobalColor.primaryColor),
                    Text('Compliance Invoice \nType'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['complianceInvoiceType'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon(Icons.link, color: GlobalColor.primaryColor),
                    Text('Reference Document \nLink'),
                    SizedBox(width: 5),
                    Text(
                      otherDetails['referenceDocumentLink'],
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                          Icon(Icons.qr_code, color: GlobalColor.primaryColor),
                          SizedBox(width: 6),
                          Text(
                            item['itemCode'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.numbers, color: GlobalColor.primaryColor),
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
                      Expanded(
                        child: Text(
                          item['itemName'],
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
                              Icon(Icons.qr_code,
                                  color: GlobalColor.primaryColor),
                              SizedBox(width: 6),
                              Text(
                                itemDetails['itemCode'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.numbers,
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
                          Expanded(
                            child: Text(
                              itemDetails['itemName'],
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
                      _buildIconRow(Icons.currency_exchange, 'Currency',
                          itemDetails['Currency']),
                      _buildIconRow(Icons.price_change, 'Unit Price',
                          'INR ${itemDetails['unitPrice']}'),
                      _buildIconRow(Icons.calculate, 'Base Amount',
                          'INR ${itemDetails['baseAmount']}'),
                      _buildIconRow(Icons.discount, 'Discount',
                          'INR ${itemDetails['Discount']}'),
                      _buildIconRow(Icons.receipt_long, 'Taxable Amount',
                          'INR ${itemDetails['taxableAmount']}'),
                      _buildIconRow(
                          Icons.percent, 'GST %', '${itemDetails['gst_%']} %'),
                      _buildIconRow(Icons.request_quote, 'GST Amount',
                          'INR ${itemDetails['gstAmount']}'),
                      Divider(),
                      _buildIconRow(Icons.attach_money, 'Total Amount',
                          'INR ${itemDetails['totalAmount']}'),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              )
            ])));
  }

  Widget _buildIconRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: GlobalColor.primaryColor, size: 20),
              SizedBox(width: 6),
              Text(label),
            ],
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
