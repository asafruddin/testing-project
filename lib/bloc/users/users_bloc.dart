import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';
import 'package:testing_project/core/use_case/use_case.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';
import 'package:testing_project/domain/use_case/get_users_data.dart';

class UsersBloc {
  final GetUsersDataUseCase useCase;

  UsersBloc(this.useCase);

  final _usersData = BehaviorSubject<UsersEntity>();

  Function(UsersEntity) get updateUsers => _usersData.sink.add;

  Stream<UsersEntity> get data => _usersData.stream;

  void getUsersData(SearchPaginationBody body) {
    useCase.execute(body).listen((event) {
      event.fold((l) {
        if (kDebugMode) {
          print("something went wrong on geting users data : ${l.message}");
        }
        _usersData.addError(l);
      }, (r) => updateUsers(r));
    });
  }

  void dispose() {
    _usersData.close();
  }
}
