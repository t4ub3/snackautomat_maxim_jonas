import 'package:freezed_annotation/freezed_annotation.dart';

part 'sum_of_money.freezed.dart';

@freezed
abstract class SumOfMoney with _$SumOfMoney {

  const SumOfMoney._();

  const factory SumOfMoney({
    required int count200ct,
    required int count100ct,
    required int count50ct,
    required int count20ct,
    required int count10ct,
    required int count5ct,
  }) = _SumOfMoney;

  int getValueInCents() {
    return (count200ct * 200) +
        (count100ct * 100) +
        (count50ct * 50) +
        (count20ct * 20) +
        (count10ct * 10) +
        (count5ct * 5);
  }
}
