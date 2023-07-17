import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  Future<void> saveSession(UserModel userModel) async {
    final String session = userModel.toJson();

    await _storage.write(key: 'session', value: session);
  }

  Future<UserModel> getSession() async {
    final session = await _storage.readAll(
      aOptions: getAndroidOptions(),
    );
    final userSession = jsonDecode(session['session'] ?? '');

    UserModel user = UserModel(
      id: int.tryParse(userSession['id'].toString()) ?? 0,
      name: userSession['name'] ?? '',
      email: userSession['email'] ?? '',
      password: userSession['password'] ?? '',
    );

    return user;
  }

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
