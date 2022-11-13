import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository/api/github_api_client.dart';
import 'package:search_github_repository/model/github_repository.dart';


final searchRepositoryViewModel =
    Provider((ref) => SearchRepositoryViewModel(ref));

final githubRepositoryListState =
    StateProvider<List<GithubRepository>>((ref) => []);
final searchTextState = StateProvider<String>(((ref) => ''));


class SearchRepositoryViewModel {
  final Ref ref;
  SearchRepositoryViewModel(this.ref);

  Future<void> reserchRepository(String query) async {
    final repositoryList =
        await ref.read(searchRepositoryApiClient).getRepositories(query);

    ref.read(githubRepositoryListState.notifier).state = repositoryList;
  }
}
