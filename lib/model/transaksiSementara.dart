class TransaksiSementara {
  //modal class for Person object
  final int id;
  final String namabarang;
  final double hargabeli;
  final double hargajual;
  final String gambar;
  int qty;

  TransaksiSementara({
    required this.id,
    required this.namabarang,
    required this.hargabeli,
    required this.hargajual,
    required this.gambar,
    required this.qty,
  });

  // static TransaksiSementara fromJson(json) => TransaksiSementara(
  //       id: json["id"],
  //       namabarang: json["namabarang"],
  //       hargabeli: json["hargabeli"],
  //       hargajual: json["hargajual"],
  //       gambar: json["gambar"],
  //       qty: json["qty"],
  //     );
  factory TransaksiSementara.fromJson(Map<String, dynamic> json) =>
      _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

TransaksiSementara _$ModelFromJson(Map<String, dynamic> json) {
  return TransaksiSementara(
    id: json["id"],
    namabarang: json["namabarang"],
    hargabeli: json["hargabeli"],
    hargajual: json["hargajual"],
    gambar: json["gambar"],
    qty: json["qty"],
  );
}

Map<String, dynamic> _$ModelToJson(TransaksiSementara json) =>
    <String, dynamic>{
      'id': json.id,
      'namabarang': json.namabarang,
      'hargabeli': json.hargabeli,
      'hargajual': json.hargajual,
      'gambar': json.gambar,
      'qty': json.qty,
    };

// // class ListModel {
// //   List<TransaksiSementara> data;
// //   ListModel({required this.data});
// //   factory ListModel.fromJson(Map<String, dynamic> json) =>
// //       _$ListModelFromJson(json);
// //   Map<String, dynamic> toJson() => _$ListModelToJson(this);
// // }

// // ListModel _$ListModelFromJson(Map<String, dynamic> json) {
// //   return ListModel(
// //     data: (json['data'])
// //         ?.map((e) => e == null
// //             ? null
// //             : TransaksiSementara.fromJson(e as Map<String, dynamic>))
// //         ?.toList(),
// //   );
// // }

// // Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
// //       'data': instance.data,
// //     };
