part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {}

final class ArticleInitial extends ArticleState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ArticleInitial{}';
  }
}

final class ArticleLoading extends ArticleState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ArticleLoading{}';
  }
}

final class ArticleLoaded extends ArticleState {
  final Article article;

  ArticleLoaded(this.article);

  @override
  List<Object?> get props => [article];

  @override
  String toString() {
    return 'ArticleLoaded{articles=$article}';
  }
}

final class ArticleError extends ArticleState {
  final String error;

  ArticleError(this.error);

  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return 'ArticleError{error=$error}';
  }
}
