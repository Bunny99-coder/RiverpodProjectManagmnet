// domain/user/repositories/user_repository.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/user/enitity/user.dart';

abstract class IUserRepository {
  Future<Either<Failure, User>> loginUser(String email, String password);
  Future<Either<Failure, void>> signUpUser(User user);
}
