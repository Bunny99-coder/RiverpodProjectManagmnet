// domain/application/usecases/get_applications_by_project_id.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entitiy/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

abstract class IApplicationRepository {
  Future<Either<Failure, void>> submitApplication(Application application);
  Future<Either<Failure, List<Application>>> getApplicationsByProjectId(
      String projectId);
  Future<Either<Failure, Application>> getApplicationById(String applicationId);
  Future<Either<Failure, void>> deleteApplication(String applicationId);
  Future<Either<Failure, void>> updateApplication(Application application);
}
