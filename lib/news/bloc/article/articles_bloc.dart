// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/news/bloc/article/articles_state.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

part 'articles_event.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final AbstractNewsRepository repository;
  List<Article> list = [];

  ArticlesBloc({
    required this.repository,
  }) : super(ArticlesInitial()) {
    on<FetchArticles>(_fetchArticles);
    on<ChangeArticleReaded>(_changeArticleReaded);
  }

  FutureOr<void> _fetchArticles(
      FetchArticles event, Emitter<ArticlesState> emit) async {
    emit(ArticlesLoading());
    list = await repository.getLatestArticles();
    emit(ArticlesLoaded(list));
  }

  FutureOr<void> _changeArticleReaded(
      ChangeArticleReaded event, Emitter<ArticlesState> emit) {
    List<Article> readedList = [];
    list.forEach((element) {
      readedList.add(element.copyWith(readed: true));
    });
    list = readedList;
    emit(ArticlesLoaded(list));
  }
}
