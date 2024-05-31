// presentation/user/providers/user_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merge/features/project/domain/user/enitity/user.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';
import 'package:merge/features/project/data/repository/user_repository_imp.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_user.dart';

// Create a provider for the UserRepository
final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepositoryImpl(
    remoteDataSource: UserRemoteDataSourceImpl(),
  );
});

// Define an AuthState class to represent different states of authentication
class UserAuthState {
  final bool isAuthenticated;
  final String? errorMessage;

  UserAuthState({
    required this.isAuthenticated,
    this.errorMessage,
  });

  factory UserAuthState.initial() {
    return UserAuthState(isAuthenticated: false);
  }

  factory UserAuthState.authenticated() {
    return UserAuthState(isAuthenticated: true);
  }

  factory UserAuthState.error(String message) {
    return UserAuthState(isAuthenticated: false, errorMessage: message);
  }
}

// Create a StateNotifier to handle authentication logic
class UserAuthNotifier extends StateNotifier<UserAuthState> {
  final IUserRepository userRepository;

  UserAuthNotifier(this.userRepository) : super(UserAuthState.initial());

  Future<void> login(String email, String password) async {
    final result = await userRepository.loginUser(email, password);
    result.fold(
      (failure) => state = UserAuthState.error(failure.message),
      (_) => state = UserAuthState.authenticated(),
    );
  }

  Future<void> signUp(User user) async {
    final result = await userRepository.signUpUser(user);
    result.fold(
      (failure) => state = UserAuthState.error(failure.message),
      (_) => state = UserAuthState.authenticated(),
    );
  }
}

// Create a provider for the UserAuthNotifier
final userAuthNotifierProvider =
    StateNotifierProvider<UserAuthNotifier, UserAuthState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserAuthNotifier(userRepository);
});
