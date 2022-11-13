import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository/view/search_repository_screen.dart';
import 'package:search_github_repository/view/repository_detail_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SearchRepositoryScreen(),
        '/repository_detail': (context) => RepositoryDetailScreen(),
      },
      theme: ThemeData(
        backgroundColor: Colors.white,
        hintColor: Color(0xFF707070),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFFFF5858),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
          elevation: 0,
        ),
        iconTheme: IconThemeData(color: Color(0xFF707070)),
        textTheme: TextTheme(
          displayMedium: TextStyle(fontSize: 14, color: Colors.black),
          displayLarge: TextStyle(fontSize: 17, color: Colors.black),
          titleMedium: TextStyle(fontSize: 20, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      darkTheme: ThemeData(
        backgroundColor: Color(0xFF484039),
        hintColor: Color(0xFF707070),
        scaffoldBackgroundColor: Color(0xFF484039),
        primaryColor: Color(0xFF65AFEF),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Color(0xFF484039),
          elevation: 0,
        ),
        iconTheme: IconThemeData(color: Color(0xFF707070)),
        textTheme: TextTheme(
          displayMedium: TextStyle(fontSize: 17, color: Colors.white),
          titleMedium: TextStyle(fontSize: 20, color: Colors.white),
          titleLarge: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      title: 'Flutter Demo',
    );
  }
}
