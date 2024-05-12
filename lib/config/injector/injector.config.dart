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

import '../../features/auth/domain/domain.dart' as _i10;
import '../../features/auth/infrastructure/auth_facade.dart' as _i11;
import '../../features/auth/infrastructure/datasources/auth_local_datasource.dart'
    as _i8;
import '../../features/auth/infrastructure/datasources/auth_remote_datasource.dart'
    as _i9;
import '../../features/auth/infrastructure/datasources/datasources.dart'
    as _i12;
import '../../features/product/domain/domain.dart' as _i14;
import '../../features/product/infrastructure/datasources/datasources.dart'
    as _i16;
import '../../features/product/infrastructure/datasources/product_local_datasource.dart'
    as _i5;
import '../../features/product/infrastructure/datasources/product_remote_datasource.dart'
    as _i13;
import '../../features/product/infrastructure/product_facade.dart' as _i15;
import '../../services/objectbox_service.dart' as _i6;
import '../../services/secure_storage_service.dart' as _i7;
import '../../services/services.dart' as _i4;
import 'register_module.dart' as _i17;

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
    gh.lazySingleton<_i5.ProductLocalDatasource>(() =>
        _i5.ProductLocalDatasource(objectBox: gh<_i6.ObjectBoxService>()));
    gh.lazySingleton<_i7.SecureStorageService>(
        () => _i7.SecureStorageService());
    await gh.factoryAsync<_i4.SupabaseService>(
      () => registerModule.supabase,
      preResolve: true,
    );
    gh.factory<_i8.AuthLocalDatasource>(() =>
        _i8.AuthLocalDatasource(secureStorage: gh<_i7.SecureStorageService>()));
    gh.factory<_i9.AuthRemoteDatasource>(
        () => _i9.AuthRemoteDatasource(supabase: gh<_i4.SupabaseService>()));
    gh.factory<_i10.IAuthFacade>(() => _i11.AuthFacade(
          local: gh<_i12.AuthLocalDatasource>(),
          remote: gh<_i12.AuthRemoteDatasource>(),
        ));
    gh.lazySingleton<_i13.ProductRemoteDatasource>(() =>
        _i13.ProductRemoteDatasource(supabase: gh<_i4.SupabaseService>()));
    gh.factory<_i14.IProductFacade>(() => _i15.ProductFacade(
          remote: gh<_i16.ProductRemoteDatasource>(),
          local: gh<_i16.ProductLocalDatasource>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
