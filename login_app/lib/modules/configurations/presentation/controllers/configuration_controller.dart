import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/core/secure_storage/secure_storage.dart';

class ConfigurationController {
  logout() async {
    await SecureStorage().deleteSession();

    Modular.to.pushNamed(AppRoutes.initialRoute);
  }
}
