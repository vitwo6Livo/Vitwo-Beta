import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class sd_SettlementScreen extends StatefulWidget {
  const sd_SettlementScreen({super.key});

  @override
  State<sd_SettlementScreen> createState() => _sd_SettlementScreenState();
}

class _sd_SettlementScreenState extends State<sd_SettlementScreen> {
  String dropdownValue = 'Select';
  int dueAmt = 1500;
  final TextEditingController _dueAmountController = TextEditingController();

  final List<String> items = [
    'Select',
    'Customer 1',
    'Customer 2',
    'Customer 3',
    'Customer 4',
    'Customer 5'
  ];

  List<Map<String, dynamic>> transactionList = [
    {
      'InvoiceNo': 'INV-0000000162',
      'Status': 'PARTIAL PAID',
      'Due_Dates': '20-11-2023',
      'Invoice_Amount': '2,418.19999',
      'Due_Amount': '953.19999',
      'Due_%': '39.417%',
    },
    {
      'InvoiceNo': 'INV-0000000162',
      'Status': 'SENT',
      'Due_Dates': '20-11-2023',
      'Invoice_Amount': '2,418.19999',
      'Due_Amount': '953.19999',
      'Due_%': '39.417%',
    },
  ];
  List<Map<String, dynamic>> totals = [
    {
      'total_Outstanding': 0.0,
      'total_Due': 0.0,
      'total_OverDue': 0.0,
    },
    {
      'total_Outstanding': 690.0,
      'total_Due': 8400.0,
      'total_OverDue': 100.0,
    },
    {
      'total_Outstanding': 1481.0,
      'total_Due': 59451.0,
      'total_OverDue': 478949.0,
    },
    {
      'total_Outstanding': 14861.0,
      'total_Due': 1654.0,
      'total_OverDue': 58.0,
    },
    {
      'total_Outstanding': 690.0,
      'total_Due': 8400.0,
      'total_OverDue': 100.0,
    },
    {
      'total_Outstanding': 1286.0,
      'total_Due': 852400.0,
      'total_OverDue': 515.0,
    },
  ];
  List<Map<String, dynamic>> advancePay = [
    {
      'amount': '156800',
      'documentId': 'IV48434',
      'date': '11-06-2025',
    },
    {
      'amount': '78000',
      'documentId': 'IV48434',
      'date': '11-05-2025',
    },
    {
      'amount': '5665',
      'documentId': 'IV48434',
      'date': '31-03-2025',
    },
    {
      'amount': '1500',
      'documentId': 'IV48434',
      'date': '11-08-2023',
    },
    {
      'amount': '1800',
      'documentId': 'IV48434',
      'date': '11-12-2025',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final selectedIndex = items.indexOf(dropdownValue);
    final selectedTotals = totals[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalText.SD_Settlement,
          style: TextStyle(color: GlobalColor.appBarTextColor),
        ),
        backgroundColor: GlobalColor.appBarColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey.shade100,
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: GlobalColor.primaryColor,
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Customer Settlement',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      dropdownStyleData: DropdownStyleData(
                        direction:
                            DropdownDirection.textDirection, // Force downward
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                      ),
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 310,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white54,
                        ),
                      ),
                      iconStyleData: IconStyleData(
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.white,
                        ),
                      ),
                      value: dropdownValue,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      dropdownSearchData: DropdownSearchData(
                        searchController: TextEditingController(),
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                              hintText: 'Search Customer...',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return item.value!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase());
                        },
                      ),
                      // Important: this hides the search widget when an item is selected
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          // You can clear the searchController here if needed
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Total Outstanding : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            selectedTotals['total_Outstanding'].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Total Due : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            selectedTotals['total_Due'].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Total OverDue : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            selectedTotals['total_OverDue'].toString(),
                            maxLines: 4,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                  itemCount: transactionList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transactionList[index]['InvoiceNo'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Due Date : ${transactionList[index]['Due_Dates']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red.shade600),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 42,
                                  width:
                                      transactionList[index]['Status'] == 'SENT'
                                          ? 90
                                          : 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: transactionList[index]['Status'] ==
                                              'SENT'
                                          ? Colors.redAccent.shade100
                                          : Colors.yellow.shade300),
                                  child: Center(
                                    child: Text(
                                      transactionList[index]['Status'],
                                      style: TextStyle(
                                          color: transactionList[index]
                                                      ['Status'] ==
                                                  'SENT'
                                              ? Colors.red.shade800
                                              : Colors.yellow.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Invoice Amount',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      transactionList[index]['Invoice_Amount'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Due Amount',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      transactionList[index]['Due_Amount'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text('Due % : ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  transactionList[index]['Due_%'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showBottomModelView();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: GlobalColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Icon(
                                      Icons.handshake,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void showBottomModelView() {
    showModalBottomSheet(
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
                  height: 600,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Center(
                            child: Text(
                          'Advanced List',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25),
                        )),
                        Center(
                            child: Text(
                          '₹ ${dueAmt.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                              fontSize: 25),
                        )),
                        SizedBox(height: 10),
                        Flexible(
                          child: ListView.builder(
                              itemCount: advancePay.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.blueGrey.shade50,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(advancePay[index]['documentId'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Text(advancePay[index]['date'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '₹ ${advancePay[index]['amount']}',
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 25),
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(
                                                  width: 160,
                                                  child: TextField(
                                                      controller:
                                                          _dueAmountController,
                                                      cursorColor: GlobalColor
                                                          .OptionsColor,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter Amount',
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: GlobalColor
                                                                  .OptionsColor,
                                                              width: 2.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: GlobalColor
                                                                  .OptionsColor,
                                                              width: 2.0),
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ])),
            ])));
  }
}
