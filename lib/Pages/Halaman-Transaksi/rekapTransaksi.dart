import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:penjualan/API/api.dart';
import 'package:penjualan/Pages/Halaman-Transaksi/det.dart';
import 'package:penjualan/model/transaksiSementara.dart';

class RekapTransaksi extends StatefulWidget {
  const RekapTransaksi({Key? key}) : super(key: key);
  static const String routeName = "/rekap-transaksi";

  @override
  State<RekapTransaksi> createState() => _RekapTransaksiState();
}

class _RekapTransaksiState extends State<RekapTransaksi> {
  final formatCurrency = new NumberFormat.simpleCurrency(locale: "idn");
  List<TransaksiSementara> data = [];
  double keuntungan = 0;

  DateTime? _selectedDateTglAwal;
  DateTime? _selectedDateTglAkhir;

  final TextEditingController _tglAwal = TextEditingController();
  final TextEditingController _tglAkhir = TextEditingController();

  _selectDateTglAwal(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.blue,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDateTglAwal = newSelectedDate;
      _tglAwal
        ..text = DateFormat("yyyy-MM-dd").format(_selectedDateTglAwal!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _tglAwal.text.length, affinity: TextAffinity.upstream));
    }
  }

  _selectDateTglAkhir(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.blue,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDateTglAkhir = newSelectedDate;
      _tglAkhir
        ..text = DateFormat("yyyy-MM-dd").format(_selectedDateTglAkhir!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _tglAkhir.text.length, affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rekap Transaksi Keluar"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          readOnly: true,
                          controller: _tglAwal,
                          onTap: () {
                            _selectDateTglAwal(context)!;
                          },
                          decoration: new InputDecoration(
                            labelText: "Tanggal Awal",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            // fillColor: Colors.green
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Tanggal Awal masih kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          readOnly: true,
                          controller: _tglAkhir,
                          onTap: () {
                            _selectDateTglAkhir(context)!;
                          },
                          decoration: new InputDecoration(
                            labelText: "Tanggal Akhir",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Tanggal Akhir masih kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                            icon: const Icon(
                              // Icons.date_range,
                              Icons.search,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () async {
                              if (_tglAwal.text.isNotEmpty &&
                                  _tglAkhir.text.isNotEmpty) {
                                var response = await CallApi().getData(
                                    'rekap-transaksi/' +
                                        _tglAwal.text +
                                        '/' +
                                        _tglAkhir.text);

                                if (response.statusCode == 200) {
                                  var dtTrans = jsonDecode(response.body);

                                  // var dtTrans = jsonDecode(response.body);
                                  setState(() {
                                    data.clear();
                                    for (var jsonTransaksi in dtTrans) {
                                      TransaksiSementara dtTransaksi =
                                          TransaksiSementara(
                                        id: jsonTransaksi["id"],
                                        namabarang: jsonTransaksi["namabarang"],
                                        hargabeli: double.parse(
                                            jsonTransaksi["hargabeli"]
                                                .toString()),
                                        hargajual: double.parse(
                                            jsonTransaksi["hargajual"]
                                                .toString()),
                                        gambar: "",
                                        qty: int.parse(
                                          jsonTransaksi["qty"].toString(),
                                        ),
                                      );
                                      data.add(dtTransaksi);
                                    }
                                    keuntungan = 0;
                                    data.forEach((item) {
                                      //getting the key direectly from the name of the key
                                      keuntungan +=
                                          (item.hargajual - item.hargabeli) *
                                              item.qty;
                                      // print(item.id);
                                    });
                                  });
                                  // Get.toNamed(DetailRekap.routeName,
                                  //     arguments: data);
                                }
                              }

                              // print(data);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 12,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: DataTable(
                    // headingRowColor: MaterialStateColor.resolveWith(
                    //     (states) => Colors.blue),
                    columns: [
                      DataColumn(
                          label: Text('Barang',
                              style: TextStyle(
                                // fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text('HBeli',
                              style: TextStyle(
                                // fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text('HJual',
                              style: TextStyle(
                                // fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text('Qty',
                              style: TextStyle(
                                // fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text('Subtotal',
                              style: TextStyle(
                                // fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ))),
                    ],
                    rows:
                        data // Loops through dataColumnText, each iteration assigning the value to element
                            .map(
                              ((element) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(element.namabarang)),
                                      DataCell(Text(formatCurrency
                                          .format(element.hargabeli)
                                          .toString())),
                                      DataCell(Text(formatCurrency
                                          .format(element.hargajual)
                                          .toString())),
                                      DataCell(Text(element.qty.toString())),
                                      DataCell(Text(
                                          '${formatCurrency.format(element.hargajual * element.qty)}')),
                                    ],
                                  )),
                            )
                            .toList(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            color: Colors.black,
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
