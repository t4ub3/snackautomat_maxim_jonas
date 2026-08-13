import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snackautomat/models/coin_value.dart';

part 'coin.freezed.dart';

@freezed
abstract class Coin with _$Coin {
  const factory Coin({required CoinValue value}) = _Coin;
}
