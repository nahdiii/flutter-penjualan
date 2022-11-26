import 'package:flutter/material.dart';

class HalamanLima extends StatefulWidget {
  const HalamanLima({Key? key}) : super(key: key);
  static const String routeName = "/halaman-lima";
  @override
  State<HalamanLima> createState() => _HalamanLimaState();
}

class _HalamanLimaState extends State<HalamanLima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 5"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Halaman 5"))
          ],
        ),
      ),
    );
  }
}
