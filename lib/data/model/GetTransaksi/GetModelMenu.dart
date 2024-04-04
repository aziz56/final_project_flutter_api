class MenuModel {
    int idMenu;
    String namaMenu;
    double hargaMenu;
    String deskripsiMenu;

    MenuModel({
        required this.idMenu,
        required this.namaMenu,
        required this.hargaMenu,
        required this.deskripsiMenu,
    });

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        idMenu: json["id_menu"],
        namaMenu: json["nama_menu"],
        hargaMenu: json["harga_menu"]?.toDouble(),
        deskripsiMenu: json["deskripsi_menu"],
    );

    Map<String, dynamic> toJson() => {
        "id_menu": idMenu,
        "nama_menu": namaMenu,
        "harga_menu": hargaMenu,
        "deskripsi_menu": deskripsiMenu,
    };
     @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel &&
      other.idMenu == idMenu &&
      other.namaMenu == namaMenu &&
      other.hargaMenu == hargaMenu &&
      other.deskripsiMenu == deskripsiMenu;
  }

  @override
  int get hashCode => idMenu.hashCode ^ namaMenu.hashCode ^ hargaMenu.hashCode ^ deskripsiMenu.hashCode;
}
