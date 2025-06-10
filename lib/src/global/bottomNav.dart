import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/Accounting/presentation/accountScreen.dart';
import 'package:vitwo_beta/src/Dashboard/presentation/dashBoard.dart';
import 'package:vitwo_beta/src/Menu/presentation/menuScreen.dart';
import 'package:vitwo_beta/src/Scanner/presentation/scanScreen.dart';
import 'package:vitwo_beta/src/Settlement/presentation/settlementScreen.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int _selectedIndex = 0;
  _selectScreen(BuildContext context, int index) {
    if (index == 0) {
      return dashBoard();
    } else if (index == 1) {
      return accountScreen();
    } else if (index == 2) {
      return scanScreen();
    } else if (index == 3) {
      return settlementScreen();
    } else if (index == 4) {
      return menuScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectScreen(context, _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, size: 30),
            label: '',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 0, 48, 96),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
