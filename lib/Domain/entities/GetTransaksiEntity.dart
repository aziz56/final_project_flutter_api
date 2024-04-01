class GetTransaksiEntity {
  final int id;
  final String namaPelanggan;
  final String namaMenu;
  final double hargaMenu;
  final int noMeja;
  final int jumlahPesanan;
  final double totalPenjualan;
  final double kembalian;
  final double amount;

  GetTransaksiEntity({
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
}
