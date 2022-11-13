import 'package:hooks_riverpod/hooks_riverpod.dart';

final reserchRepositoriesApiClient =
    Provider(((ref) => ReserchRepositoriesApiClient(ref)));

class ReserchRepositoriesApiClient {
  final Ref ref;
  ReserchRepositoriesApiClient(this.ref);

  getRepositories(String query) async {}
}
