import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/db/db_helper.dart';
import 'package:login_app/modules/home/data/datasource/home_datasource.dart';

class HomeDatasourceImp implements HomeDatasource {
  final _db = DBHelper();

  @override
  Future<List<AddressModel>> getAddressesByUser(String id) async {
    var response = await _db.getAddressesByUser(id);

    return response;
  }
}
