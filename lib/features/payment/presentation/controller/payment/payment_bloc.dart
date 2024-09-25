import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';
import 'package:payment/features/payment/domain/payment_repo.dart';
import 'package:payment/features/payment/domain/payment_usecase.dart';
import 'package:injectable/injectable.dart';

import 'payment_event.dart';
import 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final ProcessPaymentUseCase processPaymentUseCase;
    final PaymentRepository paymentRepository;

  PaymentBloc({required this.processPaymentUseCase , required this.paymentRepository}) : super(const PaymentState.initial()) {
    on<Started>(_onStarted);
  }

  Future<void> _onStarted(Started event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.loading());

    final params = ProcessPaymentParams(order: event.order);

    final result = await processPaymentUseCase(params);

    result.fold(
      (failure) => emit(PaymentState.failure(failure.message)),
      (paymentKey) {
        // Emit the payment key and pass it to the iframe URL
        emit(PaymentState.success(paymentKey));
      },
    );
  }
/*Future<Either<Failure, ChargeResponse>> _chargePayment(String token) async {
  final chargeData = {
    "payment_token": token,
    // Add other required fields for charging
    // "amount_cents": amountInCents, // Uncomment and provide these values as needed
    // "currency": currency,
    // "order_id": orderId,
    // "integration_id": integrationId,
  };

  // Await the result of the chargePayment method
  final result = await paymentRepository.chargePayment(token, chargeData); 

  // Return the result
  return result; // Ensure you return the Future
}*/

}
