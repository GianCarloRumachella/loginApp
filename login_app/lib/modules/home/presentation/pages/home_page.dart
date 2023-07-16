import 'package:flutter/material.dart';

import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffoldWidget(
      body: Text('home'),
    );
  }
}
