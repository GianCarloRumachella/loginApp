import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/registration/data/datasource/local/registration_datasource_imp.dart';
import 'package:login_app/modules/registration/data/datasource/registration_datasource.dart';
import 'package:login_app/modules/registration/data/repositories/registration_repository_imp.dart';
import 'package:login_app/modules/registration/domain/repositories/registration_repository.dart';
import 'package:login_app/modules/registration/domain/usecases/create_user_usecase.dart';
import 'package:login_app/modules/registration/presentation/controllers/registration_controller.dart';
import 'package:login_app/modules/registration/presentation/pages/registration_page.dart';

class RegistrationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<ResgistrationDatasource>(
          (i) => RegistrationDatasourceImp(),
        ),
        Bind.lazySingleton<RegistrationRepository>(
          (i) => RegistrationRepositoryImp(
            datasource: i.get<ResgistrationDatasource>(),
          ),
        ),
        Bind.lazySingleton<CreateUserUsecase>((i) => CreateUserUsecaseImp(repository: i.get<RegistrationRepository>())),
        Bind.factory<RegistrationController>((i) => RegistrationController(createUserUsecase: i.get<CreateUserUsecase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.registration,
          child: (context, args) => const RegistrationPage(),
        ),
      ];
}
