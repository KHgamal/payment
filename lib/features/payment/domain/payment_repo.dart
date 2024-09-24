import 'package:payment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> getAuthToken();
  Future<Either<Failure, String>> createOrder(Map<String, dynamic> orderData);
  Future<Either<Failure, String>> getPaymentKey(Map<String, dynamic> paymentData);
}
