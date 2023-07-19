import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/address/presentation/controllers/address_controller.dart';
import 'package:login_app/modules/core/masks/masks.dart';
import 'package:login_app/modules/core/misc/brazilian_states.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_dropdown_menu_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_textfield_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';

class AddressPage extends StatefulWidget {
  final AddressModel? addressToEdit;
  const AddressPage({super.key, this.addressToEdit});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late final AddressController _controller;

  @override
  void initState() {
    _controller = Modular.get<AddressController>();
    if (widget.addressToEdit != null) {
      _controller.setupAddressToEdit(widget.addressToEdit!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _controller.validateForm();
      },
      title: 'Meu Endereço',
      body: Form(
        key: _controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextFieldWidget(
                label: 'CEP',
                inputFormatter: [Masks.maskZipCode],
                keyboardType: TextInputType.number,
                controller: _controller.zipCodeController,
                validator: (value) {
                  return Validator.isEmpty(value ?? '');
                },
                onFieldSubmitted: (value) {
                  _controller.getZipCode(context);
                  Future.delayed(
                    const Duration(seconds: 1),
                    () => _controller.validateForm(),
                  );
                },
              ),
              const SizedBox(height: 12),
              ValueListenableBuilder(
                valueListenable: _controller.noNumber,
                builder: (context, value, child) {
                  return AppTextFieldWidget(
                    label: 'Rua',
                    keyboardType: TextInputType.name,
                    controller: _controller.streetController,
                    validator: (value) {
                      return Validator.isEmpty(value ?? '');
                    },
                    onChanged: (value) {
                      _controller.validateForm();
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: ValueListenableBuilder(
                      valueListenable: _controller.noNumber,
                      builder: (context, value, child) => AppTextFieldWidget(
                        enable: !value,
                        label: 'N°',
                        keyboardType: TextInputType.number,
                        controller: _controller.numberController,
                        validator: !value
                            ? (value) {
                                return Validator.isEmpty(value ?? '');
                              }
                            : (value) {
                                return null;
                              },
                        onChanged: (value) {
                          _controller.validateForm();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ValueListenableBuilder(
                      valueListenable: _controller.noNumber,
                      builder: (context, value, child) => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'Sem número',
                          style: AppTypography.textMedium,
                        ),
                        value: value,
                        onChanged: (value) {
                          _controller.changeCheckBox(value!);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              AppTextFieldWidget(
                label: 'Complemento',
                keyboardType: TextInputType.name,
                controller: _controller.complementController,
                validator: (value) {
                  return null;
                },
                onChanged: (value) {
                  _controller.validateForm();
                },
              ),
              const SizedBox(height: 12),
              AppTextFieldWidget(
                label: 'Bairro',
                keyboardType: TextInputType.name,
                controller: _controller.neighborhoodController,
                validator: (value) {
                  return Validator.isEmpty(value ?? '');
                },
                onChanged: (value) {
                  _controller.validateForm();
                },
              ),
              const SizedBox(height: 12),
              AppTextFieldWidget(
                label: 'Localidade',
                keyboardType: TextInputType.name,
                controller: _controller.cityController,
                validator: (value) {
                  return Validator.isEmpty(value ?? '');
                },
                onChanged: (value) {
                  _controller.validateForm();
                },
              ),
              const SizedBox(height: 12),
              AppDropdownMenuWidget(
                controller: _controller.stateController,
                options: brazilianStates,
                hint: 'Selecione o estado',
              ),
            ],
          ),
        ),
      ),
      bottom: ValueListenableBuilder(
        valueListenable: _controller.enableButton,
        builder: (context, value, child) => AppButtonWidget(
          onPressed: value
              ? () {
                  if (widget.addressToEdit == null) {
                    _controller.saveAddress(context);
                  } else {
                    _controller.updateAddress(context);
                  }
                }
              : null,
          label: 'Salvar',
        ),
      ),
    );
  }
}
