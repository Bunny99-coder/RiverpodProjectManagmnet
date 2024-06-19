import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merge/features/project/domain/admin/repository/admin_repository.dart';
import 'package:merge/features/project/domain/admin/entity/admin.dart';
import 'package:merge/features/project/data/repository/admin_repository_imp.dart';

import 'package:merge/features/project/data/data_sources/remote_data_source_admin.dart';

// Create a provider for the AdminRepository
final adminRepositoryProvider = Provider<IAdminRepository>((ref) {
  return AdminRepositoryImpl(
    remoteDataSource: AdminRemoteDataSourceImpl(),
  );
});

// Define an AuthState class to represent different states of authentication
class AuthState {
  final bool isAuthenticated;
  final String? errorMessage;

  AuthState({
    required this.isAuthenticated,
    this.errorMessage,
  });

  factory AuthState.initial() {
    return AuthState(isAuthenticated: false);
  }

  factory AuthState.authenticated() {
    return AuthState(isAuthenticated: true);
  }

  factory AuthState.error(String message) {
    return AuthState(isAuthenticated: false, errorMessage: message);
  }
}

// Create a StateNotifier to handle authentication logic
class AuthNotifier extends StateNotifier<AuthState> {
  final IAdminRepository adminRepository;

  AuthNotifier(this.adminRepository) : super(AuthState.initial());

  Future<void> login(String email, String password) async {
    final result = await adminRepository.loginAdmin(email, password);
    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (_) => state = AuthState.authenticated(),
    );
  }

  Future<void> signUp(Admin admin) async {
    final result = await adminRepository.signUpAdmin(admin);
    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (_) => state = AuthState.authenticated(),
    );
  }
}

// Create a provider for the AuthNotifier
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final adminRepository = ref.watch(adminRepositoryProvider);
  return AuthNotifier(adminRepository);
});
