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
}