import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-pengguna/pengguna.dart';
import 'package:penjualan/controller/penggunaController.dart';

class TambahDataPengguna extends StatefulWidget {
  const TambahDataPengguna({Key? key}) : super(key: key);
  static const String routeName = "/tambah-pengguna";
  @override
  State<TambahDataPengguna> createState() => _TambahDataPenggunaState();
}

class _TambahDataPenggunaState extends State<TambahDataPengguna> {
  final TextEditingController _namaPengguna = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Pengguna"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaPengguna,
                decoration: const InputDecoration(
                  labelText: 'Nama Pengguna',
                  hintText: 'Nama Pengguna',
                  fillColor: Colors.white,
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Nama Pengguna tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  fillColor: Colors.white,
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  fillColor: Colors.white,
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    simpanDataPenggua(
                        _namaPengguna.text, _email.text, _password.text);
                    Get.offNamed(DataPengguna.routeName);
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
