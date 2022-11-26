import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan/API/api.dart';
import 'package:penjualan/Utilities/service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = "/profile";
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Service service = Service();
  final _addFormKey = GlobalKey<FormState>();
  final _name = TextEditingController();

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

  Widget _buildImage() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Text(_image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            child: Card(
                child: Container(
                    child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Image Title'),
                      TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    child: OutlinedButton(
                        onPressed: getImage, child: _buildImage())),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (_addFormKey.currentState!.validate()) {
                            _addFormKey.currentState!.save();
                            Map<String, String> body = {'name': _name.text};
                            // service.addImage(body, _image!.path);
                            CallApi().postDataWithGambar(
                                body, _image!.path, "simpan-gambar");
                          }
                        },
                        child: Text('Save'),
                      )
                    ],
                  ),
                ),
              ],
            ))),
          ),
        ),
      ),
    );
  }
}
