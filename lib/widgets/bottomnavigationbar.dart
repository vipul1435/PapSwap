// ignore_for_file: override_on_non_overriding_member, must_be_immutable, unused_import, prefer_const_constructors

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:papswap/widgets/homepage.dart';
import 'package:papswap/widgets/styling.dart';
import 'package:papswap/widgets/wallet.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex1 = 0;
  final screens = [
    HomePage(),
    WalletPage(),
    Center(
      child: Text('Profile'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex1],
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.black,

        selectedLabelStyle: TextStyle(color: Colors.red),
        // backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              (currentIndex1 == 0) ? Icons.home : Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentIndex1 == 1)
                  ? Icons.account_balance_wallet
                  : Icons.account_balance_wallet_outlined,
              color: Colors.black,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentIndex1 == 2) ? Icons.person : Icons.person_outline,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        // ),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex1,
        onTap: (index) {
          setState(() {
            currentIndex1 = index;
          });
        },
      ),
    );
  }
}
