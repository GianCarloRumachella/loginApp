import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/login/presentation/pages/login_home.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const LoginHome(),
        )
      ];
}
