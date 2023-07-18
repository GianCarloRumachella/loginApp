import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/address/domain/repositories/address_repository.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class GetAddressUsecase {
  Future<Either<Failure, AddressModel>> call(String zipCode);
}

class GetAddressUsecaseImp implements GetAddressUsecase {
  final AddressRepository _repository;

  GetAddressUsecaseImp({required AddressRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, AddressModel>> call(String zipCode) async {
    return await _repository.getAddress(zipCode);
  }
}
