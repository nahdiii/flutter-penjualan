class Barang {
  final int id;
  final String namabarang;
  final int jenis_id;
  final double hargabeli;
  final double hargajual;
  final int stok;
  final String gambar;
  const Barang({
    required this.id,
    required this.namabarang,
    required this.jenis_id,
    required this.hargajual,
    required this.hargabeli,
    required this.stok,
    required this.gambar,
  });

  static Barang fromJson(json) => Barang(
        id: json["id"],
        namabarang: json["namabarang"],
        jenis_id: json["jenis_id"],
        hargabeli: json["hargabeli"],
        hargajual: json["hargajual"],
        stok: json["stok"],
        gambar: json["gambar"],
      );
}
