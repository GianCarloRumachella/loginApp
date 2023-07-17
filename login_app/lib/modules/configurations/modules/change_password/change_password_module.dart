import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/controllers/new_password_controller.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/pages/change_password_page.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/pages/new_password_page.dart';

class ChangePasswordModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<NewPasswordController>((i) => NewPasswordController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.password,
          child: (context, args) => const ChangePasswordPage(),
        ),
        ChildRoute(
          AppRoutes.newPassword,
          child: (context, args) => const NewPasswordPage(),
        ),
      ];
}
