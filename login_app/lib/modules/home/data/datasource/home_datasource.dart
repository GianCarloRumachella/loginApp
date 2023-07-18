import 'package:login_app/modules/address/data/models/address_model.dart';

abstract class HomeDatasource {
  Future<List<AddressModel>> getAddressesByUser(String id);
}
