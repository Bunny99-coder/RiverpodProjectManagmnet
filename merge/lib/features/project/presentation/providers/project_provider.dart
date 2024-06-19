import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merge/features/project/domain/project/enitity/project.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';
import 'package:merge/features/project/data/repository/project_repository_imp.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_pro.dart';

// Create a provider for the ProjectRepository
final projectRepositoryProvider = Provider<IProjectRepository>((ref) {
  return ProjectRepositoryImpl(
    remoteDataSource: ProjectRemoteDataSourceImpl(),
  );
});

// Define a ProjectState class to represent different states of project operations
class ProjectState {
  final List<Project> projects;
  final String? errorMessage;

  ProjectState({
    required this.projects,
    this.errorMessage,
  });

  factory ProjectState.initial() {
    return ProjectState(projects: []);
  }

  factory ProjectState.success(List<Project> projects) {
    return ProjectState(projects: projects);
  }

  factory ProjectState.error(String message) {
    return ProjectState(projects: [], errorMessage: message);
  }
}

// Create a StateNotifier to handle project logic
class ProjectNotifier extends StateNotifier<ProjectState> {
  final IProjectRepository projectRepository;

  ProjectNotifier(this.projectRepository) : super(ProjectState.initial());

  Future<void> getProjects() async {
    final result = await projectRepository.getProjects();
    result.fold(
      (failure) => state = ProjectState.error(failure.message),
      (projects) => state = ProjectState.success(projects),
    );
  }

  Future<void> createProject(Project project) async {
    final result = await projectRepository.createProject(project);
    result.fold(
      (failure) => state = ProjectState.error(failure.message),
      (_) => getProjects(), // refresh projects after creation
    );
  }

  Future<void> updateProject(Project project) async {
    final result = await projectRepository.updateProject(project);
    result.fold(
      (failure) => state = ProjectState.error(failure.message),
      (_) => getProjects(), // refresh projects after update
    );
  }

  Future<void> deleteProject(String projectId) async {
    final result = await projectRepository.deleteProject(projectId);
    result.fold(
      (failure) => state = ProjectState.error(failure.message),
      (_) => getProjects(), // refresh projects after deletion
    );
  }
}

// Create a provider for the ProjectNotifier
final projectNotifierProvider =
    StateNotifierProvider<ProjectNotifier, ProjectState>((ref) {
  final projectRepository = ref.watch(projectRepositoryProvider);
  return ProjectNotifier(projectRepository);
});
