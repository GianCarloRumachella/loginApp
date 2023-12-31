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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(AppRoutes.configuration);
                        },
                        child: const CircleAvatar(
                          maxRadius: 20,
                          child: Icon(
                            Icons.account_circle,
                            size: 50,
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
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Meus Endereços', style: AppTypography.textBig),
                    IconButton(
                      onPressed: () {
                        _controller.init(context);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 18,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ],
                ),
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
            _controller.addAddress(context);
          },
          label: 'Adicionar endereço',
          type: ButtonType.green,
        ),
      ),
    );
  }
}
