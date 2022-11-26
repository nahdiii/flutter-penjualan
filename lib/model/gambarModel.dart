class GambarModel {
  final int id;
  final String name;
  final String gambar;

  const GambarModel({
    required this.id,
    required this.name,
    required this.gambar,
  });

  static GambarModel fromJson(json) => GambarModel(
        id: json["id"],
        name: json["name"],
        gambar: json["gambar"],
      );
}
