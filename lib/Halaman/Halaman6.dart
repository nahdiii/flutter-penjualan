import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Halaman/Halaman3.dart';

class HalamanEnam extends StatefulWidget {
  const HalamanEnam({Key? key}) : super(key: key);
  static const String routeName = "/halaman-enam";
  @override
  State<HalamanEnam> createState() => _HalamanEnamState();
}

class _HalamanEnamState extends State<HalamanEnam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 6"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offNamed(HalamanTiga.routeName);
                },
                child: Text("Ke Halaman 3"))
          ],
        ),
      ),
    );
  }
}
