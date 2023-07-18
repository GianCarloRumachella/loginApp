import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/domain/entities/user_entity.dart';
import 'package:login_app/modules/core/secure_storage/secure_storage.dart';
import 'package:login_app/modules/core/ui/widgets/app_address_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';
import 'package:login_app/modules/home/domain/usecases/get_addresses_by_user_usecase.dart';

class HomeController extends ChangeNotifier {
  final GetAddressesByUserUsecase _usecase;

  HomeController({required GetAddressesByUserUsecase usecase}) : _usecase = usecase;

  ValueNotifier<UserEntity> user = ValueNotifier(UserModel.empty());

  ValueNotifier<List<AppAddressWidget>> addresses = ValueNotifier([]);

  void init(BuildContext context) async {
    user.value = await SecureStorage().getSession();
    final response = await _usecase.call(user.value.id.toString());

    response.fold((l) {
      AppAlerts().snackBar(context: context, message: l.message);
    }, (r) {
      for (var address in r) {
        addresses.value.add(AppAddressWidget(model: address));
      }
    });
    notifyListeners();
  }

  addAddress() {
    Modular.to.pushNamed(AppRoutes.address);
  }
}
