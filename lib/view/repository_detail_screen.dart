import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository/view_model/search_repository_view_model.dart';

class RepositoryDetailScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context); 
    final selectedRepository = ref.watch(selectedRepositoryState);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 160,
                child: selectedRepository!.avatarUrl != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            NetworkImage(selectedRepository.avatarUrl!),
                      )
                    : const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                selectedRepository.fullName.split('/')[0],
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD0D7DE)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        selectedRepository.name,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'プロジェクト言語：${selectedRepository.language}',
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'スター数：${selectedRepository.stargazersCount}',
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Watcher数：${selectedRepository.watchersCount}',
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fork数：${selectedRepository.forksCount}',
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Issue数：${selectedRepository.openIssuesCount}',
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}