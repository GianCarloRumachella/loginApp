import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_typography.dart';

class AppScaffoldWidget extends StatefulWidget {
  final bool hasAppBar;
  final String title;
  final Widget body;
  final Widget? bottom;
  final EdgeInsets padding;
  final void Function()? onIconPressed;
  final void Function()? onTap;
  final bool showLeading;

  const AppScaffoldWidget({
    super.key,
    this.hasAppBar = true,
    this.title = '',
    required this.body,
    this.padding = const EdgeInsets.all(20),
    this.onIconPressed,
    this.showLeading = true,
    this.bottom,
    this.onTap,
  });

  @override
  State<AppScaffoldWidget> createState() => _AppScaffoldWidgetState();
}

class _AppScaffoldWidgetState extends State<AppScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: widget.hasAppBar
            ? AppBar(
                elevation: 0,
                title: Text(widget.title, style: AppTypography.titleAppBar),
                centerTitle: true,
                backgroundColor: Colors.grey[300],
                leading: widget.showLeading
                    ? IconButton(
                        onPressed: widget.onIconPressed ??
                            () async {
                              Modular.to.pop();
                            },
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                      )
                    : null,
              )
            : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: widget.padding,
            child: Column(
              children: [
                widget.body,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: widget.bottom,
        ),
      ),
    );
  }
}
