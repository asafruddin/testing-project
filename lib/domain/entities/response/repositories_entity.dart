import 'package:equatable/equatable.dart';

class RepositoriesEntity extends Equatable {
  final int? totalCount;
  final bool? incompleteResults;
  final List<DataRepositoriesEntity> items;

  RepositoriesEntity(this.totalCount, this.incompleteResults, this.items);

  bool isLastPage(int previouslyFetchItem) {
    final newItems = items.length;
    final totalItems = newItems + previouslyFetchItem;

    return totalCount == totalItems;
  }

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];
}

class DataRepositoriesEntity extends Equatable {
  final double? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final OwnerRepositoriesEntity? owner;
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final double? size;
  final double? stargazersCount;
  final double? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final double? forksCount;
  final bool? archived;
  final bool? disabled;
  final double? openIssuesCount;
  final bool? allowForking;
  final bool? isTemplate;
  final List<dynamic>? topics;
  final String? visibility;
  final double? forks;
  final double? openIssues;
  final double? watchers;
  final String? defaultBranch;
  final double? score;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;

  DataRepositoriesEntity(
      this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.htmlUrl,
      this.description,
      this.fork,
      this.size,
      this.stargazersCount,
      this.watchersCount,
      this.language,
      this.hasIssues,
      this.hasProjects,
      this.hasDownloads,
      this.hasWiki,
      this.hasPages,
      this.forksCount,
      this.archived,
      this.disabled,
      this.openIssuesCount,
      this.allowForking,
      this.isTemplate,
      this.topics,
      this.visibility,
      this.forks,
      this.openIssues,
      this.watchers,
      this.defaultBranch,
      this.score,
      this.createdAt,
      this.updatedAt,
      this.pushedAt);

  @override
  List<Object?> get props => [
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
        pushedAt
      ];
}

class OwnerRepositoriesEntity extends Equatable {
  final String? login;
  final double? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  const OwnerRepositoriesEntity(
      this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin);

  @override
  List<Object?> get props => [
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
        siteAdmin
      ];
}
