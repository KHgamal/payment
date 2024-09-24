import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/payment/domain/payment_usecase.dart';
import 'package:injectable/injectable.dart';

import 'payment_event.dart';
import 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final ProcessPaymentUseCase processPaymentUseCase;

  PaymentBloc({required this.processPaymentUseCase}) : super(const PaymentState.initial()) {
    on<Started>(_onStarted);
  }

  Future<void> _onStarted(Started event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.loading());

    final result = await processPaymentUseCase(event.order);

    result.fold(
      (failure) => emit(PaymentState.failure(failure.message)),
      (paymentKey) => emit(PaymentState.success(paymentKey)),
    );
  }
}
