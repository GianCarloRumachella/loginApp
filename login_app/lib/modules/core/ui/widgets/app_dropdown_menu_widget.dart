import 'package:flutter/material.dart';
import 'package:login_app/modules/core/ui/widgets/app_textfield_dropdown_widget.dart';

import 'package:login_app/modules/core/validators/validator.dart';

class AppDropdownMenuWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final List<String> options;
  const AppDropdownMenuWidget({
    super.key,
    required this.controller,
    required this.options,
    required this.hint,
  });

  @override
  State<AppDropdownMenuWidget> createState() => _AppDropdownMenuWidgetState();
}

class _AppDropdownMenuWidgetState extends State<AppDropdownMenuWidget> {
  String selectedOption = '';
  bool optionsBoxOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              optionsBoxOpen = !optionsBoxOpen;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: AppTextFieldDropdownWidget(
                    label: 'Selecione o estado',
                    controller: widget.controller,
                    validator: (value) {
                      return Validator.isEmpty(value ?? '');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        optionsBoxOpen
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.options.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedOption = widget.options[index];
                                    widget.controller.text = selectedOption;
                                    optionsBoxOpen = !optionsBoxOpen;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    widget.options[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
