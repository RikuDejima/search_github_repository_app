import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:search_github_repository/model/github_repository.dart';

final searchRepositoryApiClient =
    Provider(((ref) => SearchRepositoryApiClient(ref)));

class SearchRepositoryApiClient {
  final Ref ref;
  SearchRepositoryApiClient(this.ref);

  //GithubApiからRepositoryのデータを取得し、modelクラスのリストで返す
  Future<List<GithubRepository>> getRepositories(String query) async {
    final url =
        Uri.https('api.github.com', '/search/repositories', {'q': query});
    final response = await http.get(url);
    final List<GithubRepository> githubRepositoiesList = [];

    if (response.statusCode == HttpStatus.ok) {
      final data = json.decode(response.body);
      final List<dynamic> itemList = data['items'];

      for (var item in itemList) {
        githubRepositoiesList.add(GithubRepository.fromJson(item));
      }
    } else {
    }
    return githubRepositoiesList;
  }
}
