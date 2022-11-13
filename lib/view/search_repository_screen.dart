import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository/view_model/search_repository_view_model.dart';

class SearchRepositoryScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final repositoryList = ref.watch(githubRepositoryListState);
    final searchText = ref.watch(searchTextState);
    final apiStatus = ref.watch(apiStatusState);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (searchText.isNotEmpty) {
                ref
                    .read(searchRepositoryViewModel)
                    .reserchRepository(searchText);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                '検索',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor,
                ),
              ),
            ),
          )
        ],
        titleSpacing: 0,
        title: Container(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          height: 40,
          child: TextField(
            maxLines: 1,
            cursorColor: theme.primaryColor,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              hintStyle: TextStyle(color: theme.hintColor, fontSize: 14),
              hintText: 'Githubのリポジトリを検索する',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: theme.backgroundColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: theme.backgroundColor,
                ),
              ),
              filled: true,
              fillColor: Color(0xFF1618230f),
            ),
            onChanged: (value) {
              ref.read(searchTextState.notifier).state = value;
            },
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                ref.read(searchRepositoryViewModel).reserchRepository(value);
              }
            },
          ),
        ),
      ),
      body: Center(
        child: apiStatus == ApiStatus.error
            ? AlertDialog(
                backgroundColor: theme.backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                elevation: 10,
                title: Text(
                  'エラーが発生しました',
                  style: theme.textTheme.titleMedium,
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      ref.read(apiStatusState.notifier).state = ApiStatus.none;
                    },
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ...repositoryList
                            .map(
                              (repo) => ListTile(
                                onTap: () {
                                  ref
                                      .read(selectedRepositoryState.notifier)
                                      .state = repo;
                                  Navigator.of(context)
                                      .pushNamed('/repository_detail');
                                },
                                title: Text(
                                  repo.name,
                                  style: theme.textTheme.displayMedium,
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
