import 'package:forestvpn_test/news/bloc/article/articles_bloc.dart';
import 'package:forestvpn_test/news/bloc/feature/feature_bloc.dart';
import 'package:forestvpn_test/news_detail/bloc/article_bloc.dart';
import 'package:forestvpn_test/repositories/news/abstract_news_repository.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerLazySingleton<AbstractNewsRepository>(
        () => MockNewsRepository());

    getIt.registerFactory(
        () => FeatureBloc(repository: getIt<AbstractNewsRepository>()));

    getIt.registerFactory(
        () => ArticlesBloc(repository: getIt<AbstractNewsRepository>()));

    getIt.registerFactory(
        () => ArticleBloc(repository: getIt<AbstractNewsRepository>()));
  }
}
