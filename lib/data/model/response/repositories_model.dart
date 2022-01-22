import 'package:json_annotation/json_annotation.dart';
import 'package:testing_project/domain/entities/response/repositories_entity.dart';

part 'repositories_model.g.dart';

@JsonSerializable(createToJson: false)
class RepositoriesModel extends RepositoriesEntity {
  RepositoriesModel(int? totalCount, bool? incompleteResults,
      List<DataRepositoriesModel> items)
      : super(totalCount, incompleteResults, items);
  factory RepositoriesModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataRepositoriesModel extends DataRepositoriesEntity {
  DataRepositoriesModel(
      double? id,
      String? nodeId,
      String? name,
      String? fullName,
      bool? private,
      OwnerRepositoriesModel? owner,
      String? htmlUrl,
      String? description,
      bool? fork,
      double? size,
      double? stargazersCount,
      double? watchersCount,
      String? language,
      bool? hasIssues,
      bool? hasProjects,
      bool? hasDownloads,
      bool? hasWiki,
      bool? hasPages,
      double? forksCount,
      bool? archived,
      bool? disabled,
      double? openIssuesCount,
      bool? allowForking,
      bool? isTemplate,
      List? topics,
      String? visibility,
      double? forks,
      double? openIssues,
      double? watchers,
      String? defaultBranch,
      double? score,
      String? createdAt,
      String? updatedAt,
      String? pushedAt)
      : super(
            id,
            nodeId,
            name,
            fullName,
            private,
            owner,
            htmlUrl,
            description,
            fork,
            size,
            stargazersCount,
            watchersCount,
            language,
            hasIssues,
            hasProjects,
            hasDownloads,
            hasWiki,
            hasPages,
            forksCount,
            archived,
            disabled,
            openIssuesCount,
            allowForking,
            isTemplate,
            topics,
            visibility,
            forks,
            openIssues,
            watchers,
            defaultBranch,
            score,
            createdAt,
            updatedAt,
            pushedAt);

  factory DataRepositoriesModel.fromJson(Map<String, dynamic> json) =>
      _$DataRepositoriesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class OwnerRepositoriesModel extends OwnerRepositoriesEntity {
  OwnerRepositoriesModel(
      String? login,
      double? id,
      String? nodeId,
      String? avatarUrl,
      String? gravatarId,
      String? url,
      String? htmlUrl,
      String? followersUrl,
      String? followingUrl,
      String? gistsUrl,
      String? starredUrl,
      String? subscriptionsUrl,
      String? organizationsUrl,
      String? reposUrl,
      String? eventsUrl,
      String? receivedEventsUrl,
      String? type,
      bool? siteAdmin)
      : super(
            login,
            id,
            nodeId,
            avatarUrl,
            gravatarId,
            url,
            htmlUrl,
            followersUrl,
            followingUrl,
            gistsUrl,
            starredUrl,
            subscriptionsUrl,
            organizationsUrl,
            reposUrl,
            eventsUrl,
            receivedEventsUrl,
            type,
            siteAdmin);
  factory OwnerRepositoriesModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerRepositoriesModelFromJson(json);
}
