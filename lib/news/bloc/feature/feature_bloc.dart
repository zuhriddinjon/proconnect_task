// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

part 'feature_event.dart';
part 'feature_state.dart';

class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  final AbstractNewsRepository repository;

  FeatureBloc({
    required this.repository,
  }) : super(FeatureInitial()) {
    on<FetchFeature>(_fetchFeature);
  }

  FutureOr<void> _fetchFeature(
      FetchFeature event, Emitter<FeatureState> emit) async {
    emit(FeatureLoading());
    var list = await repository.getFeaturedArticles();
    emit(FeatureLoaded(list));
  }
}
