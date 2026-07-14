import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'snack.freezed.dart';

@freezed
abstract class Snack with _$Snack {
  const factory Snack({
    int? id,
    required String name,
    required double price,
    File? image,
  }) = _Snack;
}
