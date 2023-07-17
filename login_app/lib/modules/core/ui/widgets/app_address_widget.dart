import 'package:flutter/material.dart';

class AppAddressWidget extends StatefulWidget {
  const AppAddressWidget({super.key});

  @override
  State<AppAddressWidget> createState() => _AppAddressWidgetState();
}

class _AppAddressWidgetState extends State<AppAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('dataaaaaaaaaaaaaaaaaaaaaaaaaaa', textAlign: TextAlign.start),
                      Text('data', textAlign: TextAlign.start),
                      Text('data', textAlign: TextAlign.start),
                      Text('data', textAlign: TextAlign.start),
                      Text('data', textAlign: TextAlign.start),
                      Text('data', textAlign: TextAlign.start),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print('abrir tela de edição');
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
