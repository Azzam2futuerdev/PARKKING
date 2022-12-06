class Order {
  String id;
  String date;
  String amount;
  String carDetails;
  String customerId;

  Order({required this.id,required this.carDetails,required this.amount,required this.date,required this.customerId});

  factory Order.fromFirestore(dynamic user) {
    return Order(
      id: user.get("id"),
      date: user.get("date"),
      amount: user.get("amount"),
      carDetails: user.get("carDetails"),
      customerId: user.get("customerId"),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "date": date,
      "amount": amount,
      "carDetails": carDetails,
      "customerId": customerId,
    };
  }
}