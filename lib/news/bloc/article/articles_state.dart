import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();
}

final class ArticlesInitial extends ArticlesState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ArticlesInitial{}';
  }
}

final class ArticlesLoading extends ArticlesState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ArticlesLoading{}';
  }
}

final class ArticlesLoaded extends ArticlesState {
  final List<Article> articles;

  ArticlesLoaded(this.articles);

  @override
  List<Object?> get props => [articles];

  @override
  String toString() {
    return 'ArticlesLoaded{articles=$articles}';
  }
}

final class ArticlesError extends ArticlesState {
  final String error;

  ArticlesError(this.error);

  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return 'ArticlesError{error=$error}';
  }
}
