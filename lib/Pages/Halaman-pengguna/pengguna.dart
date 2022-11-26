import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:penjualan/Pages/Halaman-pengguna/tambahPengguna.dart';
import 'package:penjualan/Pages/Halaman-pengguna/ubahPengguna.dart';
import 'package:penjualan/controller/penggunaController.dart';
import 'package:penjualan/model/penggunaModel.dart';

class DataPengguna extends StatefulWidget {
  const DataPengguna({Key? key}) : super(key: key);
  static const String routeName = "/pengguna";
  @override
  State<DataPengguna> createState() => _DataPenggunaState();
}

class _DataPenggunaState extends State<DataPengguna> {
  List<Pengguna> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.mounted) {
      getDataPengguna().then((value) {
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
        title: Text("Data Pengguna"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            child: InkWell(
              onTap: () {
                Get.toNamed(UbahPengguna.routeName, arguments: {
                  '_id': item.id,
                  '_name': item.name,
                  '_email': item.email,
                });
              },
              child: ListTile(
                title: Text(item.name),
                subtitle: Text(item.email),
                trailing: InkWell(
                  onTap: () {
                    hapusPengguna(item.id.toString());
                    Get.offAndToNamed(DataPengguna.routeName);
                  },
                  child: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(TambahDataPengguna.routeName);
        },
        tooltip: 'Tambah Pengguna',
        child: const Icon(Icons.add),
      ),
    );
  }
}
