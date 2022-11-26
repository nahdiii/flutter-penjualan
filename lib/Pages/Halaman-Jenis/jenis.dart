import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-Jenis/tambahJenis.dart';
import 'package:penjualan/controller/jenisController.dart';
import 'package:penjualan/model/jenisModel.dart';

class DataJenis extends StatefulWidget {
  const DataJenis({Key? key}) : super(key: key);
  static const String routeName = "/jenis";
  @override
  State<DataJenis> createState() => _DataJenisState();
}

class _DataJenisState extends State<DataJenis> {
  List<Jenis> data = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.mounted) {
      getDataJenis().then((value) {
        setState(() {
          data.addAll(value);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jenis"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            child: InkWell(
              onTap: () {
                print(item.namajenis);
              },
              child: ListTile(
                title: Text(item.namajenis),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(TambahDataJenis.routeName);
        },
        tooltip: 'Tambah Jenis',
        child: const Icon(Icons.add),
      ),
    );
  }
}
