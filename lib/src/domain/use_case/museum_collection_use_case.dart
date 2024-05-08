import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/src/domain/repositories/museum_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumCollectionUseCase {
  MuseumCollectionUseCase(this._repository);

  final MuseumRepository _repository;

  Future<List<MuseumObject>> execute({int pageNumber = 1}) {
    return _repository.getObjects(pageNumber);
  }
}
