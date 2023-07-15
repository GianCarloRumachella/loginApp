import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/registration/presentation/controllers/registration_controller.dart';
import 'package:login_app/modules/registration/presentation/pages/registration_page.dart';

class RegistrationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<RegistrationController>((i) => RegistrationController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.registration,
          child: (context, args) => const RegistrationPage(),
        ),
      ];
}
