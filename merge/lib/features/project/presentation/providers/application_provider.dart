// presentation/providers/application_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merge/features/project/domain/application/entitiy/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_app.dart';
import 'package:merge/features/project/data/repository/appication_repositoty_imp.dart';

final applicationRepositoryProvider = Provider<IApplicationRepository>((ref) {
  return ApplicationRepositoryImpl(
    remoteDataSource: ApplicationRemoteDataSourceImpl(),
  );
});

// Define an ApplicationState class to represent different states of application operations
class ApplicationState {
  final List<Application> applications;
  final String? errorMessage;

  ApplicationState({
    required this.applications,
    this.errorMessage,
  });

  factory ApplicationState.initial() {
    return ApplicationState(applications: []);
  }

  factory ApplicationState.success(List<Application> applications) {
    return ApplicationState(applications: applications);
  }

  factory ApplicationState.error(String message) {
    return ApplicationState(applications: [], errorMessage: message);
  }
}

// Create a StateNotifier to handle application logic
class ApplicationNotifier extends StateNotifier<ApplicationState> {
  final IApplicationRepository applicationRepository;

  ApplicationNotifier(this.applicationRepository)
      : super(ApplicationState.initial());

  Future<void> getApplicationsByProjectId(String projectId) async {
    final result =
        await applicationRepository.getApplicationsByProjectId(projectId);
    result.fold(
      (failure) => state = ApplicationState.error(failure.message),
      (applications) => state = ApplicationState.success(applications),
    );
  }

  Future<void> submitApplication(Application application) async {
    final result = await applicationRepository.submitApplication(application);
    result.fold(
      (failure) => state = ApplicationState.error(failure.message),
      (_) => getApplicationsByProjectId(
          application.projectId), // refresh applications after submission
    );
  }

  Future<void> createApplication(Application application) async {
    final result = await applicationRepository.createApplication(application);
    result.fold(
      (failure) => state = ApplicationState.error(failure.message),
      (_) => getApplicationsByProjectId(
          application.projectId), // refresh applications after creation
    );
  }

  Future<void> updateApplication(Application application) async {
    final result = await applicationRepository.updateApplication(application);
    result.fold(
      (failure) => state = ApplicationState.error(failure.message),
      (_) => getApplicationsByProjectId(
          application.projectId), // refresh applications after update
    );
  }

  Future<void> deleteApplication(String applicationId, String projectId) async {
    final result = await applicationRepository.deleteApplication(applicationId);
    result.fold(
      (failure) => state = ApplicationState.error(failure.message),
      (_) => getApplicationsByProjectId(
          projectId), // refresh applications after deletion
    );
  }
}

// Create a provider for the ApplicationNotifier
final applicationNotifierProvider =
    StateNotifierProvider<ApplicationNotifier, ApplicationState>((ref) {
  final applicationRepository = ref.watch(applicationRepositoryProvider);
  return ApplicationNotifier(applicationRepository);
});
