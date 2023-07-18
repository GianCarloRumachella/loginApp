import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/modules/address/presentation/controllers/address_controller.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_textfield_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late final AddressController _controller;

  @override
  void initState() {
    _controller = Modular.get<AddressController>();
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
        child: Column(
          children: [
            AppTextFieldWidget(
              label: 'CEP',
              keyboardType: TextInputType.number,
              controller: _controller.zipCodeController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
              },
              onFieldSubmitted: (value) {
                _controller.getZipCode(context);
              },
            ),
            const SizedBox(height: 12),
            AppTextFieldWidget(
              label: 'Rua',
              keyboardType: TextInputType.name,
              controller: _controller.streetController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextFieldWidget(
                    label: 'N°',
                    keyboardType: TextInputType.name,
                    controller: _controller.numberController,
                    validator: (value) {
                      return Validator.isEmpty(value ?? '');
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Checkbox(
                    value: true,
                    onChanged: (value) {},
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
            ),
            const SizedBox(height: 12),
            AppTextFieldWidget(
              label: 'Bairro',
              keyboardType: TextInputType.name,
              controller: _controller.neighborhoodController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
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
            ),
            const SizedBox(height: 12),
            AppTextFieldWidget(
              label: 'Estado',
              keyboardType: TextInputType.name,
              controller: _controller.stateController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
              },
            ),
          ],
        ),
      ),
      bottom: ValueListenableBuilder(
        valueListenable: _controller.enableButton,
        builder: (context, value, child) => AppButtonWidget(
          onPressed: value ? () {} : null,
          label: 'Salvar',
        ),
      ),
    );
  }
}
