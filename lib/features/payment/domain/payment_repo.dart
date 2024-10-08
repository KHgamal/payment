import 'package:payment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';


abstract class PaymentRepository {
  Future<Either<Failure,PaymentKey>> processPayment(OrderEntity order);
   Future<Either<Failure, ChargeResponse>> chargePayment(String token, Map<String, dynamic> chargeData); // Updated method signature

}

