part of 'details_cubit.dart';

final class DetailsState extends Equatable {
  const DetailsState({
    this.status = DetailsStatus.initial,
    this.title = '',
    this.description = '',
    this.imageUrl = '',
  });

  final DetailsStatus status;

  final String title;

  final String description;

  final String imageUrl;

  @override
  List<Object?> get props => [
        status,
        title,
        description,
        imageUrl,
      ];

  DetailsState copyWith({
    DetailsStatus? status,
    String? title,
    String? description,
    String? imageUrl,
  }) {
    return DetailsState(
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
