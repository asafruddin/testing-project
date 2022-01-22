import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/use_case/get_repositories_usecase.dart';

class RepositoriesBloc {
  final GetRepositoriesUseCase useCase;

  RepositoriesBloc(this.useCase);

  final _repositoriesData = BehaviorSubject<RepositoriesEntity>();

  Function(RepositoriesEntity) get updateRepositories =>
      _repositoriesData.sink.add;

  Stream<RepositoriesEntity> get data => _repositoriesData.stream;

  void getRepositories(SearchPaginationBody body) {
    useCase.execute(body).listen((event) {
      event.fold((l) {
        if (kDebugMode) {
          print(
              "something went wrong on geting repositories data : ${l.message}");
        }
        _repositoriesData.addError(l);
      }, (r) => updateRepositories(r));
    });
  }

  void dispose() {
    _repositoriesData.close();
  }
}
