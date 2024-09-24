// data/sources/remote/payment_remote_data_source.dart

import 'package:injectable/injectable.dart';
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
    //ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RrM016UTJMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuWEtaUlZac3dmaWFPdVVMajZkQ1JWRzA1X0hFZWl0VU9YUl9rVGF0cUV4ZWZkMnVIbl9nNFNNQ0ltc2pYaGVxbm1mQ245QUJEb01sRXRHR1o1TWNsc1E=
    final body = {"api_key": "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RrM016UTJMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuWEtaUlZac3dmaWFPdVVMajZkQ1JWRzA1X0hFZWl0VU9YUl9rVGF0cUV4ZWZkMnVIbl9nNFNNQ0ltc2pYaGVxbm1mQ245QUJEb01sRXRHR1o1TWNsc1E="};
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
