import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_module.dart';
import 'package:login_app/app_widget.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  ));
}
