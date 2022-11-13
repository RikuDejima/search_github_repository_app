import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository/api/github_api_client.dart';
import 'package:search_github_repository/model/github_repository.dart';


final searchRepositoryViewModel =
    Provider((ref) => SearchRepositoryScreenViewModel(ref));

final githubRepositoryListState =
    StateProvider<List<GithubRepository>>((ref) => []);
final searchTextState = StateProvider<String>(((ref) => ''));


class SearchRepositoryScreenViewModel {
  final Ref ref;
  SearchRepositoryScreenViewModel(this.ref);

  Future<void> reserchRepository(String query) async {
    final githubRepositoryList =
        await ref.read(searchRepositoryApiClient).getRepositories(query);

    ref.read(githubRepositoryListState.notifier).state = githubRepositoryList;
  }
}
