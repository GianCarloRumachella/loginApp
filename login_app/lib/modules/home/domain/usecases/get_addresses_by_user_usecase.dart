import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/home/domain/repositories/home_repository.dart';

abstract class GetAddressesByUserUsecase {
  Future<Either<Failure, List<AddressModel>>> call(String id);
}

class GetAddressesByUserUsecaseImp implements GetAddressesByUserUsecase {
  final HomeRepository _repository;

  GetAddressesByUserUsecaseImp({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<AddressModel>>> call(String id) async {
    return await _repository.getAddressesByUser(id);
  }
}
