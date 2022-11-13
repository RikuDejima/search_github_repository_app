import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'github_repository.freezed.dart';

@freezed
class GithubRepository with _$GithubRepository {
  const factory GithubRepository({
    required String name,
    required String fullName,
    String? language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
    required String avatarUrl,
  }) = _GithubRepository;
}