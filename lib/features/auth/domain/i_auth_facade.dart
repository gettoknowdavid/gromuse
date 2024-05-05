import 'package:dartz/dartz.dart';

import 'domain.dart';

abstract class IAuthFacade {
  Stream<AuthStatus> get authStatusChanges;

  Future<Either<AuthException, Unit>> login({
    required IEmail email,
    required IPassword password,
  });

  Future<Either<AuthException, Unit>> register({
    required IName name,
    required IEmail email,
    required IPassword password,
  });

  Future<void> signOut();
}
