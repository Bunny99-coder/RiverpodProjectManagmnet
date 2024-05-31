import 'package:merge/features/project/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginUser(String email, String password);
  Future<void> signUpUser(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserModel> loginUser(String email, String password) async {
    // Implement remote login logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(UserModel user) async {
    // Implement remote sign-up logic, e.g., API call
    throw UnimplementedError();
  }
}
