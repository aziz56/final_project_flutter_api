class TotalBalance {
    int balance;

    TotalBalance({
        required this.balance,
    });

    factory TotalBalance.fromJson(Map<String, dynamic> json) => TotalBalance(
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "balance": balance,
    };
}
