part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {}

final class FetchArticle extends ArticleEvent {
  final String id;

  FetchArticle({required this.id});
  @override
  String toString() {
    return 'FetchArticle{id=$id}';
  }

  @override
  List<Object?> get props => [id];
}
