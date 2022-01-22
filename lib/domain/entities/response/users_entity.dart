import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final int? totalCount;
  final bool? incompleteResults;
  final List<DataUserEntity>? items;

  const UsersEntity(this.totalCount, this.incompleteResults, this.items);

  bool isLastPage(int previouslyFetchedItems) {
    final newItems = items?.length ?? 0;
    final totalItemCount = newItems + previouslyFetchedItems;
    return totalItemCount == totalCount;
  }

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];
}

class DataUserEntity extends Equatable {
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
  final double? score;

  const DataUserEntity(
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
      this.siteAdmin,
      this.score);

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
        siteAdmin,
        score
      ];
}
