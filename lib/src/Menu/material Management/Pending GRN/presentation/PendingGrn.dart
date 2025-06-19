import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/global/exportbutton.dart';
import 'package:vitwo_beta/src/global/filterButton.dart';
import 'package:vitwo_beta/src/global/searchBar.dart';

class PendingGRN extends StatelessWidget {
  const PendingGRN({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'Invoice_Number': 'FADBB02600029283',
        'Vendor_Name': 'FLIPKART INTERNET PRIVATE LIMITED',
        'Created_By': 'Nitesh Kumar Verma',
        'GST_No': '29AACCF0683K1ZD',
        'Price': 'INR 69,720',
      },
      {
        'Invoice_Number': 'FADBB02600029284',
        'Vendor_Name': 'AMAZON SELLER SERVICES PRIVATE LIMITED',
        'Created_By': 'Amit Kumar Singh',
        'GST_No': '27AACCF0683K1ZD',
        'Price': 'INR 45,000',
      },
      {
        'Invoice_Number': 'FADBB02600029285',
        'Vendor_Name': 'MY JIO MART',
        'Created_By': 'Rahul Sharma',
        'GST_No': '22AACCF0683K1ZD',
        'Price': 'INR 150,000',
      },
      {
        'Invoice_Number': 'FADBB02600029286',
        'Vendor_Name': 'SWISS TIME HOUSE',
        'Created_By': 'Priya Gupta',
        'GST_No': '29AACCF0683K1ZD',
        'Price': 'INR 398,720',
      },
      {
        'Invoice_Number': 'FADBB02600029287',
        'Vendor_Name': 'WATCHES GALORE',
        'Created_By': 'Suresh Kumar Yadav',
        'GST_No': '29AACCF0683K1ZD',
        'Price': 'INR 300,000',
      }
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalColor.appBarColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Pending GRN',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SearchBarWidget(),
                exportButton(),
                SizedBox(width: 10),
                filterButton(),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Card(
                        elevation: 5,
                        // color: Colors.blueGrey.shade100,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[index]['Invoice_Number'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.shopping_bag),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          items[index]['Vendor_Name'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          items[index]['Created_By'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.receipt_long),
                                      SizedBox(width: 5),
                                      Text(items[index]['GST_No'], maxLines: 2),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(items[index]['Price'], maxLines: 2),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
