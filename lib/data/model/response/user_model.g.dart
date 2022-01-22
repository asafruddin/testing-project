// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      json['total_count'] as int?,
      json['incomplete_results'] as bool?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => DataUsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataUsersModel _$DataUsersModelFromJson(Map<String, dynamic> json) =>
    DataUsersModel(
      json['login'] as String?,
      (json['id'] as num?)?.toDouble(),
      json['node_id'] as String?,
      json['avatar_url'] as String?,
      json['gravatar_id'] as String?,
      json['url'] as String?,
      json['html_url'] as String?,
      json['followers_url'] as String?,
      json['following_url'] as String?,
      json['gists_url'] as String?,
      json['starred_url'] as String?,
      json['subscriptions_url'] as String?,
      json['organizations_url'] as String?,
      json['repos_url'] as String?,
      json['events_url'] as String?,
      json['received_events_url'] as String?,
      json['type'] as String?,
      json['site_admin'] as bool?,
      (json['score'] as num?)?.toDouble(),
    );
