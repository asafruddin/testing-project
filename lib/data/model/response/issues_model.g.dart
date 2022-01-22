// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuesModel _$IssuesModelFromJson(Map<String, dynamic> json) => IssuesModel(
      json['total_count'] as int?,
      json['incomplete_result'] as bool?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => DataIssuesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataIssuesModel _$DataIssuesModelFromJson(Map<String, dynamic> json) =>
    DataIssuesModel(
      json['url'] as String?,
      json['repository_url'] as String?,
      json['labels_url'] as String?,
      json['comments_url'] as String?,
      json['events_url'] as String?,
      json['html_url'] as String?,
      (json['id'] as num?)?.toDouble(),
      json['node_id'] as String?,
      (json['number'] as num?)?.toDouble(),
      json['title'] as String?,
      json['user'] == null
          ? null
          : UserIssuesModel.fromJson(json['user'] as Map<String, dynamic>),
      (json['labels'] as List<dynamic>?)
          ?.map((e) => LabelIssuesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['state'] as String?,
      json['locked'] as bool?,
      json['assignee'] as String?,
      json['assignees'] as List<dynamic>?,
      json['milestone'] as String?,
      (json['comments'] as num?)?.toDouble(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['closed_at'] as String?,
      json['author_association'] as String?,
      json['active_lock_reason'] as String?,
      json['draft'] as bool?,
      json['body'] as String?,
      json['reactions'] == null
          ? null
          : ReactionIssuesModel.fromJson(
              json['reactions'] as Map<String, dynamic>),
      json['timeline_url'] as String?,
      json['performed_via_github_app'] as String?,
      (json['score'] as num?)?.toDouble(),
    );

UserIssuesModel _$UserIssuesModelFromJson(Map<String, dynamic> json) =>
    UserIssuesModel(
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
    );

LabelIssuesModel _$LabelIssuesModelFromJson(Map<String, dynamic> json) =>
    LabelIssuesModel(
      (json['id'] as num?)?.toDouble(),
      json['node_id'] as String?,
      json['url'] as String?,
      json['name'] as String?,
      json['color'] as String?,
      json['description'] as String?,
    );

ReactionIssuesModel _$ReactionIssuesModelFromJson(Map<String, dynamic> json) =>
    ReactionIssuesModel(
      json['url'] as String?,
      (json['total_count'] as num?)?.toDouble(),
      (json['laugh'] as num?)?.toDouble(),
      (json['hooray'] as num?)?.toDouble(),
      (json['confused'] as num?)?.toDouble(),
      (json['heart'] as num?)?.toDouble(),
      (json['rocket'] as num?)?.toDouble(),
      (json['eyes'] as num?)?.toDouble(),
    );
