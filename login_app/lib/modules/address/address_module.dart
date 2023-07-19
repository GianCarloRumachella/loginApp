import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/address/data/datasource/address_datasoure.dart';
import 'package:login_app/modules/address/data/datasource/remote/address_datasource_imp.dart';
import 'package:login_app/modules/address/domain/repositories/address_repository.dart';
import 'package:login_app/modules/address/domain/usecases/get_address_usecase.dart';
import 'package:login_app/modules/address/domain/usecases/save_address_usecase.dart';
import 'package:login_app/modules/address/domain/usecases/update_address_usecase.dart';
import 'package:login_app/modules/address/presentation/controllers/address_controller.dart';
import 'package:login_app/modules/address/presentation/pages/address_page.dart';
import 'package:login_app/modules/address/data/repositories/address_repository_imp.dart';

class AddressModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AddressDatasource>(
          (i) => AddressDatasourceImp(),
        ),
        Bind.lazySingleton<AddressRepository>(
          (i) => AddressRepositoryImp(
            datasource: i.get<AddressDatasource>(),
          ),
        ),
        Bind.lazySingleton<GetAddressUsecase>(
          (i) => GetAddressUsecaseImp(
            repository: i.get<AddressRepository>(),
          ),
        ),
        Bind.lazySingleton<SaveAddressUsecase>(
          (i) => SaveAddressUsecaseImp(
            repository: i.get<AddressRepository>(),
          ),
        ),
        Bind.lazySingleton<UpdateAddressUsecase>(
          (i) => UpdateAddressUsecaseImp(
            repository: i.get<AddressRepository>(),
          ),
        ),
        Bind.lazySingleton<AddressController>(
          (i) => AddressController(
            getAddressUsecase: i.get<GetAddressUsecase>(),
            saveAddressUsecase: i.get<SaveAddressUsecase>(),
            updateAddressUsecase: i.get<UpdateAddressUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.address,
          child: (context, args) => AddressPage(addressToEdit: args.data),
        )
      ];
}
