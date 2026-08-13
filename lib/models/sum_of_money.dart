import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snackautomat/models/coin.dart';

part 'sum_of_money.freezed.dart';

@freezed
abstract class SumOfMoney with _$SumOfMoney {
  const factory SumOfMoney({required List<Coin> coins}) = _SumOfMoney;
}
