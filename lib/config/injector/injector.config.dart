// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/domain/domain.dart' as _i9;
import '../../features/auth/infrastructure/auth_facade.dart' as _i10;
import '../../features/auth/infrastructure/datasources/auth_local_datasource.dart'
    as _i7;
import '../../features/auth/infrastructure/datasources/auth_remote_datasource.dart'
    as _i8;
import '../../features/auth/infrastructure/datasources/datasources.dart'
    as _i11;
import '../../services/secure_storage_service.dart' as _i6;
import '../../services/services.dart' as _i5;
import '../router/router.dart' as _i4;
import 'register_module.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.factory<_i4.GromuseRouter>(() => _i4.GromuseRouter());
    await gh.factoryAsync<_i5.ObjectBoxService>(
      () => registerModule.objectbox,
      preResolve: true,
    );
    gh.lazySingleton<_i6.SecureStorageService>(
        () => _i6.SecureStorageService());
    await gh.factoryAsync<_i5.SupabaseService>(
      () => registerModule.supabase,
      preResolve: true,
    );
    gh.factory<_i7.AuthLocalDatasource>(() =>
        _i7.AuthLocalDatasource(secureStorage: gh<_i6.SecureStorageService>()));
    gh.factory<_i8.AuthRemoteDatasource>(
        () => _i8.AuthRemoteDatasource(supabase: gh<_i5.SupabaseService>()));
    gh.factory<_i9.IAuthFacade>(() => _i10.AuthFacade(
          local: gh<_i11.AuthLocalDatasource>(),
          remote: gh<_i11.AuthRemoteDatasource>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
