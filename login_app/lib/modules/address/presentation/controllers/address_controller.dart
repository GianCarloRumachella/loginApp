import 'package:flutter/material.dart';
import 'package:login_app/modules/address/domain/usecases/get_address_usecase.dart';
import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class AddressController {
  final GetAddressUsecase _usecase;

  AddressController({required GetAddressUsecase usecase}) : _usecase = usecase;

  TextEditingController zipCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<bool> enableButton = ValueNotifier(false);

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  getZipCode(BuildContext context) async {
    OverlayLoadingProgress.start(context);
    final response = await _usecase.call(zipCodeController.text);
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
}
