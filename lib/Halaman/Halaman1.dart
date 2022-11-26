import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Halaman/Halaman2.dart';
import 'package:penjualan/Halaman/Halaman3.dart';
import 'package:penjualan/Halaman/Halaman4.dart';
import 'package:penjualan/Halaman/Halaman5.dart';
import 'package:penjualan/Halaman/Halaman6.dart';
import 'package:penjualan/home.dart';

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({Key? key}) : super(key: key);
  static const String routeName = "/halaman-satu";
  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 1"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   primary: Colors.green,
                //   onPrimary: Colors.white,
                //   shadowColor: Colors.greenAccent,
                //   elevation: 3,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(32.0)),
                //   minimumSize: Size(10, 40), //////// HERE
                // ),
                onPressed: () {
                  Get.offNamed(MyHomePage.routeName);
                },
                child: Text("Home"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(HalamanDua.routeName);
                },
                child: Text("2"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(HalamanTiga.routeName);
                },
                child: Text("3"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(HalamanEmpat.routeName);
                },
                child: Text("4"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(HalamanLima.routeName);
                },
                child: Text("5"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(HalamanEnam.routeName);
                },
                child: Text("6"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
