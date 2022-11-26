import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualan/Halaman/Halaman1.dart';
import 'package:penjualan/Halaman/Halaman2.dart';
import 'package:penjualan/Halaman/Halaman3.dart';
import 'package:penjualan/Pages/Halaman-Barang/barang.dart';
import 'package:penjualan/Pages/Halaman-Jenis/jenis.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/rekapTransaksi.dart';
import 'package:penjualan/Pages/Halaman-pengguna/pengguna.dart';
import 'package:penjualan/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  static const String routeName = "/home";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Get.toNamed(HalamanSatu.routeName);
        break;
      case 1:
        Get.toNamed(HalamanDua.routeName);
        break;
    }
  }

  String? namaUser;
  dataLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      namaUser = sharedPreferences.getString("name");
      print(sharedPreferences.getString("name"));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 0),
        //     child: PopupMenuButton<int>(
        //       onSelected: (items) => onSelected(context, items),
        //       itemBuilder: (context) => [
        //         PopupMenuItem(
        //           value: 0,
        //           child: Row(
        //             children: [
        //               SizedBox(width: 4),
        //               Text("Halaman 1"),
        //             ],
        //           ),
        //         ),
        //         PopupMenuItem(
        //           value: 1,
        //           child: Row(
        //             children: [
        //               SizedBox(width: 4),
        //               Text("Halaman 2"),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Center(
                child: Column(
                  children: [
                    Image.network(
                      "https://www.autopilotstore.co.id/wp-content/uploads/2021/08/halaman-layanan-aplikasi-kasir-canggih-segmen-kasir-basic-icon-kasir.png",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "CV. Bekantan Jantan",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Data Jenis"),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(DataJenis.routeName);
              },
            ),
            ListTile(
              title: Text("Data Barang"),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(DataBarang.routeName);
              },
            ),
            ListTile(
              title: Text("Data Pengguna"),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(DataPengguna.routeName);
              },
            ),
            ListTile(
              title: Text("Rekap Transaksi"),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(RekapTransaksi.routeName);
              },
            ),
            // Divider(
            //   height: 10,
            //   thickness: 2,
            // ),

            Divider(
              height: 10,
              thickness: 2,
            ),
            ListTile(
              title: Text("Log Out"),
              onTap: () async {
                Navigator.of(context).pop();
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove("token");
                Get.offNamed(LoginPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaUser != null ? namaUser! : "no name",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              // color: Colors.red,
              child: Image.network(
                "https://www.autopilotstore.co.id/wp-content/uploads/2021/08/halaman-layanan-aplikasi-kasir-canggih-segmen-kasir-basic-icon-kasir.png",
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Selamat Datang Pada Aplikasi Kasir",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "CV. Bekantan Jantan",
              style: TextStyle(fontSize: 23),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
