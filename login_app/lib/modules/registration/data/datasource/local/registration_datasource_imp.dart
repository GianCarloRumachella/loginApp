import 'package:login_app/modules/core/db/db_helper.dart';
import 'package:login_app/modules/registration/data/datasource/registration_datasource.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';

class RegistrationDatasourceImp implements ResgistrationDatasource {
  final _db = DBHelper();

  @override
  Future<int> createUser(RegistrationModel registrationModel) async {
    var response = await _db.createUser(registrationModel);

    return response;
  }
}
