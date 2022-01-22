import 'package:dartz/dartz.dart';
import 'package:testing_project/core/exception/failure.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';

abstract class AppRepository {
  Stream<Either<Failure, UsersEntity>> getUsersData(SearchPaginationBody body);
  Stream<Either<Failure, IssuesEntity>> getIssuesData(
      SearchPaginationBody body);
  Stream<Either<Failure, RepositoriesEntity>> getRepositories(
      SearchPaginationBody body);
}
