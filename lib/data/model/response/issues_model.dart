import 'package:json_annotation/json_annotation.dart';
import 'package:testing_project/domain/entities/response/issues_entity.dart';

part 'issues_model.g.dart';

@JsonSerializable(createToJson: false)
class IssuesModel extends IssuesEntity {
  const IssuesModel(
      int? totalCount, bool? incompleteResult, List<DataIssuesModel>? items)
      : super(totalCount, incompleteResult, items);

  factory IssuesModel.fromJson(Map<String, dynamic> json) =>
      _$IssuesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataIssuesModel extends DataIssuesEntity {
  const DataIssuesModel(
      String? url,
      String? repositoryUrl,
      String? labelsUrl,
      String? commentsUrl,
      String? eventsUrl,
      String? htmlUrl,
      double? id,
      String? nodeId,
      double? number,
      String? title,
      UserIssuesModel? user,
      List<LabelIssuesModel>? labels,
      String? state,
      bool? locked,
      double? comments,
      String? createdAt,
      String? updatedAt,
      String? closedAt,
      String? authorAssociation,
      String? activeLockReason,
      bool? draft,
      ReactionIssuesModel? reactions,
      String? timelineUrl,
      double? score)
      : super(
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
            score);
  factory DataIssuesModel.fromJson(Map<String, dynamic> json) =>
      _$DataIssuesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserIssuesModel extends UserIssuesEntity {
  UserIssuesModel(
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

  factory UserIssuesModel.fromJson(Map<String, dynamic> json) =>
      _$UserIssuesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class LabelIssuesModel extends LabelIssuesEntity {
  const LabelIssuesModel(double? id, String? nodeId, String? url, String? name,
      String? color, String? description)
      : super(id, nodeId, url, name, color, description);

  factory LabelIssuesModel.fromJson(Map<String, dynamic> json) =>
      _$LabelIssuesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ReactionIssuesModel extends ReactionIssuesEntity {
  const ReactionIssuesModel(
      String? url,
      double? totalCount,
      double? laugh,
      double? hooray,
      double? confused,
      double? heart,
      double? rocket,
      double? eyes)
      : super(url, totalCount, laugh, hooray, confused, heart, rocket, eyes);

  factory ReactionIssuesModel.fromJson(Map<String, dynamic> json) =>
      _$ReactionIssuesModelFromJson(json);
}
