import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment/features/payment/domain/payment_entity.dart';

part 'payment_event.freezed.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.started(OrderEntity order) = Started;
}
