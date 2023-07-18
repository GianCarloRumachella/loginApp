import 'package:login_app/modules/address/data/models/address_model.dart';

abstract class AddressDatasource {
  Future<AddressModel> getAddress(String zipCode);
  Future<int> saveAddress(AddressModel address);
  Future<int> updateAddress(AddressModel address);
}
