import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/home/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = Modular.get<HomeController>()..init(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => AppScaffoldWidget(
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
                        'Olá, ${_controller.user.value.name.split(' ')[0]}!',
                        style: AppTypography.titleSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text('Meus Endereços', style: AppTypography.textBig),
                const SizedBox(height: 24),
                SizedBox(
                  child: _controller.addresses.value.isNotEmpty
                      ? ValueListenableBuilder(
                          valueListenable: _controller.addresses,
                          builder: (context, value, child) => ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return value[index];
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 8);
                            },
                          ),
                        )
                      : const Text('Você não possui endereços cadastrados'),
                ),
              ],
            ),
          ),
        ),
        bottom: AppButtonWidget(
          onPressed: () {
            _controller.addAddress();
          },
          label: 'adicionar endereço',
          type: ButtonType.text,
        ),
      ),
    );
  }
}
