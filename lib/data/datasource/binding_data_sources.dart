import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';

abstract class BindingDataSources {
  Stream<UsersEntity> getUserData(SearchPaginationBody body);
  Stream<IssuesEntity> getIssuesData(SearchPaginationBody body);
  Stream<RepositoriesEntity> getRepositoriesData(SearchPaginationBody body);
}
