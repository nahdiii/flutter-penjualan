import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:penjualan/Home.dart';
import 'package:penjualan/Menu/MenuHomeBottom.dart';
import 'package:penjualan/Routes/router.dart';
import 'package:penjualan/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getRouterPages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.routeName,
    );
  }
}
