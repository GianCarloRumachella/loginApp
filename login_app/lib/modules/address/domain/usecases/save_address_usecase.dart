import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/address/domain/repositories/address_repository.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class SaveAddressUsecase {
  Future<Either<Failure, int>> call(AddressModel address);
}

class SaveAddressUsecaseImp implements SaveAddressUsecase {
  final AddressRepository _repository;

  SaveAddressUsecaseImp({required AddressRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, int>> call(AddressModel address) async {
    return await _repository.saveAddress(address);
  }
}
