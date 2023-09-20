import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/core/resource/app_color.dart';
import 'package:forestvpn_test/core/app_router.dart';
import 'package:forestvpn_test/core/service_locator/service_locator.dart';
import 'package:forestvpn_test/news/bloc/article/articles_bloc.dart';
import 'package:forestvpn_test/news/bloc/feature/feature_bloc.dart';
import 'package:forestvpn_test/news_detail/bloc/article_bloc.dart';

void main() {
  ServiceLocator.init();
  runApp(const ProconnectTestApp());
}

class ProconnectTestApp extends StatelessWidget {
  const ProconnectTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeatureBloc>(
          create: (context) => getIt<FeatureBloc>(),
        ),
        BlocProvider<ArticlesBloc>(
          create: (context) => getIt<ArticlesBloc>(),
        ),
        BlocProvider<ArticleBloc>(
          create: (context) => getIt<ArticleBloc>(),
        ),
      ],
      child: MaterialApp.router(
        color: Colors.white,
        theme: ThemeData(
          primarySwatch: AppColor.primarySwatch,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
