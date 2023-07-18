import 'package:flutter/material.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';

class AppAddressWidget extends StatefulWidget {
  final AddressModel model;
  const AppAddressWidget({super.key, required this.model});

  @override
  State<AppAddressWidget> createState() => _AppAddressWidgetState();
}

class _AppAddressWidgetState extends State<AppAddressWidget> {
  String completeAddress = '';

  @override
  void initState() {
    AddressModel tempModel = widget.model;
    completeAddress = "${tempModel.street}, ${tempModel.number ?? '-'}, ${tempModel.complement.isEmpty ? '' : tempModel.complement} ${tempModel.neighborhood}, ${tempModel.city} - ${tempModel.state}";
    super.initState();
  }

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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(completeAddress, textAlign: TextAlign.start),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print("editar ${widget.model.id}");
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
