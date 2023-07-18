import 'package:login_app/modules/address/data/datasource/address_datasoure.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/db/db_helper.dart';
import 'package:login_app/modules/core/dio/dio_client.dart';
import 'package:login_app/modules/core/failures/failure.dart';

class AddressDatasourceImp implements AddressDatasource {
  final DioClient _dioClient = DioClient();
  final _db = DBHelper();

  @override
  Future<AddressModel> getAddress(String zipCode) async {
    var response = await _dioClient.fetchData('https://viacep.com.br/ws/$zipCode/json/');

    if (response.data['erro'] == null) {
      return AddressModel.fromMap(response.data);
    } else {
      throw Failure('CEP inválido');
    }
  }

  @override
  Future<int> saveAddress(AddressModel address) async {
    var response = await _db.saveAddress(address);

    return response;
  }
}
