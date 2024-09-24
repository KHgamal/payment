import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';
import 'package:payment/features/payment/domain/payment_repo.dart';
import 'package:injectable/injectable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

@injectable
class ProcessPaymentUseCase implements UseCase<PaymentKey, OrderEntity> {
  final PaymentRepository repository;

  ProcessPaymentUseCase(this.repository);

  @override
  Future<Either<Failure, PaymentKey>> call(OrderEntity order) async {
    return await repository.processPayment(order);
  }
}
