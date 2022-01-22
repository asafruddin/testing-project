import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/use_case/get_issues_data_usecase.dart';

class IssuesBloc {
  final GetIssuesDataUseCase useCase;

  IssuesBloc(this.useCase);

  final _issuesData = BehaviorSubject<IssuesEntity>();

  Function(IssuesEntity) get updateIssues => _issuesData.sink.add;

  Stream<IssuesEntity> get data => _issuesData.stream;

  void getIssuesData(SearchPaginationBody body) {
    useCase.execute(body).listen((event) {
      event.fold((l) {
        if (kDebugMode) {
          print("something went wrong on geting issues data : ${l.message}");
        }
        _issuesData.addError(l);
      }, (r) => updateIssues(r));
    });
  }

  void dispose() {
    _issuesData.close();
  }
}
