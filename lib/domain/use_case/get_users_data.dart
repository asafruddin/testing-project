import 'package:testing_project/core/exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testing_project/core/use_case/use_case.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';
import 'package:testing_project/domain/repository/app_repository.dart';

class GetUsersDataUseCase extends UseCase<UsersEntity, SearchPaginationBody> {
  final AppRepository repository;

  GetUsersDataUseCase(this.repository);

  @override
  Stream<Either<Failure, UsersEntity>> build(SearchPaginationBody params) {
    return repository.getUsersData(params);
  }
}
