import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/home/data/datasource/home_datasource.dart';
import 'package:login_app/modules/home/data/datasource/local/home_datasource_imp.dart';
import 'package:login_app/modules/home/data/repository/home_repository_imp.dart';
import 'package:login_app/modules/home/domain/repositories/home_repository.dart';
import 'package:login_app/modules/home/domain/usecases/get_addresses_by_user_usecase.dart';
import 'package:login_app/modules/home/presentation/controllers/home_controller.dart';
import 'package:login_app/modules/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<HomeDatasource>(
          (i) => HomeDatasourceImp(),
        ),
        Bind.lazySingleton<HomeRepository>(
          (i) => HomeRepositoryImp(
            datasource: i.get<HomeDatasource>(),
          ),
        ),
        Bind.lazySingleton<GetAddressesByUserUsecase>(
          (i) => GetAddressesByUserUsecaseImp(
            repository: i.get<HomeRepository>(),
          ),
        ),
        Bind.lazySingleton<HomeController>(
          (i) => HomeController(
            usecase: i.get<GetAddressesByUserUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.home,
          child: (context, args) => const HomePage(),
        )
      ];
}
