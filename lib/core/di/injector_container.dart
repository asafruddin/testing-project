import 'package:get_it/get_it.dart';
import 'package:testing_project/bloc/issues/issues_bloc.dart';
import 'package:testing_project/bloc/repositories/repositories_bloc.dart';
import 'package:testing_project/bloc/users/users_bloc.dart';
import 'package:testing_project/core/network/client.dart';
import 'package:testing_project/data/datasource/binding/binding_remote.dart';
import 'package:testing_project/data/datasource/common/datasouce_factory.dart';
import 'package:testing_project/data/repositories/app_repositories_impl.dart';
import 'package:testing_project/domain/repository/app_repository.dart';
import 'package:testing_project/domain/use_case/get_issues_data_usecase.dart';
import 'package:testing_project/domain/use_case/get_repositories_usecase.dart';
import 'package:testing_project/domain/use_case/get_users_data.dart';
import 'package:testing_project/env/config.dart';

final sl = GetIt.instance;

/// injection some component
Future<void> init() async {
  /// initial component for config environment
  final config = await Config.getInstance();

  /// register the config
  sl.registerLazySingleton(() => config);

  /// register the network
  sl.registerLazySingleton(() => sl<Client>().dio);
  sl.registerLazySingleton(() => Client(sl()));

  /// register the bind for requesting the data
  sl.registerFactory(() => BindingRemote(sl()));
  sl.registerFactory(() => BindingDataSourceFactory(bindingRemote: sl()));

  /// register the repository
  sl.registerFactory<AppRepository>(() => AppRepositoriesImpl(sl()));

  /// usecase
  sl.registerFactory(() => GetUsersDataUseCase(sl()));
  sl.registerFactory(() => GetIssuesDataUseCase(sl()));
  sl.registerFactory(() => GetRepositoriesUseCase(sl()));

  /// bloc
  sl.registerFactory(() => UsersBloc(sl()));
  sl.registerFactory(() => IssuesBloc(sl()));
  sl.registerFactory(() => RepositoriesBloc(sl()));
}
