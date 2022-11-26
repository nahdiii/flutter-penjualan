import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-Barang/barang.dart';
import 'package:penjualan/controller/barangController.dart';
import 'package:penjualan/controller/jenisController.dart';
import 'package:penjualan/model/jenisModel.dart';

class UbahBarang extends StatefulWidget {
  const UbahBarang({Key? key}) : super(key: key);
  static const String routeName = "/ubah-barang";

  @override
  State<UbahBarang> createState() => _UbahBarangState();
}

class _UbahBarangState extends State<UbahBarang> {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _namabarang = TextEditingController();
  String? _jenis_id;
  final TextEditingController _hargabeli = TextEditingController();
  final TextEditingController _hargajual = TextEditingController();
  final TextEditingController _stok = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var dataArguments = Get.arguments;
  List<Jenis> dataJenis = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.mounted) {
      getDataJenis().then((value) {
        setState(() {
          dataJenis.addAll(value);
        });
      });

      _id.text = dataArguments['_id'].toString();
      _namabarang.text = dataArguments['_namabarang'];
      _jenis_id = dataArguments['_jenis_id'].toString();
      _hargabeli.text = dataArguments['_hargabeli'].toString();
      _hargajual.text = dataArguments['_hargajual'].toString();
      _stok.text = dataArguments['_stok'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Data Barang"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _namabarang,
                  decoration: const InputDecoration(
                    labelText: 'Nama Barang',
                    hintText: 'Nama Barang',
                    fillColor: Colors.white,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Nama Barang tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                DropdownButton(
                  isExpanded: true,
                  iconSize: 15.0,
                  // elevation: 16,

                  underline: Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  items: dataJenis.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item.namajenis,
                      ),
                      value: item.id.toString(),
                    );
                  }).toList(),
                  hint: new Text(
                    "Pilih Jenis",
                  ),
                  onChanged: (newVal) {
                    print(newVal);
                    setState(() {
                      print(newVal);
                      _jenis_id = newVal.toString();
                    });
                  },
                  value: _jenis_id,
                ),
                TextFormField(
                  controller: _hargabeli,
                  decoration: const InputDecoration(
                    labelText: 'Harga Beli',
                    hintText: 'Harga Beli',
                    fillColor: Colors.white,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Harga Beli tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _hargajual,
                  decoration: const InputDecoration(
                    labelText: 'Harga Jual',
                    hintText: 'Harga Jual',
                    fillColor: Colors.white,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Harga Jual tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _stok,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Barang',
                    hintText: 'Jumlah Barang',
                    fillColor: Colors.white,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jumlah Barang tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ubahDataBarang(_id.text, _namabarang.text, _jenis_id!,
                          _hargabeli.text, _hargajual.text, _stok.text);
                      Get.offNamed(DataBarang.routeName);
                    }
                  },
                  child: Text("Simpan"),
                )
              ],
            )),
      ),
    );
  }
}
