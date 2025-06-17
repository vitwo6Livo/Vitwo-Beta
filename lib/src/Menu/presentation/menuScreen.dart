import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Invoicing/presentation/sd_IV.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/sd_InventoryView.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Manage%20Delivery/presentation/sd_MD.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Post%20Goods%20Issuance/presentation/sd_PGI.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Performa%20Invoice/presentation/sd_PI.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/sd_POS.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/presentation/sd_Quotation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/RFQ_PI/presentation/sd_RFQ_PI.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/presentation/sd_SO.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Initiate%20GRN/presentation/InitiateGrn.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Inventory%20Report/presentation/inventoryReport.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Item%20Master/presentation/itemMaster.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Meterial%20Quotation/presentation/meterialQuotation.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/My%20Items/presentation/myItems.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Pending%20GRN/presentation/PendingGrn.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Processed%20GRN/presentation/processedGrn.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Purchase%20Order/presentation/purchaseOrder.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/RFQ/presentation/rfqScreen.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/Vendor%20Invoice/presentation/vendorInvoice.dart';
import 'package:vitwo_beta/src/Menu/material%20Management/purchase%20Request/presentation/purchaseRequest.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class menuScreen extends StatefulWidget {
  const menuScreen({super.key});

  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  List<Map<String, dynamic>> subMenu = [
    {'img': 'assets/pictures/menu/PM.png', 'name': GlobalText.PM_Title},
    {'img': 'assets/pictures/menu/SD.png', 'name': GlobalText.SD_Title},
    {'img': 'assets/pictures/menu/MM.png', 'name': GlobalText.MM_Title},
    {'img': 'assets/pictures/menu/WM.png', 'name': GlobalText.WM_Title},
    {'img': 'assets/pictures/menu/PP.png', 'name': GlobalText.PP_Title},
    {'img': 'assets/pictures/menu/PR_P.png', 'name': GlobalText.PR_P_Title},
    {'img': 'assets/pictures/menu/MA.png', 'name': GlobalText.MA_Title},
    {'img': 'assets/pictures/menu/QA.png', 'name': GlobalText.QA_Title},
    {
      'img': 'assets/pictures/menu/Settings.png',
      'name': GlobalText.Setting_Title,
    },
    {'img': 'assets/pictures/menu/Settings.png', 'name': 'Settings'},
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            GlobalText.menuTitle,
            style: TextStyle(color: GlobalColor.appBarTextColor),
          ),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 5,
        itemBuilder: (context, rowIndex) {
          return Column(
            children: [
              Row(
                children: List.generate(2, (colIndex) {
                  int index = rowIndex * 2 + colIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == index ? null : index;
                        });
                      },
                      child: Card(
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.all(6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Image.asset(subMenu[index]['img'], height: 90),
                              SizedBox(height: 10),
                              Text(
                                subMenu[index]['name'],
                                maxLines: 2,
                                style: TextStyle(
                                  color: GlobalColor.menuOptionColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              // if (expandedIndex != null &&
              //     (expandedIndex! ~/ 2) ==
              //         rowIndex && ) // expand below the correct row
              if (expandedIndex == 1 && rowIndex == 0)
                AnimatedSize(
                  duration: const Duration(seconds: 15),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 6,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              GlobalText.SD_Title,
                              style: TextStyle(
                                fontSize: 20,
                                color: GlobalColor.menuOptionColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15),
                            Image.asset(
                              'assets/pictures/menu/SD.png',
                              height: 100,
                              width: 120,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _buildCardOption([
                          {
                            'icon': Icons.request_page,
                            'title': GlobalText.SD_RFQ_PI,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_RFQ_PI(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.description,
                            'title': GlobalText.SD_Quotation,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_Quotation(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.receipt_long,
                            'title': GlobalText.SD_PI,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_PI(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.shopping_cart_checkout,
                            'title': GlobalText.SD_SO,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_SO(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.local_shipping,
                            'title': GlobalText.SD_MD,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_MD(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.inventory_2,
                            'title': GlobalText.SD_PGI,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_PGI(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.receipt,
                            'title': GlobalText.SD_IV,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_IV(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.warehouse,
                            'title': GlobalText.SD_InventoryView,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_InventoryView(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.point_of_sale_outlined,
                            'title': GlobalText.SD_POS,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sd_POS(),
                                  ),
                                ),
                          },
                        ]),
                      ],
                    ),
                  ),
                ),

              if (expandedIndex == 2 && rowIndex == 1)
                AnimatedSize(
                  duration: const Duration(seconds: 15),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 6,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              GlobalText.MM_Title,
                              style: TextStyle(
                                fontSize: 20,
                                color: GlobalColor.menuOptionColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 15),
                            Image.asset(
                              'assets/pictures/menu/MM.png',
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _buildCardOption([
                          {
                            'icon': Icons.inventory_2_outlined,
                            'title': GlobalText.MM_RFQ,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RequestForQuotationScreen(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.receipt_long,
                            'title': GlobalText.MM_MQ,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MaterialQuotation(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.receipt,
                            'title': GlobalText.MM_VI,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VendorInvoice(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.inventory_2_outlined,
                            'title': GlobalText.MM_MI,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyItems(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.inventory_2_outlined,
                            'title': GlobalText.MM_IM,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemMaster(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.request_page,
                            'title': GlobalText.MM_PR,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PurchaseRequest(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.shopping_cart_checkout,
                            'title': GlobalText.MM_PO,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PurchaseOrder(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.check_box_outlined,
                            'title': GlobalText.MM_IG,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InitiateGRN(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.pending_actions_outlined,
                            'title': GlobalText.MM_PG,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PendingGRN(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.done_all_outlined,
                            'title': GlobalText.MM_PGRN,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProcessedGRN(),
                                  ),
                                ),
                          },
                          {
                            'icon': Icons.bar_chart_outlined,
                            'title': GlobalText.MM_IR,
                            'navigator': (BuildContext context) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InventoryReport(),
                                  ),
                                ),
                          },
                        ]),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCardOption(List<Map<String, dynamic>> options) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        IconData icon = options[index]['icon'];
        String title = options[index]['title'];
        Function(BuildContext) navigator = options[index]['navigator'];
        return _buildOption(icon, title, () => navigator(context));
      },
    );
  }

  Widget _buildOption(IconData icon, String title, VoidCallback navigator) {
    return GestureDetector(
      onTap: navigator,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: GlobalColor.menuOptionColor,
            radius: 22,
            child: Icon(icon, size: 20, color: Colors.white),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            maxLines: 2,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
