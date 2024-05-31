import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entitiy/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

import 'package:merge/features/project/data/models/application_model.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_app.dart';

class ApplicationRepositoryImpl implements IApplicationRepository {
  final ApplicationRemoteDataSource remoteDataSource;

  ApplicationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> submitApplication(
      Application application) async {
    try {
      final applicationModel = ApplicationModel.fromDomain(application);
      await remoteDataSource.submitApplication(applicationModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Submission failed'));
    }
  }

  @override
  Future<Either<Failure, void>> createApplication(
      Application application) async {
    try {
      final applicationModel = ApplicationModel.fromDomain(application);
      await remoteDataSource.createApplication(applicationModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Creation failed'));
    }
  }

  @override
  Future<Either<Failure, void>> updateApplication(
      Application application) async {
    try {
      final applicationModel = ApplicationModel.fromDomain(application);
      await remoteDataSource.updateApplication(applicationModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Update failed'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteApplication(String applicationId) async {
    try {
      await remoteDataSource.deleteApplication(applicationId);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Deletion failed'));
    }
  }

  @override
  Future<Either<Failure, Application?>> getApplicationById(
      String applicationId) async {
    try {
      final applicationModel =
          await remoteDataSource.getApplicationById(applicationId);
      if (applicationModel != null) {
        return Right(applicationModel.toDomain());
      } else {
        return Right(null);
      }
    } catch (e) {
      return Left(ServerFailure('Get by ID failed'));
    }
  }

  @override
  Future<Either<Failure, List<Application>>> getApplicationsByProjectId(
      String projectId) async {
    try {
      final applicationModels =
          await remoteDataSource.getApplicationsByProjectId(projectId);
      final applications =
          applicationModels.map((model) => model.toDomain()).toList();
      return Right(applications);
    } catch (e) {
      return Left(ServerFailure('Get by project ID failed'));
    }
  }
}
