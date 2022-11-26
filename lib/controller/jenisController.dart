import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:penjualan/API/api.dart';
import 'package:penjualan/Pages/Halaman-Jenis/jenis.dart';

// import 'package:penjualan/Pages/jenis.dart';
import 'package:penjualan/model/jenisModel.dart';

Future<List<Jenis>> getDataJenis() async {
  var response = await CallApi().getData("data-jenis");

  List<Jenis> Jen = [];
  if (response.statusCode == 200) {
    var dtJen = jsonDecode(response.body);
    for (var jsonJenis in dtJen) {
      Jenis dtJenis = Jenis(
        id: jsonJenis["id"],
        namajenis: jsonJenis["namajenis"],
      );
      Jen.add(dtJenis);
    }
  }
  return Jen;
}

void simpanDataJenis(String _namajenis) async {
  var data = {
    'namajenis': _namajenis,
  };

  var response = await CallApi().postData(data, 'simpan-data-jenis');
  if (response.statusCode == 200) {
    print("Tersimpan");
  }
}
