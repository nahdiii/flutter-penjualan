import 'dart:ffi';

import 'package:flutter/material.dart';

class HalamanDua extends StatefulWidget {
  const HalamanDua({Key? key}) : super(key: key);
  static const String routeName = "/halaman-dua";
  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  double hasilJumlah = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman 2"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: text1,
              decoration: const InputDecoration(
                hintText: 'ini hint',
                labelText: 'ini label',
              ),
            ),
            TextFormField(
              controller: text2,
              decoration: const InputDecoration(
                hintText: 'Text 2',
                labelText: 'Text 2',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    text1.clear();
                    text2.clear();
                    setState(() {
                      hasilJumlah = 0;
                    });
                  },
                  child: Icon(Icons.replay_outlined),
                ),
                ElevatedButton(
                  child: Text("+"),
                  onPressed: () {
                    setState(() {
                      hasilJumlah =
                          double.parse(text1.text) + double.parse(text2.text);
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("-"),
                  onPressed: () {
                    setState(() {
                      hasilJumlah =
                          double.parse(text1.text) - double.parse(text2.text);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("x"),
                  onPressed: () {
                    setState(() {
                      hasilJumlah =
                          double.parse(text1.text) * double.parse(text2.text);
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("/"),
                  onPressed: () {
                    setState(() {
                      hasilJumlah =
                          double.parse(text1.text) / double.parse(text2.text);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "$hasilJumlah",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            // Text(
            //   text2.text,
            //   style: const TextStyle(
            //     fontSize: 20,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
