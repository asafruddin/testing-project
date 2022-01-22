// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesModel _$RepositoriesModelFromJson(Map<String, dynamic> json) =>
    RepositoriesModel(
      json['total_count'] as int?,
      json['incomplete_results'] as bool?,
      (json['items'] as List<dynamic>)
          .map((e) => DataRepositoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataRepositoriesModel _$DataRepositoriesModelFromJson(
        Map<String, dynamic> json) =>
    DataRepositoriesModel(
      (json['id'] as num?)?.toDouble(),
      json['node_id'] as String?,
      json['name'] as String?,
      json['full_name'] as String?,
      json['private'] as bool?,
      json['owner'] == null
          ? null
          : OwnerRepositoriesModel.fromJson(
              json['owner'] as Map<String, dynamic>),
      json['html_url'] as String?,
      json['description'] as String?,
      json['fork'] as bool?,
      (json['size'] as num?)?.toDouble(),
      (json['stargazers_count'] as num?)?.toDouble(),
      (json['watchers_count'] as num?)?.toDouble(),
      json['language'] as String?,
      json['has_issues'] as bool?,
      json['has_projects'] as bool?,
      json['has_downloads'] as bool?,
      json['has_wiki'] as bool?,
      json['has_pages'] as bool?,
      (json['forks_count'] as num?)?.toDouble(),
      json['archived'] as bool?,
      json['disabled'] as bool?,
      (json['open_issues_count'] as num?)?.toDouble(),
      json['allow_forking'] as bool?,
      json['is_template'] as bool?,
      json['topics'] as List<dynamic>?,
      json['visibility'] as String?,
      (json['forks'] as num?)?.toDouble(),
      (json['open_issues'] as num?)?.toDouble(),
      (json['watchers'] as num?)?.toDouble(),
      json['default_branch'] as String?,
      (json['score'] as num?)?.toDouble(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['pushed_at'] as String?,
    );

OwnerRepositoriesModel _$OwnerRepositoriesModelFromJson(
        Map<String, dynamic> json) =>
    OwnerRepositoriesModel(
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
