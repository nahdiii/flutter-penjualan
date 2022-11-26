class Pengguna {
  final int id;
  final String name;
  final String email;

  const Pengguna({
    required this.id,
    required this.name,
    required this.email,
  });

  static Pengguna fromJson(json) => Pengguna(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );
}
