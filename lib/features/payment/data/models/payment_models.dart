// data/models/payment_models.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_models.freezed.dart';
part 'payment_models.g.dart';

// 1. AuthResponse
@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    required String token,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

// 2. OrderResponse
@freezed
class OrderResponse with _$OrderResponse {
  factory OrderResponse({
    required int id,
    required String created_at,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
}

// 3. PaymentKeyResponse
@freezed
class PaymentKeyResponse with _$PaymentKeyResponse {
  factory PaymentKeyResponse({
    required String token,
  }) = _PaymentKeyResponse;

  factory PaymentKeyResponse.fromJson(Map<String, dynamic> json) => _$PaymentKeyResponseFromJson(json);
}
