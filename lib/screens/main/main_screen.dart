import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:testing_project/bloc/issues/issues_bloc.dart';
import 'package:testing_project/bloc/repositories/repositories_bloc.dart';
import 'package:testing_project/bloc/users/users_bloc.dart';
import 'package:testing_project/core/di/injector_container.dart';
import 'package:testing_project/data/model/request/search_pagination_body.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';
import 'package:testing_project/screens/main/local_widget/custom_appbar.dart';
import 'package:testing_project/screens/main/local_widget/data_selector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final getUserBloc = sl<UsersBloc>();
  final getIssueBloc = sl<IssuesBloc>();
  final getRepositoriesBloc = sl<RepositoriesBloc>();

  final PagingController<int, DataUserEntity> usersPagingController =
      PagingController(firstPageKey: 1);

  final PagingController<int, DataIssuesEntity> issuesPagingController =
      PagingController(firstPageKey: 1);

  final PagingController<int, DataRepositoriesEntity>
      repositoriesPagingController = PagingController(firstPageKey: 1);

  final searchController = TextEditingController();
  String selectedData = 'users';
  bool isLazyLoad = true;
  String searchValue = "";

  int selectedPage = 1;

  onChangeDataSelector(value) {
    setState(() {
      selectedData = value;
      selectedPage = 1;
    });

    if (selectedData == 'users') {
      usersPagingController.refresh();
    } else if (selectedData == 'issues') {
      issuesPagingController.refresh();
    } else {
      repositoriesPagingController.refresh();
    }
  }

  onSubmitSearch(String value) {
    setState(() {
      searchValue = value;
      selectedPage = 1;
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (selectedData == 'users') {
        usersPagingController.refresh();
      } else if (selectedData == 'issues') {
        issuesPagingController.refresh();
      } else {
        repositoriesPagingController.refresh();
      }
    });
  }

  onChangePaginate(bool isLazy) {
    setState(() {
      isLazyLoad = isLazy;
      selectedPage = 1;
    });

    if (selectedData == 'users') {
      usersPagingController.refresh();
    } else if (selectedData == 'issues') {
      issuesPagingController.refresh();
    } else {
      repositoriesPagingController.refresh();
    }
  }

  onChangePage(int page) {
    setState(() {
      selectedPage = page;
    });

    if (selectedData == 'users') {
      usersPagingController.refresh();
    } else if (selectedData == 'issues') {
      issuesPagingController.refresh();
    } else {
      repositoriesPagingController.refresh();
    }
  }

  getUserData(int pageKey) {
    try {
      var searchText = searchValue.isNotEmpty ? searchValue : null;
      var body = SearchPaginationBody(
          page: isLazyLoad ? pageKey : selectedPage, searchKey: searchText);
      getUserBloc.getUsersData(body);
      int i = 0;
      getUserBloc.data.listen((event) {
        if (event.items != null && i == 0) {
          i++;

          final previouslyFetchedItems =
              usersPagingController.itemList?.length ?? 0;
          final isLastPage = event.isLastPage(previouslyFetchedItems);
          final newItems = event.items;

          if (isLazyLoad) {
            if (isLastPage) {
              usersPagingController.appendLastPage(newItems!);
            } else {
              final nextPageKey = pageKey + 1;
              usersPagingController.appendPage(newItems!, nextPageKey);
            }
          } else {
            usersPagingController.itemList?.clear();
            usersPagingController.appendLastPage(newItems!);
          }
        }
      });
    } catch (e) {
      usersPagingController.error = e;
    }
  }

  getIssuesData(int pageKey) {
    try {
      var searchText = searchValue.isNotEmpty ? searchValue : null;
      var body = SearchPaginationBody(
          page: isLazyLoad ? pageKey : selectedPage, searchKey: searchText);
      getIssueBloc.getIssuesData(body);
      int i = 0;
      getIssueBloc.data.listen((event) {
        if (event.items != null && i == 0) {
          i++;

          final previouslyFetchedItems =
              issuesPagingController.itemList?.length ?? 0;
          final isLastPage = event.isLastPage(previouslyFetchedItems);
          final newItems = event.items;

          if (isLazyLoad) {
            if (isLastPage) {
              issuesPagingController.appendLastPage(newItems!);
            } else {
              final nextPageKey = pageKey + 1;
              issuesPagingController.appendPage(newItems!, nextPageKey);
            }
          } else {
            issuesPagingController.itemList?.clear();
            issuesPagingController.appendLastPage(newItems!);
          }
        }
      });
    } catch (e) {
      usersPagingController.error = e;
    }
  }

  getRepositories(int pageKey) {
    try {
      var searchText = searchValue.isNotEmpty ? searchValue : null;
      var body = SearchPaginationBody(
          page: isLazyLoad ? pageKey : selectedPage, searchKey: searchText);
      getRepositoriesBloc.getRepositories(body);
      int i = 0;
      getRepositoriesBloc.data.listen((event) {
        if (event.items != null && i == 0) {
          i++;

          final previouslyFetchItem =
              repositoriesPagingController.itemList?.length ?? 0;
          final isLastPage = event.isLastPage(previouslyFetchItem);
          final newItems = event.items;

          if (isLazyLoad) {
            if (isLastPage) {
              repositoriesPagingController.appendLastPage(newItems);
            } else {
              final nextPageKey = pageKey + 1;
              repositoriesPagingController.appendPage(newItems, nextPageKey);
            }
          } else {
            repositoriesPagingController.itemList?.clear();
            repositoriesPagingController.appendLastPage(newItems);
          }
        }
      });
    } catch (e) {
      usersPagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();
    usersPagingController.addPageRequestListener(getUserData);
    issuesPagingController.addPageRequestListener(getIssuesData);
    repositoriesPagingController.addPageRequestListener(getRepositories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: CustomAppBar(
                          onSubmit: onSubmitSearch,
                          controller: searchController,
                          bottom: PreferredSize(
                              preferredSize: Size.fromHeight(Get.width / 4),
                              child: DataSelector(
                                  onLazyLoad: () => onChangePaginate(true),
                                  onWithIndex: () => onChangePaginate(false),
                                  isLazyLoad: isLazyLoad,
                                  selectedValue: selectedData,
                                  onChanged: onChangeDataSelector))))
                ],
            body: Column(
              children: [
                Expanded(child: buildList()),
                if (!isLazyLoad)
                  Container(
                      height: 54,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Center(
                              child: InkWell(
                                onTap: () => onChangePage(index + 1),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: selectedPage == (index + 1)
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).dividerColor),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      (index + 1).toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: selectedPage == (index + 1)
                                                  ? Colors.white
                                                  : null),
                                    )),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 5),
                          itemCount: 20))
              ],
            )));
  }

  Widget buildList() {
    if (selectedData == 'users') {
      return UserList(usersPagingController: usersPagingController);
    } else if (selectedData == 'issues') {
      return IssuesList(issuePagingController: issuesPagingController);
    } else {
      return RepositoryList(repoPagingController: repositoriesPagingController);
    }
  }
}

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required this.usersPagingController,
  }) : super(key: key);

  final PagingController<int, DataUserEntity> usersPagingController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        PagedSliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            pagingController: usersPagingController,
            shrinkWrapFirstPageIndicators: true,
            builderDelegate: PagedChildBuilderDelegate<DataUserEntity>(
                itemBuilder: (context, item, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(item.avatarUrl ?? ""),
                ),
                title: Text(item.login!),
                onTap: () {},
              );
            }))
      ],
    );
  }
}

class IssuesList extends StatelessWidget {
  const IssuesList({
    Key? key,
    required this.issuePagingController,
  }) : super(key: key);

  final PagingController<int, DataIssuesEntity> issuePagingController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        PagedSliverList(
            pagingController: issuePagingController,
            shrinkWrapFirstPageIndicators: true,
            builderDelegate: PagedChildBuilderDelegate<DataIssuesEntity>(
              itemBuilder: (context, item, index) {
                return ListTile(
                  title: Text(item.title!),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(item.user?.avatarUrl ?? "")),
                  trailing: Text(item.state!),
                  subtitle: Text(DateFormat("dd MMMM yyyy")
                      .format(DateTime.parse(item.updatedAt!))),
                );
              },
            ))
      ],
    );
  }
}

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    Key? key,
    required this.repoPagingController,
  }) : super(key: key);

  final PagingController<int, DataRepositoriesEntity> repoPagingController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        PagedSliverList(
            pagingController: repoPagingController,
            shrinkWrapFirstPageIndicators: true,
            builderDelegate: PagedChildBuilderDelegate<DataRepositoriesEntity>(
                itemBuilder: (context, item, index) {
              return ListTile(
                  title: Text(item.name!),
                  trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Watcher : ${item.watchersCount.toString()}"),
                        Text("Stars : ${item.stargazersCount.toString()}"),
                        Text("Fork ${item.forksCount.toString()}")
                      ]),
                  subtitle: Text(DateFormat("dd MMMM yyyy")
                      .format(DateTime.parse(item.createdAt!))),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(item.owner?.avatarUrl ?? "")));
            }))
      ],
    );
  }
}
