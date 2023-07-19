import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/login/data/datasource/local/login_datasource_imp.dart';
import 'package:login_app/modules/login/data/datasource/login_datasource.dart';
import 'package:login_app/modules/login/data/repositories/login_repository_imp.dart';
import 'package:login_app/modules/login/domain/repositories/login_repository.dart';
import 'package:login_app/modules/login/domain/usecases/auth_user_usecase.dart';
import 'package:login_app/modules/login/presentation/controllers/login_controller.dart';
import 'package:login_app/modules/login/presentation/pages/login_home.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<LoginDatasource>(
          (i) => LoginDatasourceImp(),
        ),
        Bind.lazySingleton<LoginRepository>(
          (i) => LoginRepositoryImp(
            datasource: i.get<LoginDatasource>(),
          ),
        ),
        Bind.lazySingleton<AuthUserUsecase>(
          (i) => AuthUserUsecaseImp(
            repository: i.get<LoginRepository>(),
          ),
        ),
        Bind.factory<LoginController>(
          (i) => LoginController(
            authUserUsecase: i.get<AuthUserUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const LoginHome(),
        )
      ];
}
