// core/network/api_client.dart

import 'package:dio/dio.dart';
import 'package:payment/features/payment/data/models/payment_models.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';
import 'package:retrofit/retrofit.dart';


part 'payment_service.g.dart';

@RestApi(baseUrl: "https://accept.paymobsolutions.com/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // 1. Authentication Request
  @POST("/auth/tokens")
  Future<AuthResponse> authenticate(@Body() Map<String, dynamic> body);

  // 2. Order Registration API
  @POST("/ecommerce/orders")
  Future<OrderResponse> registerOrder(@Header("Authorization") String token, @Body() Map<String, dynamic> body);

  // 3. Payment Key Request
  @POST("/acceptance/payment_keys")
  Future<PaymentKeyResponse> requestPaymentKey(@Header("Authorization") String token, @Body() Map<String, dynamic> body);

  // 4. Charge Payment
  @POST("/charge")
  Future<ChargeResponse> charge(@Body() Map<String, dynamic> chargeData);
}

