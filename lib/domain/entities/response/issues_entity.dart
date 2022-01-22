import 'package:equatable/equatable.dart';

class IssuesEntity extends Equatable {
  final int? totalCount;
  final bool? incompleteResult;
  final List<DataIssuesEntity>? items;

  const IssuesEntity(this.totalCount, this.incompleteResult, this.items);

  bool isLastPage(int previouslyFetchedItems) {
    final newItems = items?.length ?? 0;
    final totalItems = previouslyFetchedItems + newItems;

    return totalItems == totalCount;
  }

  @override
  List<Object?> get props => [totalCount, incompleteResult, items];
}

class DataIssuesEntity extends Equatable {
  final String? url;
  final String? repositoryUrl;
  final String? labelsUrl;
  final String? commentsUrl;
  final String? eventsUrl;
  final String? htmlUrl;
  final double? id;
  final String? nodeId;
  final double? number;
  final String? title;
  final UserIssuesEntity? user;
  final List<LabelIssuesEntity>? labels;
  final String? state;
  final bool? locked;
  final double? comments;
  final String? createdAt;
  final String? updatedAt;
  final String? closedAt;
  final String? authorAssociation;
  final String? activeLockReason;
  final bool? draft;
  final ReactionIssuesEntity? reactions;
  final String? timelineUrl;
  final double? score;

  const DataIssuesEntity(
      this.url,
      this.repositoryUrl,
      this.labelsUrl,
      this.commentsUrl,
      this.eventsUrl,
      this.htmlUrl,
      this.id,
      this.nodeId,
      this.number,
      this.title,
      this.user,
      this.labels,
      this.state,
      this.locked,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.authorAssociation,
      this.activeLockReason,
      this.draft,
      this.reactions,
      this.timelineUrl,
      this.score);

  @override
  List<Object?> get props => [
        url,
        repositoryUrl,
        labelsUrl,
        commentsUrl,
        eventsUrl,
        htmlUrl,
        id,
        nodeId,
        number,
        title,
        user,
        labels,
        state,
        locked,
        comments,
        createdAt,
        updatedAt,
        closedAt,
        authorAssociation,
        activeLockReason,
        draft,
        reactions,
        timelineUrl,
        score
      ];
}

class UserIssuesEntity extends Equatable {
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

  const UserIssuesEntity(
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

class LabelIssuesEntity extends Equatable {
  final double? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? color;
  final String? description;

  const LabelIssuesEntity(
      this.id, this.nodeId, this.url, this.name, this.color, this.description);

  @override
  List<Object?> get props => [id, nodeId, url, name, color, description];
}

class ReactionIssuesEntity extends Equatable {
  final String? url;
  final double? totalCount;
  final double? laugh;
  final double? hooray;
  final double? confused;
  final double? heart;
  final double? rocket;
  final double? eyes;

  const ReactionIssuesEntity(this.url, this.totalCount, this.laugh, this.hooray,
      this.confused, this.heart, this.rocket, this.eyes);

  @override
  List<Object?> get props =>
      [url, totalCount, laugh, hooray, confused, heart, rocket, eyes];
}
