import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:penjualan/model/transaksiSementara.dart';

class CallApi {
  // final String _urlAwal = 'http://127.0.0.1:8000/api/';
  final String _urlAwal = 'http://127.0.0.1:8000/api/';
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Content-Type': 'multipart/form-data',
      };

  postData(data, apiUrl) async {
    var url = _urlAwal + apiUrl;
    return http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  postDataTransaksi(data, apiUrl) async {
    var url = _urlAwal + apiUrl;
    // print(data['trans']);
    return http.post(
      Uri.parse(url),
      body: jsonEncode({
        'trans': data['trans'],
        'total': data['total'],
      }),
      headers: _setHeaders(),
    );
  }

  postDataWithGambar(data, filepath, apiUrl) async {
    var url = _urlAwal + apiUrl;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    // return http.MultipartRequest('POST', Uri.parse(url));
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(data)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    print(request);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  getData(apiUrl) async {
    var url = _urlAwal + apiUrl;
    return http.get(
      Uri.parse(url),
      headers: _setHeaders(),
    );
  }

  deleteData(apiUrl) async {
    var url = _urlAwal + apiUrl;
    return http.delete(
      Uri.parse(url),
      headers: _setHeaders(),
    );
  }

  putData(data, apiUrl) async {
    var url = _urlAwal + apiUrl;
    return http.put(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
}
