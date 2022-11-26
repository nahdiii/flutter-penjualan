import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:penjualan/Menu/MenuHomeBottom.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/transaksiKeluar.dart';
import 'package:penjualan/controller/transaksiController.dart';
import 'package:penjualan/model/transaksiSementara.dart';

class DetailTransaksiKeluar extends StatefulWidget {
  const DetailTransaksiKeluar({Key? key}) : super(key: key);
  static const String routeName = "/detail-transaksi-keluar";
  @override
  State<DetailTransaksiKeluar> createState() => _DetailTransaksiKeluarState();
}

class _DetailTransaksiKeluarState extends State<DetailTransaksiKeluar> {
  final TextEditingController _dibayar = TextEditingController();
  final formatCurrency = new NumberFormat.simpleCurrency(locale: "idn");

  List<TransaksiSementara> transSementara = Get.arguments;

  double total = 0;
  double kembalian = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transSementara.forEach((item) {
      //getting the key direectly from the name of the key
      total += item.hargajual * item.qty;
      // print(item.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi Keluar"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                // shrinkWrap: true,
                itemCount: transSementara.length,
                itemBuilder: (context, index) {
                  final item = transSementara[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        "http://127.0.0.1:8000/gambar-barang/" + item.gambar,
                        // height: 50,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        item.namabarang,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "qty  : " + item.qty.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Harga Jual : " + item.hargajual.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Total  : " + '${item.hargajual * item.qty}',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Total Pembelian : ${formatCurrency.format(total)}',
            style: TextStyle(fontSize: 25),
          ),
          // TextFormField(
          //   controller: _dibayar,
          //   decoration: const InputDecoration(
          //     labelText: 'Dibayar',
          //     hintText: 'Dibayar',
          //     fillColor: Colors.white,
          //   ),
          //   validator: (val) {
          //     if (val == null || val.isEmpty) {
          //       return 'Dibayar';
          //     }
          //     return null;
          //   },
          // ),
          // Text('${formatCurrency.format(kembalian)}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (total != null) {
            List<TransaksiSementara> detail = [];

            for (var item in transSementara) {
              TransaksiSementara dtTrans = TransaksiSementara(
                  id: item.id,
                  namabarang: item.namabarang,
                  hargabeli: item.hargabeli,
                  hargajual: item.hargajual,
                  gambar: item.gambar,
                  qty: item.qty);
              // );
              detail.add(dtTrans);
            }
            simpanDataTrans(detail, total);
            // Get.offNamed(HomeBottomMenu.routeName);
          } else {
            print("Belum Ada Data");
          }
        },
        tooltip: 'Simpan Transaksi',
        child: const Icon(Icons.add),
      ),
    );
  }
}
