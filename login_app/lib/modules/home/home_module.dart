import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.home,
          child: (context, args) => HomePage(user: args.data),
        )
      ];
}
