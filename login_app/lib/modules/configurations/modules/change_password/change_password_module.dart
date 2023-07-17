import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/configurations/modules/change_password/data/datasource/change_password_datasource.dart';
import 'package:login_app/modules/configurations/modules/change_password/data/datasource/local/change_password_datasource_imp.dart';
import 'package:login_app/modules/configurations/modules/change_password/data/repositories/change_password_repository_imp.dart';
import 'package:login_app/modules/configurations/modules/change_password/domain/repositories/change_password_repository.dart';
import 'package:login_app/modules/configurations/modules/change_password/domain/usecases/update_password.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/controllers/change_password_controller.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/controllers/new_password_controller.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/pages/change_password_page.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/pages/new_password_page.dart';

class ChangePasswordModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<ChangePasswordDatasource>((i) => ChangePasswordDatasourceImp()),
        Bind.lazySingleton<ChangePasswordRepository>((i) => ChangePasswordRepositoryImp(datasource: i.get<ChangePasswordDatasource>())),
        Bind.lazySingleton<UpdatePassword>((i) => UpdatePasswordImp(repository: i.get<ChangePasswordRepository>())),
        Bind.lazySingleton<NewPasswordController>((i) => NewPasswordController(updatePassword: i.get<UpdatePassword>())),
        Bind.lazySingleton<ChangePasswordController>((i) => ChangePasswordController()),
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
