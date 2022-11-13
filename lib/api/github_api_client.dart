import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchRepositoryApiClient =
    Provider(((ref) => SearchRepositoryApiClient(ref)));

class SearchRepositoryApiClient {
  final Ref ref;
  SearchRepositoryApiClient(this.ref);

  getRepositories(String query) async {
    
  }
}
