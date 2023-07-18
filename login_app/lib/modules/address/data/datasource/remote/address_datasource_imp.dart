import 'package:login_app/modules/address/data/datasource/address_datasoure.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/dio/dio_client.dart';
import 'package:login_app/modules/core/failures/failure.dart';

class AddressDatasourceImp implements AddressDatasource {
  final DioClient _dioClient = DioClient();

  @override
  Future<AddressModel> getAddress(String zipCode) async {
    var response = await _dioClient.fetchData('https://viacep.com.br/ws/$zipCode/json/');

    if (response.data['erro'] == null) {
      return AddressModel.fromMap(response.data);
      /*  return AddressModel(
        zipCode: response.data['cep'] ?? '',
        street: response.data['logradouro'] ?? '',
        number: response.data['numero'] ?? '',
        complement: response.data['complemento'] ?? '',
        neighborhood: response.data['bairro'] ?? '',
        city: response.data['localidade'] ?? '',
        state: response.data['uf'] ?? '',
      ); */
    } else {
      throw Failure('CEP inválido');
    }
  }
}
