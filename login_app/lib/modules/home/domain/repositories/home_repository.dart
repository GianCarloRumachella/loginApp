import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AddressModel>>> getAddressesByUser(String id);
}
