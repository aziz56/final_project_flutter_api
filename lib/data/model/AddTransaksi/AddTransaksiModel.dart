class AddTransaksiModel 
{
    String namaPelanggan;
    int hargaMenu;
    int jumlahPesanan;
    int amount;
    int idMenu;
    int idMeja;

    AddTransaksiModel({
        required this.namaPelanggan,
        required this.hargaMenu,
        required this.jumlahPesanan,
        required this.amount,
        required this.idMenu,
        required this.idMeja,
    });

    factory AddTransaksiModel.fromJson(Map<String, dynamic> json) => AddTransaksiModel(
        namaPelanggan: json["nama_pelanggan"],
        hargaMenu: json["harga_menu"],
        jumlahPesanan: json["jumlah_pesanan"],
        amount: json["amount"],
        idMenu: json["id_menu"],
        idMeja: json["id_meja"],
    );

    Map<String, dynamic> toJson() => {
        "nama_pelanggan": namaPelanggan,
        "harga_menu": hargaMenu,
        "jumlah_pesanan": jumlahPesanan,
        "amount": amount,
        "id_menu": idMenu,
        "id_meja": idMeja,
    };

}