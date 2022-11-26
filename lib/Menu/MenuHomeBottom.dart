import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Halaman/Halaman1.dart';
import 'package:penjualan/Halaman/Halaman2.dart';
import 'package:penjualan/Halaman/Halaman3.dart';
import 'package:penjualan/Pages/profile.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/transaksiKeluar.dart';
import 'package:penjualan/home.dart';
import 'package:penjualan/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBottomMenu extends StatefulWidget {
  const HomeBottomMenu({Key? key}) : super(key: key);
  static const String routeName = "/home-bottom";

  @override
  State<HomeBottomMenu> createState() => _HomeBottomMenuState();
}

class _HomeBottomMenuState extends State<HomeBottomMenu> {
  int _currenIndex = 0;

  final List<GetPage> _children = [
    GetPage(name: MyHomePage.routeName, page: () => const MyHomePage()),
    GetPage(
        name: TransaksiKeluar.routeName, page: () => const TransaksiKeluar()),
    GetPage(name: Profile.routeName, page: () => const Profile()),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetNavigator(
        pages: [
          _children[_currenIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        onTap: onTappedBar,
        currentIndex: _currenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.point_of_sale_rounded), label: "Transaksi"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
