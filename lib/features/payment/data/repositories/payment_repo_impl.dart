import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment/core/common/styles/strings.dart';
import 'package:payment/core/errors/dio_exception.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:payment/features/payment/data/data_source/remote_datasource.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';
import 'package:payment/features/payment/domain/payment_repo.dart';

@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final SharedPreferences sharedPreferences;

  PaymentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.sharedPreferences,
  });

  // Saving payment token in SharedPreferences
  Future<void> _savePaymentToken(String token) async {
    await sharedPreferences.setString('payment_token', token);
  }

  // Retrieving payment token from SharedPreferences
  String? _getPaymentToken() {
    return sharedPreferences.getString('payment_token');
  }

  @override
  Future<Either<Failure, PaymentKey>> processPayment(OrderEntity order) async {
    if (await networkInfo.isConnected) {
      try {
        // 1. Authenticate
        final authResponse = await remoteDataSource.authenticate();

        // 2. Register Order
        final orderResponse = await remoteDataSource.registerOrder(
            authResponse.token, order.toJson());

        // 3. Request Payment Key
        final paymentKeyData = {
          //ALL OF THEM ARE REQIERD
          "expiration": 3600,

          "auth_token": authResponse.token, //From First Api
          "order_id":
              orderResponse.id.toString(), //From Second Api  >>(STRING)<<
          "integration_id":
              integrationId, //Integration Id Of The Payment Method

          "amount_cents": order.amountCents,
          "currency": order.currency,

          "billing_data": {
            //Have To Be Values
            "first_name": "Clifford",
            "last_name": "Nicolas",
            "email": "claudette09@exa.com",
            "phone_number": "+86(8)9135210487",

            //Can Set "NA"
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA"
          },
        };
        final paymentKeyResponse = await remoteDataSource.requestPaymentKey(
            authResponse.token, paymentKeyData);

        // 4. Save the payment token in Shared Preferences
        await _savePaymentToken(paymentKeyResponse.token);

        return Right(PaymentKey(token: paymentKeyResponse.token));
      } on DioException catch (e) {
        final dioExceptionModel = DioExceptionModel.fromDioError(
          e,
          e.response?.data['message'] ?? 'An unexpected error occurred',
        );
        return Left(ServerFailure(dioExceptionModel.errorMessage));
      }
    } else {
      return const Left(ServerFailure("No internet connection"));
    }
  }
   
    @override
  Future<Either<Failure, ChargeResponse>> chargePayment(String token, Map<String, dynamic> chargeData) async {
    if (await networkInfo.isConnected) {
      try {
        // Call the remote data source's chargePayment method with both parameters
        final response = await remoteDataSource.chargePayment(token, chargeData);
        return Right(response);
      } on DioException catch (e) {
        final dioExceptionModel = DioExceptionModel.fromDioError(
          e,
          e.response?.data['message'] ?? 'An unexpected error occurred',
        );
        return Left(ServerFailure(dioExceptionModel.errorMessage));
      }
    } else {
      return const Left(ServerFailure("No internet connection"));
    }
  }

   // Retrieve stored payment token if needed
 String? getSavedPaymentToken() {
    return _getPaymentToken();
  }
}
