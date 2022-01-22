import 'package:dio/dio.dart';
import 'package:testing_project/data/datasource/binding_data_sources.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/data/model/response/issues_model.dart';
import 'package:testing_project/data/model/response/repositories_model.dart';
import 'package:testing_project/data/model/response/user_model.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';

class BindingRemote implements BindingDataSources {
  BindingRemote(this._client);

  late final Dio _client;

  @override
  Stream<UsersEntity> getUserData(SearchPaginationBody body) async* {
    final response = await _client
        .get('/users?q=${body.searchKey}&per_page=10&page=${body.page}');
    yield UsersModel.fromJson(response.data);
  }

  @override
  Stream<IssuesEntity> getIssuesData(SearchPaginationBody body) async* {
    final response = await _client
        .get('/issues?q=${body.searchKey}&per_page=10&page=${body.page}');
    yield IssuesModel.fromJson(response.data);
  }

  @override
  Stream<RepositoriesEntity> getRepositoriesData(
      SearchPaginationBody body) async* {
    final response = await _client
        .get('/repositories?q=${body.searchKey}&per_page=10&page=${body.page}');
    yield RepositoriesModel.fromJson(response.data);
  }
}
