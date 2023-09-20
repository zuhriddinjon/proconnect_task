import 'package:flutter/material.dart';
import 'package:forestvpn_test/core/pair.dart';
import 'package:forestvpn_test/news/news_screen.dart';
import 'package:forestvpn_test/news_detail/news_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final Pair<String, String> news = Pair('/news', 'news');
  static final Pair<String, String> newsDetail =
      Pair('/news_details/:article_id', 'news_details');

  static final GoRouter router = GoRouter(
    initialLocation: news.first,
    routes: <RouteBase>[
      GoRoute(
        path: news.first,
        name: news.second,
        builder: (BuildContext context, GoRouterState state) {
          return const NewsScreen();
        },
      ),
      GoRoute(
        path: newsDetail.first,
        name: newsDetail.second,
        builder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['article_id']!;
          return NewsDetailScreen(
            articleId: id,
          );
        },
      )
    ],
  );
}
