import 'package:json_annotation/json_annotation.dart';
import 'package:testing_project/domain/entities/response/users_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UsersModel extends UsersEntity {
  const UsersModel(
      int? totalCount, bool? incompleteResults, List<DataUsersModel>? items)
      : super(totalCount, incompleteResults, items);

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataUsersModel extends DataUserEntity {
  const DataUsersModel(
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
      bool? siteAdmin,
      double? score)
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
            siteAdmin,
            score);

  factory DataUsersModel.fromJson(Map<String, dynamic> json) =>
      _$DataUsersModelFromJson(json);
}
