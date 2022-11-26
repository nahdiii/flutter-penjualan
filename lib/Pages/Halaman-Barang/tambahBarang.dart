import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-Barang/barang.dart';
import 'package:penjualan/controller/barangController.dart';
import 'package:penjualan/controller/jenisController.dart';
import 'package:penjualan/model/jenisModel.dart';
import 'package:image_picker/image_picker.dart';

class TambahBarang extends StatefulWidget {
  const TambahBarang({Key? key}) : super(key: key);
  static const String routeName = "/tambah-barang";

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final TextEditingController _namabarang = TextEditingController();
  String? _jenis_id;
  final TextEditingController _hargabeli = TextEditingController();
  final TextEditingController _hargajual = TextEditingController();
  final TextEditingController _stok = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
    }
  }

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Barang"),
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
                  hint: const Text(
                    "Pilih Jenis",
                  ),
                  onChanged: (newVal) {
                    setState(() {
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
                Container(
                  child: OutlinedButton(
                    onPressed: getImage,
                    child: _image == null
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          )
                        : Text(_image!.path),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      simpanDataBarang(
                          _namabarang.text,
                          _jenis_id!,
                          _hargabeli.text,
                          _hargajual.text,
                          _stok.text,
                          _image!.path);
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
