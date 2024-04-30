import 'dart:convert';

import 'package:gromuse/common/g_keys.dart';
import 'package:gromuse/features/auth/infrastructure/infrastructure.dart';
import 'package:gromuse/services/secure_storage_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthLocalDatasource {
  final SecureStorageService _secureStorage;

  AuthLocalDatasource({required SecureStorageService secureStorage})
      : _secureStorage = secureStorage;

  Future<void> saveUser(UserDto user) async {
    final userString = jsonEncode(user.toJson());
    await _secureStorage.write(GKeys.authUser, value: userString);
  }

  Future<UserDto?> getUser() async {
    final jsonString = await _secureStorage.read(GKeys.authUser);
    if (jsonString == null) return null;
    return UserDto.fromJson(jsonDecode(jsonString));
  }
}
