/* import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:your_project/data/models/paymob_payment_response.dart';

part 'paymob_service.g.dart';

@RestApi(baseUrl: "https://accept.paymobsolutions.com/api")
abstract class PaymobService {
  factory PaymobService(Dio dio, {String baseUrl}) = _PaymobService;

  @POST("/auth/tokens")
  Future<AuthTokenResponse> getAuthToken(@Body() Map<String, dynamic> body);

  @POST("/ecommerce/orders")
  Future<OrderResponse> createOrder(@Body() Map<String, dynamic> body);

  @POST("/acceptance/payment_keys")
  Future<PaymentKeyResponse> getPaymentKey(@Body() Map<String, dynamic> body);
} */
