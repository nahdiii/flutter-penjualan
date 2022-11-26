import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Halaman/Halaman1.dart';
import 'package:penjualan/Halaman/Halaman4.dart';

class HalamanTiga extends StatefulWidget {
  const HalamanTiga({Key? key}) : super(key: key);
  static const String routeName = "/halaman-tiga";
  @override
  State<HalamanTiga> createState() => _HalamanTigaState();
}

class _HalamanTigaState extends State<HalamanTiga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 3"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offNamed(HalamanEmpat.routeName);
                },
                child: Text("Ke Halaman 4"))
          ],
        ),
      ),
    );
  }
}
