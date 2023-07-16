import 'package:login_app/modules/registration/data/models/registration_model.dart';

abstract class ResgistrationDatasource {
  Future<int> createUser(RegistrationModel registrationModel);
}
