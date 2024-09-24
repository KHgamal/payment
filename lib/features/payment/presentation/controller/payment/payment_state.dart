import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';


part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = Initial;
  const factory PaymentState.loading() = Loading;
  const factory PaymentState.success(PaymentKey paymentKey) = Success;
  const factory PaymentState.failure(String message) = Failure;
}
