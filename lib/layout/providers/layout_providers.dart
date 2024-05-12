import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'layout_providers.g.dart';

@riverpod
ScrollController globalScrollController(GlobalScrollControllerRef ref) {
  return ScrollController();
}
