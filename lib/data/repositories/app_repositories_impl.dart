import 'package:testing_project/core/exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testing_project/data/datasource/common/base_datasource_factory.dart';
import 'package:testing_project/data/datasource/common/datasouce_factory.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';
import 'package:testing_project/domain/repository/app_repository.dart';

class AppRepositoriesImpl implements AppRepository {
  AppRepositoriesImpl(this._bindingDataSourceFactory);

  late final BindingDataSourceFactory _bindingDataSourceFactory;

  @override
  Stream<Either<Failure, UsersEntity>> getUsersData(SearchPaginationBody body) {
    return _bindingDataSourceFactory
        .createData(DataSouceState.network)
        .getUserData(body)
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, IssuesEntity>> getIssuesData(
      SearchPaginationBody body) {
    return _bindingDataSourceFactory
        .createData(DataSouceState.network)
        .getIssuesData(body)
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, RepositoriesEntity>> getRepositories(
      SearchPaginationBody body) {
    return _bindingDataSourceFactory
        .createData(DataSouceState.network)
        .getRepositoriesData(body)
        .map((event) => Right(event));
  }
}
