import 'package:testing_project/core/exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testing_project/core/use_case/use_case.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/repository/app_repository.dart';

class GetIssuesDataUseCase extends UseCase<IssuesEntity, SearchPaginationBody> {
  final AppRepository repository;

  GetIssuesDataUseCase(this.repository);

  @override
  Stream<Either<Failure, IssuesEntity>> build(SearchPaginationBody params) {
    return repository.getIssuesData(params);
  }
}
