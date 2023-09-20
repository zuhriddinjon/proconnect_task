part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

final class FetchArticles extends ArticlesEvent {
  @override
  String toString() {
    return 'FetchArticles{}';
  }
}

final class ChangeArticleReaded extends ArticlesEvent {
  @override
  String toString() {
    return 'ChangeArticleReaded{}';
  }
}
