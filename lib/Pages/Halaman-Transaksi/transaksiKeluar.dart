import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/detailTransaksi.dart';
import 'package:penjualan/controller/barangController.dart';
import 'package:penjualan/model/barangModel.dart';
import 'package:penjualan/model/transaksiSementara.dart';

class TransaksiKeluar extends StatefulWidget {
  const TransaksiKeluar({Key? key}) : super(key: key);
  static const String routeName = "/transaksi-keluar";
  @override
  State<TransaksiKeluar> createState() => _TransaksiKeluarState();
}

class _TransaksiKeluarState extends State<TransaksiKeluar> {
  final formatCurrency = new NumberFormat.simpleCurrency(locale: "idn");
  final TextEditingController _jumlahBarang = TextEditingController();
  int totalPembelian = 0;
  List<Barang> data = [];
  List<TransaksiSementara> transSementara = [];
  void initState() {
    // TODO: implement initState
    _jumlahBarang.text = "1";
    super.initState();
    if (this.mounted) {
      getDataBarang().then((value) {
        setState(() {
          data.addAll(value);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaksi Keluar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (() {
                print(data[index].id);

                setState(() {
                  totalPembelian = totalPembelian + 1;
                });
              }),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "http://127.0.0.1:8000/gambar-barang/" +
                          data[index].gambar,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      data[index].namabarang,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text('${formatCurrency.format(data[index].hargajual)}'),

                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          // if (transSementara.isNotEmpty) {
                          var cek = transSementara
                              .where((cari) => cari.id == data[index].id);
                          if (cek.isEmpty) {
                            transSementara.add(TransaksiSementara(
                                id: data[index].id,
                                namabarang: data[index].namabarang,
                                hargabeli: data[index].hargabeli,
                                hargajual: data[index].hargajual,
                                gambar: data[index].gambar,
                                qty: int.parse(_jumlahBarang.text)));
                          } else {
                            for (var i = 0; i < transSementara.length; i++) {
                              if (transSementara[i].id == data[index].id) {
                                transSementara[i].qty =
                                    transSementara[i].qty + 1;
                              }
                            }
                          }
                          // }
                        });
                        totalPembelian = transSementara.length;
                      },
                      child: Text('Tambah'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Colors.blue),
                        shape: StadiumBorder(),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          var cek = transSementara
                              .where((cari) => cari.id == data[index].id);
                          if (cek.isNotEmpty) {
                            for (var i = 0; i < transSementara.length; i++) {
                              if (transSementara[i].id == data[index].id) {
                                if (transSementara[i].qty > 1) {
                                  transSementara[i].qty =
                                      transSementara[i].qty - 1;
                                } else {
                                  transSementara.removeWhere((element) {
                                    return element.id == data[index].id;
                                  });
                                }
                              }
                            }
                          }

                          totalPembelian = transSementara.length;
                        });
                      },
                      child: Text('Hapus'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Colors.blue),
                        shape: StadiumBorder(),
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text("-"),
                    //     ),
                    //     SizedBox(
                    //       width: 50.0,
                    //       height: 20.0,
                    //       child: TextField(
                    //         decoration: InputDecoration(
                    //             border: OutlineInputBorder(),
                    //             fillColor: Colors.white),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text("+"),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        child: FittedBox(
          child: Stack(
            alignment: Alignment(1.4, -1.5),
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                // Your actual Fab
                onPressed: () {
                  // print("adadad");
                  // print(transSementara[0].id);
                  // transSementara.map((res) {
                  //   print(res[0].id);
                  // });
                  Get.toNamed(DetailTransaksiKeluar.routeName,
                      arguments: transSementara);
                  // for (var i = 0; i < transSementara.length; i++) {
                  //   print([
                  //     transSementara[i].id,
                  //     transSementara[i].namabarang,
                  //     transSementara[i].hargajual,
                  //     transSementara[i].gambar,
                  //     transSementara[i].qty
                  //   ]);
                  // }
                },
                child: const Icon(Icons.shopping_cart_outlined),
                // backgroundColor: Colors.deepOrange,
              ),
              totalPembelian != 0
                  ? Container(
                      // This is your Badge
                      child: Center(
                        child: Text(totalPembelian.toString(),
                            style: TextStyle(color: Colors.white)),
                      ),
                      padding: const EdgeInsets.all(8),
                      constraints:
                          const BoxConstraints(minHeight: 32, minWidth: 32),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 5,
                              color: Colors.black.withAlpha(50))
                        ],
                        borderRadius: BorderRadius.circular(16),
                        color: Colors
                            .blue[800], // This would be color of the Badge
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
