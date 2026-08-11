import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'transaction.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    int? id,
    required String description,
    required bool isIncome,
    required int ct5Amount,
    required int ct10Amount,
    required int ct20Amount,
    required int ct50Amount,
    required int eur1Amount,
    required int eur2Amount,
    required int sumInCt,
  }) = _Transaction;
}
