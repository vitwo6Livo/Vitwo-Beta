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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              _buildHeader('Item Details'),
              SizedBox(height: 10),
              _buildItemDetails(itemDetails[0]),
              SizedBox(height: 20),

              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildHeader('Create '),
                        _buildDropDownOption(),
                      ]),
                  SizedBox(height: 15),
                  _buildSlideToAct(dropdownvalue),
                ],
              ),

              SizedBox(height: 20),

              // Spacing from floating button
              SizedBox(height: 60),
            ],
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  customer['CustomerName'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Customer Code'),
                    SizedBox(height: 5),
                    Text(
                      customer['CustomerCode'],
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
                    Text('GSTIN'),
                    SizedBox(height: 5),
                    Text(
                      customer['GSTIN'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('PAN'),
                    SizedBox(height: 5),
                    Text(
                      customer['PAN'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Billing Address'),
                SizedBox(height: 5),
                Text(
                  customer['BillingAddress'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shipping Address'),
                SizedBox(height: 5),
                Text(
                  customer['ShippingAddress'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Place of Supply'),
                    SizedBox(height: 5),
                    Text(
                      customer['PlaceOfSupply'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
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
                Icon(Icons.mail),
                SizedBox(width: 5),
                Text('Email : '),
                SizedBox(width: 5),
                Text(contact['email'])
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 5),
                Text('Phone : '),
                SizedBox(width: 5),
                Text(contact['phone']),
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
                    Text('Customer Order No.'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['customerOrderNo'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Posting Date'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['postingDate'],
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
                    Text('Posting Time'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['postingTime'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Delivery Date'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['deliveryDate'],
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
                    Text('Valid Till'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['validTill'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Credit Period'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['creditPeriod'],
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
                    Text('Sales Person'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['salesPerson'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Functional Area'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['functionalArea'],
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
                    Text('Compliance Invoice Type'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['complianceInvoiceType'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Reference Document Link'),
                    SizedBox(height: 5),
                    Text(
                      otherDetails['referenceDocumentLink'],
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
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            // height: isExpanded ? 330 : 110,
            margin: EdgeInsets.all(5),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Item Code : '),
                            Text(
                              item['itemCode'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('HSN : '),
                            Text(
                              item['HSN'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['itemName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text('QTY : '),
                            Text(
                              item['QTY'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    isExpanded ? _buildExpandView(item) : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildExpandView(Map<String, dynamic> itemDetails) {
    return Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Currency'),
            Text(
              itemDetails['Currency'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Unit Price'),
            Text(
              'INR ${itemDetails['unitPrice']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Base Amount'),
            Text(
              'INR ${itemDetails['baseAmount']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Discount'),
            Text(
              'INR ${itemDetails['Discount']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Taxable Amount'),
            Text(
              'INR ${itemDetails['taxableAmount']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST %'),
            Text(
              'INR ${itemDetails['gst_%']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST Amount(INR)'),
            Text(
              'INR ${itemDetails['gstAmount']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Amount'),
            Text(
              'INR ${itemDetails['totalAmount']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
