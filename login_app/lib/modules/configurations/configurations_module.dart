import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/configurations/modules/change_password/change_password_module.dart';
import 'package:login_app/modules/configurations/presentation/controllers/configuration_controller.dart';
import 'package:login_app/modules/configurations/presentation/pages/configuration_home_page.dart';

class ConfigurationsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<ConfigurationController>((i) => ConfigurationController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: ChangePasswordModule()),
        ChildRoute(
          AppRoutes.configuration,
          child: (context, args) => ConfigurationHomePage(),
        )
      ];
}
