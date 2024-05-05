import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/domain.dart';
import 'auth_providers.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  ValueNotifier<AuthStatus> build() {
    final notifier = ValueNotifier(AuthStatus.unauthenticated);

    ref.watch(authProvider).authStatusChanges.listen((status) {
      notifier.value = status;
    });

    // Dispose of the notifier when the provider is destroyed
    ref.onDispose(notifier.dispose);

    // Notify listeners of this provider whenever the ValueNotifier updates.
    notifier.addListener(ref.notifyListeners);

    return notifier;
  }

  Future<void> signOut() => ref.read(authProvider).signOut();
}
