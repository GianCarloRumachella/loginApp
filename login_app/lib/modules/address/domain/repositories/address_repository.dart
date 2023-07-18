import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class AddressRepository {
  Future<Either<Failure, AddressModel>> getAddress(String zipCode);
  Future<Either<Failure, int>> saveAddress(AddressModel address);
}
