import 'package:forestvpn_test/repositories/news/repository.dart';

abstract class AbstractNewsRepository {
  Future<List<Article>> getArticles();
  Future<Article> getArticle(String id);
}
