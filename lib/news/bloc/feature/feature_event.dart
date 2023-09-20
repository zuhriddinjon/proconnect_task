part of 'feature_bloc.dart';

sealed class FeatureEvent extends Equatable {
  const FeatureEvent();

  @override
  List<Object> get props => [];
}

final class FetchFeature extends FeatureEvent {
  @override
  String toString() {
    return 'FetchFeature{}';
  }
}
