import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment/core/errors/dio_exception.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/network_info.dart';
import 'package:payment/features/payment/data/data_source/remote_datasource.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';
import 'package:payment/features/payment/domain/payment_repo.dart';
@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PaymentRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PaymentKey>> processPayment(OrderEntity order) async {
    if (await networkInfo.isConnected) {
      try {
        // 1. Authenticate
        final authResponse = await remoteDataSource.authenticate();

        // 2. Register Order
        final orderResponse = await remoteDataSource.registerOrder(authResponse.token, order.toJson());

        // 3. Request Payment Key
        final paymentKeyData =  {
        //ALL OF THEM ARE REQIERD
        "expiration": 3600,

        "auth_token": authResponse.token,//From First Api
        "order_id":orderResponse.id.toString(),//From Second Api  >>(STRING)<<
        "integration_id": 4839998,//Integration Id Of The Payment Method
        
        "amount_cents":order.amountCents, 
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
        final paymentKeyResponse = await remoteDataSource.requestPaymentKey(authResponse.token, paymentKeyData);

        return Right(PaymentKey(token: paymentKeyResponse.token));
      } 
      on DioException catch (e) {
  final dioExceptionModel = DioExceptionModel.fromDioError(
    e,e.response?.data['message'] ?? 'An unexpected error occurred',);
  return Left(ServerFailure(dioExceptionModel.errorMessage));
}
    } else {
      return const Left( ServerFailure("No internet connection"));
    }
  }
}
