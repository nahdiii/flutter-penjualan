import 'package:http/http.dart' as http;
import 'package:penjualan/API/api.dart';
import 'package:penjualan/model/transaksiSementara.dart';
import 'dart:convert';

void simpanDataTrans(trans, double total) async {
  // model =
  var data = {
    'trans': trans,
    'total': total,
  };

  var response =
      await CallApi().postDataTransaksi(data, 'simpan-data-transaksi');
  print(response.body);
  if (response.statusCode == 200) {
    print("Tersimpan");
  }
}
