import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-Barang/tambahBarang.dart';
import 'package:penjualan/Pages/Halaman-Barang/ubahBarang.dart';
import 'package:penjualan/controller/barangController.dart';
import 'package:penjualan/model/barangModel.dart';

class DataBarang extends StatefulWidget {
  const DataBarang({Key? key}) : super(key: key);
  static const String routeName = "/data-barang";
  @override
  State<DataBarang> createState() => _DataBarangState();
}

class _DataBarangState extends State<DataBarang> {
  List<Barang> data = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.mounted) {
      getDataBarang().then((value) {
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
        title: Text("Data Barang"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            child: InkWell(
              onTap: () {
                Get.toNamed(UbahBarang.routeName, arguments: {
                  '_id': item.id,
                  '_namabarang': item.namabarang,
                  '_jenis_id': item.jenis_id,
                  '_hargabeli': item.hargabeli,
                  '_hargajual': item.hargajual,
                  '_stok': item.stok,
                });
              },
              child: ListTile(
                leading: Image.network(
                  "http://127.0.0.1:8000/gambar-barang/" + item.gambar,
                  // height: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  item.namabarang,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Harga Beli : " + item.hargabeli.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Harga Jual : " + item.hargajual.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Stok  : " + item.stok.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: InkWell(
                  onTap: () {
                    hapusBarang(item.id.toString());
                    Get.offAndToNamed(DataBarang.routeName);
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
          Get.toNamed(TambahBarang.routeName);
        },
        tooltip: 'Tambah Barang',
        child: const Icon(Icons.add),
      ),
    );
  }
}
