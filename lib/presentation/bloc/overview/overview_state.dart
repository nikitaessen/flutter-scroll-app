part of 'overview_cubit.dart';

abstract class OverviewState extends Equatable {}

class OverviewLoadingState extends OverviewState {
  @override
  List<Object?> get props => [];
}

class OverviewLoadedState extends OverviewState {
  OverviewLoadedState({required this.museumItems});

  final List<MuseumItem> museumItems;

  @override
  List<Object?> get props => [museumItems];
}

class OverviewErrorState extends OverviewState {
  OverviewErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
