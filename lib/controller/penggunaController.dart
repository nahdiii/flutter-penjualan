import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:penjualan/API/api.dart';
import 'package:penjualan/model/penggunaModel.dart';

Future<List<Pengguna>> getDataPengguna() async {
  var response = await CallApi().getData("data-user");

  List<Pengguna> peng = [];
  if (response.statusCode == 200) {
    var dtPeng = jsonDecode(response.body);
    for (var jsonPengguna in dtPeng) {
      Pengguna dtPengguna = Pengguna(
        id: jsonPengguna["id"],
        name: jsonPengguna["name"],
        email: jsonPengguna["email"],
      );
      peng.add(dtPengguna);
    }
  }
  return peng;
}

void simpanDataPenggua(String _name, String _email, String _password) async {
  var data = {
    'name': _name,
    'email': _email,
    'password': _password,
  };

  var response = await CallApi().postData(data, 'simpan-data-pengguna');
  if (response.statusCode == 200) {
    print("Tersimpan");
  }
}

void hapusPengguna(String _id) async {
  var response = await CallApi().deleteData('hapus-data-pengguna/' + _id);
  if (response.statusCode == 200) {
    print("Terhapus");
  }
}

void ubahDataPenggua(
    String _id, String _name, String _email, String _password) async {
  var data = {
    'name': _name,
    'email': _email,
    'password': _password,
  };

  var response = await CallApi().putData(data, 'ubah-data-pengguna/' + _id);
  if (response.statusCode == 200) {
    print("Berhasil di ubah");
  }
}
