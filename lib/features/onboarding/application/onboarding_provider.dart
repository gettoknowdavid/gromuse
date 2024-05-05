import 'package:gromuse/config/config.dart';
import 'package:gromuse/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/domain.dart';

part 'onboarding_provider.g.dart';

@riverpod
void completeOnboarding(CompleteOnboardingRef ref) {
  final store = di<ObjectBoxService>().store;
  final box = store.box<Onboarding>();

  if (box.isEmpty()) {
    box.put(Onboarding());
  }
}

@riverpod
void clearOnboarding(ClearOnboardingRef ref) {
  final store = di<ObjectBoxService>().store;
  store.box<Onboarding>().removeAll();
}

@riverpod
bool isOnboarded(IsOnboardedRef ref) {
  final store = di<ObjectBoxService>().store;
  return !store.box<Onboarding>().isEmpty();
}
