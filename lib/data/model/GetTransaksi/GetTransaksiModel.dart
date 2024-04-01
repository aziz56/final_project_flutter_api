
class GetTransaksiModel {
  final int id;
  final String namaPelanggan;
  final String namaMenu;
  final double hargaMenu;
  final int noMeja;
  final int jumlahPesanan;
  final double totalPenjualan;
  final double kembalian;
  final double amount;

  GetTransaksiModel({
    required this.id,
    required this.namaPelanggan,
    required this.namaMenu,
    required this.hargaMenu,
    required this.noMeja,
    required this.jumlahPesanan,
    required this.totalPenjualan,
    required this.kembalian,
    required this.amount,
  });
  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_pelanggan": namaPelanggan,
    "nama_menu": namaMenu,
    "harga_menu": hargaMenu,
    "no_meja": noMeja,
    "jumlah_pesanan": jumlahPesanan,
    "total_penjualan": totalPenjualan,
    "kembalian": kembalian,
    "amount": amount,
  };
  factory GetTransaksiModel.fromJson(Map<String, dynamic> json) => GetTransaksiModel(
    id: json["id"],
    namaPelanggan: json["nama_pelanggan"],
    namaMenu: json["nama_menu"],
    hargaMenu: json["harga_menu"],
    noMeja: json["no_meja"],
    jumlahPesanan: json["jumlah_pesanan"],
    totalPenjualan: json["total_penjualan"],
    kembalian: json["kembalian"],
    amount: json["amount"],
  );
}