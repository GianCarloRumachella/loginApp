import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/core/domain/entities/user_entity.dart';
import 'package:login_app/modules/core/ui/widgets/app_address_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';

import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';

class HomePage extends StatefulWidget {
  final UserEntity user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AppAddressWidget> tempList = [];

  @override
  void initState() {
    //TODO: liste temporaria
    //tempList = List.generate(Random().nextInt(5), (index) => const AppAddressWidget());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      hasAppBar: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(AppRoutes.configuration);
                      },
                      child: const CircleAvatar(
                        maxRadius: 20,
                        child: Icon(
                          Icons.account_circle,
                          size: 40,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Olá, ${widget.user.name}!',
                      style: AppTypography.titleSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text('Meus Endereços', style: AppTypography.textBig),
              const SizedBox(height: 24),
              SizedBox(
                child: tempList.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tempList.length,
                        itemBuilder: (context, index) {
                          return tempList[index];
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                      )
                    : const Text('Você não possui endereços cadastrados'),
              ),
            ],
          ),
        ),
      ),
      bottom: AppButtonWidget(
        onPressed: () {},
        label: 'adicionar endereço',
        type: ButtonType.text,
      ),
    );
  }
}
