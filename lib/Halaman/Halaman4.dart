import 'package:flutter/material.dart';

class HalamanEmpat extends StatefulWidget {
  const HalamanEmpat({Key? key}) : super(key: key);
  static const String routeName = "/halaman-empat";
  @override
  State<HalamanEmpat> createState() => _HalamanEmpatState();
}

class _HalamanEmpatState extends State<HalamanEmpat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 4"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Halaman 4"))
          ],
        ),
      ),
    );
  }
}
