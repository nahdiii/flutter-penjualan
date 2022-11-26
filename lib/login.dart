import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/API/api.dart';
import 'package:penjualan/Menu/MenuHomeBottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = "/";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Get.offNamed(HomeBottomMenu.routeName);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkLoginStatus();
    if (this.mounted) {
      checkLoginStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Halaman Login",
              style: TextStyle(fontSize: 30.0),
            ),
            Image.network(
              "https://www.autopilotstore.co.id/wp-content/uploads/2021/08/halaman-layanan-aplikasi-kasir-canggih-segmen-kasir-basic-icon-kasir.png",
              height: 100,
              fit: BoxFit.fill,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Email',
                      fillColor: Colors.white,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var data = {
                  'email': _email.text,
                  'password': _password.text,
                };

                var response = await CallApi().postData(data, 'login-api');

                var body = json.decode(response.body);
                // print(body['data']['user']['name']);
                if (response.statusCode == 200) {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  localStorage.setString('token', body['token']);
                  localStorage.setString('name', body['data']['user']['name']);

                  Get.offNamed(HomeBottomMenu.routeName);
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
