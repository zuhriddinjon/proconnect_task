part of 'feature_bloc.dart';

sealed class FeatureState extends Equatable {
  const FeatureState();
}

final class FeatureInitial extends FeatureState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'FeatureInitial{}';
  }
}

final class FeatureLoading extends FeatureState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'FeatureLoading{}';
  }
}

final class FeatureLoaded extends FeatureState {
  final List<Article> articles;

  FeatureLoaded(this.articles);

  @override
  List<Object?> get props => [articles];

  @override
  String toString() {
    return 'FeatureLoaded{articles=$articles}';
  }
}

final class FeatureError extends FeatureState {
  final String error;

  FeatureError(this.error);

  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return 'FeatureError{error=$error}';
  }
}
