import 'package:payment/core/common/styles/strings.dart';
import 'package:payment/features/payment/data/models/payment_models.dart';
import 'package:payment/features/payment/data/services/payment_service.dart';

abstract class PaymentRemoteDataSource {
  Future<AuthResponse> authenticate();
  Future<OrderResponse> registerOrder(String token, Map<String, dynamic> orderData);
  Future<PaymentKeyResponse> requestPaymentKey(String token, Map<String, dynamic> paymentKeyData);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiClient apiClient;

  PaymentRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AuthResponse> authenticate() async {
    final body = {"api_key": apiKey};
    return await apiClient.authenticate(body);
  }

  @override
  Future<OrderResponse> registerOrder(String token, Map<String, dynamic> orderData) async {
    return await apiClient.registerOrder("Bearer $token", orderData);
  }

  @override
  Future<PaymentKeyResponse> requestPaymentKey(String token, Map<String, dynamic> paymentKeyData) async {
    return await apiClient.requestPaymentKey("Bearer $token", paymentKeyData);
  }
}
