import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:penjualan/API/api.dart';
import 'package:penjualan/model/barangModel.dart';

Future<List<Barang>> getDataBarang() async {
  var response = await CallApi().getData("data-barang");

  List<Barang> Brg = [];
  if (response.statusCode == 200) {
    var dtBrg = jsonDecode(response.body);
    for (var jsonBarang in dtBrg) {
      Barang dtBarang = Barang(
        id: jsonBarang["id"],
        namabarang: jsonBarang["namabarang"],
        jenis_id: jsonBarang["jenis_id"],
        hargabeli: double.parse(jsonBarang["hargabeli"].toString()),
        hargajual: double.parse(jsonBarang["hargajual"].toString()),
        stok: jsonBarang["stok"],
        gambar: jsonBarang["gambar"],
      );
      Brg.add(dtBarang);
    }
  }
  return Brg;
}

void simpanDataBarang(String _namabarang, String _jenis_id, String _hargabeli,
    String _hargajual, String _stok, String _gambar) async {
  var data = {
    'namabarang': _namabarang,
    'jenis_id': _jenis_id,
    'hargabeli': _hargabeli,
    'hargajual': _hargajual,
    'stok': _stok,
  };

  // var response = await CallApi().postData(data, 'simpan-barang');
  var response =
      await CallApi().postDataWithGambar(data, _gambar, "simpan-barang");

  print(response);
  // if (response.statusCode == 200) {
  //   print("Tersimpan");
  // }
}

void hapusBarang(String _id) async {
  var response = await CallApi().deleteData('hapus-barang/' + _id);
  if (response.statusCode == 200) {
    print("Terhapus");
  }
}

void ubahDataBarang(String _id, String _namabarang, String _jenis_id,
    String _hargabeli, String _hargajual, String _stok) async {
  var data = {
    'namabarang': _namabarang,
    'jenis_id': _jenis_id,
    'hargabeli': _hargabeli,
    'hargajual': _hargajual,
    'stok': _stok,
  };

  var response = await CallApi().putData(data, 'ubah-barang/' + _id);
  // print(response.body);
  if (response.statusCode == 200) {
    print("Data Berhasil di ubah");
  }
}
