import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/abstract_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final AbstractNewsRepository repository;

  ArticleBloc({
    required this.repository,
  }) : super(ArticleInitial()) {
    on<FetchArticle>(_fetchArticle);
  }

  FutureOr<void> _fetchArticle(
      FetchArticle event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    var article = await repository.getArticle(event.id);
    emit(ArticleLoaded(article));
  }
}
