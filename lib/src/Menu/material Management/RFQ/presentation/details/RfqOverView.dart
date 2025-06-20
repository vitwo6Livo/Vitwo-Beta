import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class RfqOverview extends StatelessWidget {
  const RfqOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Text("Item Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("11000001",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Card(
                        color: GlobalColor.appBarColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(Icons.add, color: Colors.white, size: 18),
                                SizedBox(width: 5),
                                Text(
                                  "Matrix",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Item Name: Antenna"),
                  SizedBox(height: 10),
                  Text("Item Qty: 1.000"),
                  SizedBox(height: 10),
                  Text("Item UOM: BAG"),
                ],
              ),
            ),
          ),
          Text("Vendor",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("62500097",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Card(
                            color: GlobalColor.appBarColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 5),
                                    Text("Send mail",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )),
                                  ],
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(" Sengupta pvt lmt"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.email),
                          Text(" sengupta@vitwo.com"),
                        ],
                      ),
                    ]),
              ))
        ],
      ),
    );
  }
}
