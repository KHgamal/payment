// domain/entities/payment_entities.dart

class OrderEntity {
  final int amountCents;
  final String currency;
  // Add other necessary fields

  OrderEntity({required this.amountCents, required this.currency});

  Map<String, dynamic> toJson() {
    return {
      "amount_cents": amountCents.toString(),
      "currency": currency,
      // Add other fields
    };
  }
}

class PaymentKey {
  final String token;

  PaymentKey({required this.token});
}

class ChargeResponse {
  final String status;
  // Add other fields as per the API response

  ChargeResponse({required this.status});

  factory ChargeResponse.fromJson(Map<String, dynamic> json) {
    return ChargeResponse(status: json['status']);
  }
}

