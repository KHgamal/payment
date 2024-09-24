import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';
import 'package:payment/features/payment/domain/payment_repo.dart';
import 'package:injectable/injectable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

@injectable
class ProcessPaymentUseCase implements UseCase<PaymentKey, ProcessPaymentParams> {
  final PaymentRepository repository;

  ProcessPaymentUseCase(this.repository);

  @override
  Future<Either<Failure, PaymentKey>> call(ProcessPaymentParams params) async {
    return await repository.processPayment(params.order);
  }
}

class ProcessPaymentParams {
  final OrderEntity order;

  ProcessPaymentParams({
    required this.order,
  });
}

