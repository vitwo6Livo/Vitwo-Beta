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

  final List<String> items = [
    'Select',
    'Customer 1',
    'Customer 2',
    'Customer 3',
    'Customer 4',
    'Customer 5'
  ];

  final List<Map<String, dynamic>> transactionList = [
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

  final List<Map<String, dynamic>> totals = [
    {'total_Outstanding': 0.0, 'total_Due': 0.0, 'total_OverDue': 0.0},
    {'total_Outstanding': 690.0, 'total_Due': 8400.0, 'total_OverDue': 100.0},
    {
      'total_Outstanding': 1481.0,
      'total_Due': 59451.0,
      'total_OverDue': 478949.0
    },
    {'total_Outstanding': 14861.0, 'total_Due': 1654.0, 'total_OverDue': 58.0},
    {'total_Outstanding': 690.0, 'total_Due': 8400.0, 'total_OverDue': 100.0},
    {
      'total_Outstanding': 1286.0,
      'total_Due': 852400.0,
      'total_OverDue': 515.0
    },
  ];

  final List<Map<String, dynamic>> advancePay = [
    {'amount': '156800', 'documentId': 'IV48434', 'date': '11-06-2025'},
    {'amount': '78000', 'documentId': 'IV48434', 'date': '11-05-2025'},
    {'amount': '5665', 'documentId': 'IV48434', 'date': '31-03-2025'},
    {'amount': '1500', 'documentId': 'IV48434', 'date': '11-08-2023'},
    {'amount': '1800', 'documentId': 'IV48434', 'date': '11-12-2025'},
  ];

  // NEW: List of individual controllers
  late List<TextEditingController> _dueAmountControllers;

  @override
  void initState() {
    super.initState();
    _dueAmountControllers = List.generate(
      advancePay.length,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final controller in _dueAmountControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = items.indexOf(dropdownValue);
    final selectedTotals = totals[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalText.SD_Settlement,
            style: TextStyle(color: GlobalColor.appBarTextColor)),
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
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
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
                        icon: const Icon(Icons.arrow_drop_down_circle,
                            color: Colors.white),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                      ),
                      // dropdownSearchData: DropdownSearchData(
                      //   searchInnerWidget: Padding(
                      //     padding: const EdgeInsets.all(8),
                      //     child: TextField(
                      //       decoration: InputDecoration(
                      //         hintText: 'Search Customer...',
                      //         contentPadding: EdgeInsets.symmetric(
                      //             vertical: 10, horizontal: 15),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(14)),
                      //       ),
                      //     ),
                      //   ),
                      //   searchMatchFn: (item, searchValue) => item.value!
                      //       .toLowerCase()
                      //       .contains(searchValue.toLowerCase()),
                      // ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      _buildTotalRow('Total Outstanding : ',
                          selectedTotals['total_Outstanding']),
                      _buildTotalRow(
                          'Total Due : ', selectedTotals['total_Due']),
                      _buildTotalRow(
                          'Total OverDue : ', selectedTotals['total_OverDue']),
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
                  final item = transactionList[index];
                  return Card(
                    elevation: 3,
                    child: _buildCardData(item),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildCardData(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item['InvoiceNo'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Row(children: [
                Icon(Icons.event, color: GlobalColor.primaryColor),
                SizedBox(width: 5),
                Text(item['Due_Dates'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade600)),
              ]),
            ]),
            Container(
              height: 42,
              width: item['Status'] == 'SENT' ? 90 : 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: item['Status'] == 'SENT'
                    ? Colors.redAccent.shade100
                    : Colors.yellow.shade300,
              ),
              child: Center(
                child: Text(item['Status'],
                    style: TextStyle(
                      color: item['Status'] == 'SENT'
                          ? Colors.red.shade800
                          : Colors.yellow.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
              ),
            ),
          ]),
          SizedBox(height: 20),
          _buildDetailRow('Invoice Amount : ', item['Invoice_Amount']),
          SizedBox(height: 10),
          _buildDetailRow('Due Amount : ', item['Due_Amount']),
          SizedBox(height: 10),
          _buildDetailRow('Due % : ', item['Due_%']),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(
              onTap: () => showBottomModelView(),
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: GlobalColor.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.handshake, color: Colors.white, size: 30),
              ),
            )
          ])
        ],
      ),
    );
  }

  Widget _buildTotalRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text(title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        Text(value.toString(),
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ]),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  void showBottomModelView() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25), topStart: Radius.circular(25)),
      ),
      context: context,
      builder: (context) => Container(
        padding: EdgeInsetsDirectional.only(
          bottom: 30,
          top: 8,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 20, end: 20, bottom: 30, top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  height: 600,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Center(
                          child: Text('Advanced List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25))),
                      Center(
                          child: Text('₹ $dueAmt',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade900,
                                  fontSize: 25))),
                      SizedBox(height: 10),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: advancePay.length,
                          itemBuilder: (context, index) {
                            final item = advancePay[index];
                            return Card(
                              color: Colors.blueGrey.shade50,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item['documentId'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text(item['date'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Advance Amount',
                                              style: TextStyle(
                                                  color: Colors.green)),
                                          Text('₹ ${item['amount']}',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 160,
                                            child: TextField(
                                              controller:
                                                  _dueAmountControllers[index],
                                              cursorColor:
                                                  GlobalColor.OptionsColor,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Enter Amount',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: GlobalColor
                                                          .OptionsColor,
                                                      width: 2.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: GlobalColor
                                                          .OptionsColor,
                                                      width: 2.0),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
