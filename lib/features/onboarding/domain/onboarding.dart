import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'onboarding.freezed.dart';

@Freezed(addImplicitFinal: false)
class Onboarding with _$Onboarding {
  @Entity(realClass: Onboarding)
  factory Onboarding({int? id}) = _Onboarding;
}
