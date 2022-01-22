import 'package:testing_project/core/exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testing_project/core/use_case/use_case.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/repository/app_repository.dart';

class GetRepositoriesUseCase
    extends UseCase<RepositoriesEntity, SearchPaginationBody> {
  final AppRepository repository;

  GetRepositoriesUseCase(this.repository);

  @override
  Stream<Either<Failure, RepositoriesEntity>> build(
      SearchPaginationBody params) {
    return repository.getRepositories(params);
  }
}
