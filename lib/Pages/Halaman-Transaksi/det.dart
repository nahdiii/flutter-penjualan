import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:penjualan/model/transaksiSementara.dart';

class DetailRekap extends StatefulWidget {
  const DetailRekap({Key? key}) : super(key: key);
  static const String routeName = "/rekap-detail";

  @override
  State<DetailRekap> createState() => _DetailRekapState();
}

class _DetailRekapState extends State<DetailRekap> {
  List<TransaksiSementara> detailRekap = Get.arguments;
  final formatCurrency = new NumberFormat.simpleCurrency(locale: "idn");
  double keuntungan = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailRekap.forEach((item) {
      //getting the key direectly from the name of the key
      keuntungan += (item.hargajual - item.hargabeli) * item.qty;
      // print(item.id);
    });
    print(keuntungan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                // shrinkWrap: true,
                itemCount: detailRekap.length,
                itemBuilder: (context, index) {
                  final item = detailRekap[index];
                  return ListTile(
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
                              "Harga Beli : " + item.hargabeli.toString(),
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
                              "Harga Jual : " + item.hargajual.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Text(
            'Keuntungan : ${formatCurrency.format(keuntungan)}',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
