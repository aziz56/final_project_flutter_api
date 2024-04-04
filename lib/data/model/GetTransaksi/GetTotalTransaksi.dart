class GetTotalTransaksi
{
  int totalTransaksi;
  GetTotalTransaksi({
    required this.totalTransaksi,
  });
 factory GetTotalTransaksi.fromJson(Map<String, dynamic> json) => GetTotalTransaksi(
        totalTransaksi: json["total_transaksi"],
    );
    Map<String, dynamic> toJson() => {
        "total_transaksi": totalTransaksi,
    };


}