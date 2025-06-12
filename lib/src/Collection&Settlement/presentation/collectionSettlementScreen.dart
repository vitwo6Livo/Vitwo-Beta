import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class collectionSettlementScreen extends StatefulWidget {
  const collectionSettlementScreen({super.key});

  @override
  State<collectionSettlementScreen> createState() =>
      _collectionSettlementScreenState();
}

class _collectionSettlementScreenState
    extends State<collectionSettlementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            GlobalText.settlementTitle,
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.shade50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/pictures/collectionSettlement/collectionManagement.png',
                        height: 220,
                        width: 500,
                      ),
                    ),
                    SizedBox(
                      width: 330,
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Collection Management',
                            style: TextStyle(
                                color: GlobalColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          CircleAvatar(
                            backgroundColor: GlobalColor.primaryColor,
                            radius: 22,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
