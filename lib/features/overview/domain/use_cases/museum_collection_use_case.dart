import 'package:flutter_scroll_app/features/overview/domain/entities/museum_collection.dart';
import 'package:flutter_scroll_app/core/data/repositories/museum_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumCollectionUseCase {
  MuseumCollectionUseCase(this._repository);

  final MuseumRepository _repository;

  Future<MuseumCollection> execute({int pageNumber = 1}) {
    return _repository.getObjects(pageNumber);
  }
}
