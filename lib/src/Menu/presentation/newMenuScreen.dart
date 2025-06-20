import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Invoicing/presentation/sd_IV.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Manage%20Delivery/presentation/sd_MD.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Performa%20Invoice/presentation/sd_PI.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Post%20Goods%20Issuance/presentation/sd_PGI.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Quotation/presentation/sd_Quotation.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/RFQ_PI/presentation/sd_RFQ_PI.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/Sales%20Order/presentation/sd_SO.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/sd_InventoryView.dart';
import 'package:vitwo_beta/src/Menu/Sales_Distribution/screens/sd_POS.dart';
import 'package:vitwo_beta/src/constants/colors.dart';
import 'package:vitwo_beta/src/constants/text.dart';

class NewMenuScreen extends StatefulWidget {
  const NewMenuScreen({super.key});

  @override
  State<NewMenuScreen> createState() => _NewMenuScreenState();
}

class _NewMenuScreenState extends State<NewMenuScreen> {
  int? _expandedIndex;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.appBarColor.withOpacity(0.05),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Menu',
          style: TextStyle(
            color: GlobalColor.appBarTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        itemCount: subMenu.length,
        itemBuilder: (context, index) {
          final isExpanded = _expandedIndex == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.18),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: isExpanded
                    ? GlobalColor.appBarColor.withOpacity(0.7)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                setState(() {
                  _expandedIndex = isExpanded ? null : index;
                });
              },
              child: AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              subMenu[index]['img'],
                              width: 54,
                              height: 54,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              subMenu[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: GlobalColor.appBarColor,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          isExpanded
                              ? Icon(Icons.arrow_drop_up,
                                  color: GlobalColor.appBarColor, size: 32)
                              : Icon(Icons.arrow_drop_down,
                                  color: Colors.grey[400], size: 32),
                        ],
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: isExpanded
                            ? Container(
                                key: ValueKey('expanded_$index'),
                                margin: const EdgeInsets.only(top: 18),
                                height:
                                    280, // Fixed height for expanded content
                                width: double.infinity,
                                color: Colors.grey.withOpacity(0.08),
                                alignment: Alignment.center,
                                child: _buildCardOption([
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
                                            builder: (context) =>
                                                sd_Quotation(),
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
                                            builder: (context) =>
                                                sd_InventoryView(),
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
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            backgroundColor: GlobalColor.OptionsColor,
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
