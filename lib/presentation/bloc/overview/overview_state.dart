part of 'overview_cubit.dart';

final class OverviewState extends Equatable {
  const OverviewState({
    this.status = OverviewStatus.initial,
    this.hasReachedLimit = false,
    this.pageNumber = 1,
    this.museumItems = const <MuseumItem>[],
  });

  final OverviewStatus status;

  final bool hasReachedLimit;

  final int pageNumber;

  final List<MuseumItem> museumItems;

  @override
  List<Object?> get props => [
        status,
        hasReachedLimit,
        pageNumber,
        museumItems.hashCode,
      ];

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedLimit, pageNumber: $pageNumber, posts: ${museumItems.length} }''';
  }

  OverviewState copyWith({
    OverviewStatus? status,
    List<MuseumItem>? museumItems,
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
