part of 'overview_cubit.dart';

final class OverviewState extends Equatable {
  const OverviewState({
    this.status = OverviewStatus.initial,
    this.hasReachedLimit = false,
    this.pageNumber = 1,
    this.museumItems = const <MuseumObject>[],
  });

  final OverviewStatus status;

  final bool hasReachedLimit;

  final int pageNumber;

  final List<MuseumObject> museumItems;

  @override
  List<Object?> get props => [
        status,
        hasReachedLimit,
        pageNumber,
        museumItems.hashCode,
      ];

  OverviewState copyWith({
    OverviewStatus? status,
    List<MuseumObject>? museumItems,
    bool? hasReachedLimit,
    int? pageNumber,
  }) {
    return OverviewState(
      status: status ?? this.status,
      museumItems: museumItems ?? this.museumItems,
      hasReachedLimit: hasReachedLimit ?? this.hasReachedLimit,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
