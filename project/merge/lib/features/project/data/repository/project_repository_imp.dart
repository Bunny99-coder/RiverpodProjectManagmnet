// data/project/repositories/project_repository.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/project/enitity/project.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_pro.dart';

class ProjectRepositoryImpl implements IProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createProject(Project project) async {
    try {
      // Implementation code to create project
      return Right(null); // Replace with actual logic
    } catch (e) {
      return Left(ServerFailure('Creation failed'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) async {
    try {
      // Implementation code to update project
      return Right(null); // Replace with actual logic
    } catch (e) {
      return Left(ServerFailure('Update failed'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) async {
    try {
      // Implementation code to delete project
      return Right(null); // Replace with actual logic
    } catch (e) {
      return Left(ServerFailure('Deletion failed'));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      // Implementation code to fetch projects
      return Right([]); // Replace with actual logic
    } catch (e) {
      return Left(ServerFailure('Get projects failed'));
    }
  }

  @override
  Future<Either<Failure, Project?>> getProjectById(String projectId) async {
    try {
      // Implementation code to fetch project by ID
      return Right(null); // Replace with actual logic
    } catch (e) {
      return Left(ServerFailure('Get project by ID failed'));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getAllProjects() async {
    try {
      // Implementation code to fetch all projects
      return Right([]); // Replace with actual logic
    } catch (e) {
      return Left(ServerFailure('Get all projects failed'));
    }
  }
}
