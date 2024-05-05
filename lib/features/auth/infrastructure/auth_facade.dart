import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../domain/domain.dart';
import 'datasources/datasources.dart';
import 'dtos/dtos.dart';

@Injectable(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final AuthLocalDatasource _local;
  final AuthRemoteDatasource _remote;

  AuthFacade({
    required AuthLocalDatasource local,
    required AuthRemoteDatasource remote,
  })  : _local = local,
        _remote = remote;

  final _log = Logger();

  @override
  Stream<AuthStatus> get authStatusChanges => _remote.authStatusChanges;

  @override
  Future<Either<AuthException, Unit>> login({
    required IEmail email,
    required IPassword password,
  }) async {
    try {
      await _remote.login(email: email.get()!, password: password.get()!);
      // await _local.saveUser(user)
      return right(unit);
    } on supabase.AuthException catch (e) {
      return left(AuthException.message(e.message));
    }
  }

  @override
  Future<Either<AuthException, Unit>> register({
    required IName name,
    required IEmail email,
    required IPassword password,
  }) async {
    try {
      final response = await _remote.register(
        name: name.get()!,
        email: email.get()!,
        password: password.get()!,
      );

      final user = response.user!;

      await _local.saveUser(UserDto(
        id: user.id,
        email: user.email!,
        name: user.userMetadata!['display_name'],
        isVerified: user.userMetadata!['email_verified'],
      ));

      return right(unit);
    } on supabase.AuthException catch (e) {
      _log.e(e);
      return left(AuthException.message(e.message));
    }
  }

  @override
  Future<void> signOut() => _remote.signOut();
}
