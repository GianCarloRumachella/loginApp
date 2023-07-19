import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/address/domain/repositories/address_repository.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class UpdateAddressUsecase {
  Future<Either<Failure, int>> call(AddressModel address);
}

class UpdateAddressUsecaseImp implements UpdateAddressUsecase {
  final AddressRepository _repository;

  UpdateAddressUsecaseImp({required AddressRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, int>> call(AddressModel address) async {
    return await _repository.updateAddress(address);
  }
}
