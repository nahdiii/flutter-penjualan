import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Pages/Halaman-pengguna/pengguna.dart';
import 'package:penjualan/controller/penggunaController.dart';

class UbahPengguna extends StatefulWidget {
  const UbahPengguna({Key? key}) : super(key: key);
  static const String routeName = "/ubah-pengguna";

  @override
  State<UbahPengguna> createState() => _UbahPenggunaState();
}

class _UbahPenggunaState extends State<UbahPengguna> {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _namaPengguna = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var dataArguments = Get.arguments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id.text = dataArguments['_id'].toString();
    _namaPengguna.text = dataArguments['_name'];
    _email.text = dataArguments['_email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Data Pengguna"),
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
                    ubahDataPenggua(_id.text, _namaPengguna.text, _email.text,
                        _password.text);
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
