import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/modules/configurations/configurations_module.dart';
import 'package:login_app/modules/core/core_module.dart';
import 'package:login_app/modules/home/home_module.dart';
import 'package:login_app/modules/login/login_module.dart';
import 'package:login_app/modules/registration/registration_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: CoreModule()),
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute(Modular.initialRoute, module: RegistrationModule()),
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute(Modular.initialRoute, module: ConfigurationsModule()),
      ];
}
