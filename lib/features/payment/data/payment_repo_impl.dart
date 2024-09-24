/*import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/features/payment/data/payment_data_source.dart';
import 'package:payment/features/payment/domain/payment_repo.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymobService service;

  PaymentRepositoryImpl(this.service);

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    try {
      final response = await service.getAuthToken({'api_key': "API_KEY"});
      return Right(response.token);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> createOrder(Map<String, dynamic> orderData) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, String>> getPaymentKey(Map<String, dynamic> paymentData) {
    // TODO: implement getPaymentKey
    throw UnimplementedError();
  }

  // Similarly, implement createOrder and getPaymentKey
}*/
