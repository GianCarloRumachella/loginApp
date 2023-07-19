// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/address/domain/usecases/get_address_usecase.dart';
import 'package:login_app/modules/address/domain/usecases/save_address_usecase.dart';
import 'package:login_app/modules/address/domain/usecases/update_address_usecase.dart';
import 'package:login_app/modules/core/secure_storage/secure_storage.dart';
import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/home/presentation/controllers/home_controller.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class AddressController extends ChangeNotifier {
  final GetAddressUsecase _getAddressUsecase;
  final SaveAddressUsecase _saveAddressUsecase;
  final UpdateAddressUsecase _updateAddressUsecase;

  AddressController({
    required GetAddressUsecase getAddressUsecase,
    required SaveAddressUsecase saveAddressUsecase,
    required UpdateAddressUsecase updateAddressUsecase,
  })  : _getAddressUsecase = getAddressUsecase,
        _saveAddressUsecase = saveAddressUsecase,
        _updateAddressUsecase = updateAddressUsecase;

  TextEditingController zipCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<bool> enableButton = ValueNotifier(false);
  ValueNotifier<bool> noNumber = ValueNotifier(false);
  String idAddress = '';

  setupAddressToEdit(AddressModel model) {
    idAddress = model.id.toString();
    zipCodeController.text = model.zipCode;
    streetController.text = model.street;
    numberController.text = model.number ?? '';
    complementController.text = model.complement;
    neighborhoodController.text = model.neighborhood;
    cityController.text = model.city;
    stateController.text = model.state;
    noNumber.value = model.number == null ? true : false;
  }

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  changeCheckBox(bool value) {
    numberController.clear();
    noNumber.value = value;
    if (!value) {
      enableButton.value = false;
    } else {
      validateForm();
      enableButton.value = true;
    }
    notifyListeners();
  }

  getZipCode(BuildContext context) async {
    OverlayLoadingProgress.start(context);
    final response = await _getAddressUsecase.call(zipCodeController.text);
    OverlayLoadingProgress.stop();

    response.fold((l) {
      AppAlerts().snackBar(context: context, message: l.message);
    }, (r) {
      zipCodeController.text = r.zipCode;
      streetController.text = r.street;
      numberController.text = r.number ?? '';
      complementController.text = r.complement;
      neighborhoodController.text = r.neighborhood;
      cityController.text = r.city;
      stateController.text = r.state;
    });
  }

  updateAddress(BuildContext context) async {
    final user = await SecureStorage().getSession();
    AddressModel address = AddressModel(
      id: idAddress,
      zipCode: zipCodeController.text,
      street: streetController.text,
      number: numberController.text,
      complement: complementController.text,
      neighborhood: neighborhoodController.text,
      city: cityController.text,
      state: stateController.text,
      userId: user.id.toString(),
    );

    OverlayLoadingProgress.start(context);
    final response = await _updateAddressUsecase.call(address);
    OverlayLoadingProgress.stop();

    response.fold(
      (l) {
        AppAlerts().snackBar(context: context, message: l.message);
      },
      (r) {
        alert(context, 'Atualizado', 'Seu endereço foi atualizado com sucesso');
      },
    );
  }

  saveAddress(BuildContext context) async {
    final user = await SecureStorage().getSession();
    AddressModel address = AddressModel(
      zipCode: zipCodeController.text,
      street: streetController.text,
      number: numberController.text,
      complement: complementController.text,
      neighborhood: neighborhoodController.text,
      city: cityController.text,
      state: stateController.text,
      userId: user.id.toString(),
    );

    OverlayLoadingProgress.start(context);
    final response = await _saveAddressUsecase.call(address);
    OverlayLoadingProgress.stop();

    response.fold(
      (l) {
        AppAlerts().snackBar(context: context, message: l.message);
      },
      (r) {
        alert(context, 'Salvo', 'Seu endereço foi salvo com sucesso');
      },
    );
  }

  void alert(BuildContext context, String title, String message) {
    AppAlerts().alert(
      context: context,
      title: 'Salvo',
      message: 'Seu endereço foi salvo com sucesso',
      buttons: AppButtonWidget(
        onPressed: () {
          Modular.to.popUntil(ModalRoute.withName(AppRoutes.home));
          Modular.get<HomeController>().init(context);
        },
        label: 'Ok',
      ),
    );

    notifyListeners();
  }
}
