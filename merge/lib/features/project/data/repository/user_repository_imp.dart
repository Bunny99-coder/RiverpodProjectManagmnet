// data/user/repositories/user_repository.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/user/enitity/user.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';
import 'package:merge/features/project/data/models/user_model.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_user.dart';

class UserRepositoryImpl implements IUserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final userModel = await remoteDataSource.loginUser(email, password);
      return Right(userModel.toDomain());
    } catch (e) {
      return Left(ServerFailure('Login failed'));
    }
  }

  @override
  Future<Either<Failure, void>> signUpUser(User user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
      );
      await remoteDataSource.signUpUser(userModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Sign up failed'));
    }
  }
}
