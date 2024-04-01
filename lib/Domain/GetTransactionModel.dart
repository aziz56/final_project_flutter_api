
import 'dart:convert';
ModelPenjualan modelPenjualanFromJson(String str) => ModelPenjualan.fromJson(json.decode(str));

String modelPenjualanToJson(ModelPenjualan data) => json.encode(data.toJson());

class ModelPenjualan {
    int idPenjualan;
    String namaPelanggan;
    dynamic namaMenu;
    int hargaMenu;
    int noMeja;
    int jumlahPesanan;
    int totalPenjualan;
    int kembalian;
    int amount;
    int idMenu;
    int idPelanggan;
    int idMeja;

    ModelPenjualan({
        required this.idPenjualan,
        required this.namaPelanggan,
        required this.namaMenu,
        required this.hargaMenu,
        required this.noMeja,
        required this.jumlahPesanan,
        required this.totalPenjualan,
        required this.kembalian,
        required this.amount,
        required this.idMenu,
        required this.idPelanggan,
        required this.idMeja,
    });

    factory ModelPenjualan.fromJson(Map<String, dynamic> json) => ModelPenjualan(
        idPenjualan: json["id_penjualan"],
        namaPelanggan: json["nama_pelanggan"],
        namaMenu: json["nama_menu"],
        hargaMenu: json["harga_menu"],
        noMeja: json["no_meja"],
        jumlahPesanan: json["jumlah_pesanan"],
        totalPenjualan: json["total_penjualan"],
        kembalian: json["kembalian"],
        amount: json["amount"],
        idMenu: json["id_menu"],
        idPelanggan: json["id_pelanggan"],
        idMeja: json["id_meja"],
    );

    Map<String, dynamic> toJson() => {
        "id_penjualan": idPenjualan,
        "nama_pelanggan": namaPelanggan,
        "nama_menu": namaMenu,
        "harga_menu": hargaMenu,
        "no_meja": noMeja,
        "jumlah_pesanan": jumlahPesanan,
        "total_penjualan": totalPenjualan,
        "kembalian": kembalian,
        "amount": amount,
        "id_menu": idMenu,
        "id_pelanggan": idPelanggan,
        "id_meja": idMeja,
    };
}