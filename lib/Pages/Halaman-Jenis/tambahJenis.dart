import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-Jenis/jenis.dart';
import 'package:penjualan/controller/jenisController.dart';

class TambahDataJenis extends StatefulWidget {
  const TambahDataJenis({Key? key}) : super(key: key);
  static const String routeName = "/tambah-data-jenis";
  @override
  State<TambahDataJenis> createState() => _TambahDataJenisState();
}

class _TambahDataJenisState extends State<TambahDataJenis> {
  final TextEditingController _namajenis = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Jenis"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namajenis,
                decoration: const InputDecoration(
                  labelText: 'Nama Jenis',
                  hintText: 'Nama Jenis',
                  fillColor: Colors.white,
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Nama Jenis tidak boleh kosong';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    simpanDataJenis(_namajenis.text);
                    Get.offNamed(DataJenis.routeName);
                  }
                },
                child: Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
