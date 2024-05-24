import 'package:flutter_scroll_app/features/details/domain/entities/museum_object_details.dart';
import 'package:flutter_scroll_app/core/data/repositories/museum_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumObjectDetailsUseCase {
  MuseumObjectDetailsUseCase(this._repository);

  final MuseumRepository _repository;

  Future<MuseumObjectDetails> execute({required String objectNumber}) {
    return _repository.getObjectDetails(objectNumber);
  }
}
