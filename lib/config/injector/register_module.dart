import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gromuse/services/services.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @preResolve
  Future<ObjectBoxService> get objectbox => ObjectBoxService.create();

  @preResolve
  Future<SupabaseService> get supabase => SupabaseService.initialize();
}
