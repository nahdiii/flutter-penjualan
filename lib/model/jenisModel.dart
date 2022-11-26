class Jenis {
  final int id;
  final String namajenis;

  const Jenis({
    required this.id,
    required this.namajenis,
  });

  static Jenis fromJson(json) => Jenis(
        id: json["id"],
        namajenis: json["namajenis"],
      );
}
