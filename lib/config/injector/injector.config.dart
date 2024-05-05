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

import '../../features/auth/domain/domain.dart' as _i8;
import '../../features/auth/infrastructure/auth_facade.dart' as _i9;
import '../../features/auth/infrastructure/datasources/auth_local_datasource.dart'
    as _i6;
import '../../features/auth/infrastructure/datasources/auth_remote_datasource.dart'
    as _i7;
import '../../features/auth/infrastructure/datasources/datasources.dart'
    as _i10;
import '../../services/secure_storage_service.dart' as _i5;
import '../../services/services.dart' as _i4;
import 'register_module.dart' as _i11;

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
    await gh.factoryAsync<_i4.ObjectBoxService>(
      () => registerModule.objectbox,
      preResolve: true,
    );
    gh.lazySingleton<_i5.SecureStorageService>(
        () => _i5.SecureStorageService());
    await gh.factoryAsync<_i4.SupabaseService>(
      () => registerModule.supabase,
      preResolve: true,
    );
    gh.factory<_i6.AuthLocalDatasource>(() =>
        _i6.AuthLocalDatasource(secureStorage: gh<_i5.SecureStorageService>()));
    gh.factory<_i7.AuthRemoteDatasource>(
        () => _i7.AuthRemoteDatasource(supabase: gh<_i4.SupabaseService>()));
    gh.factory<_i8.IAuthFacade>(() => _i9.AuthFacade(
          local: gh<_i10.AuthLocalDatasource>(),
          remote: gh<_i10.AuthRemoteDatasource>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
