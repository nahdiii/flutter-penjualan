import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  Future<bool> addImage(Map<String, String> body, String filepath) async {
    String addimageUrl = 'http://192.168.1.9:8000/api/simpan-gambar';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    print(request);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
