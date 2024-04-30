import 'dart:async';

import 'package:gromuse/services/services.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/auth_status.dart';

@injectable
class AuthRemoteDatasource {
  final SupabaseService _supabase;

  AuthRemoteDatasource({required SupabaseService supabase})
      : _supabase = supabase {
    _authStatusController = StreamController<AuthStatus>.broadcast();
    _supabase.client.auth.onAuthStateChange.listen((state) {
      final authStatus = state.session == null
          ? AuthStatus.unauthenticated
          : AuthStatus.authenticated;
      _authStatusController.add(authStatus);
    });
  }

  late final StreamController<AuthStatus> _authStatusController;

  Stream<AuthStatus> get authStatusChanges => _authStatusController.stream;

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await _supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _supabase.client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.session != null) {
      await updateDisplayName(name);
    }

    return response;
  }

  Future<void> updateDisplayName(String name) async {
    final attributes = UserAttributes(data: {'display_name': name});
    await _supabase.client.auth.updateUser(attributes);
  }
}
