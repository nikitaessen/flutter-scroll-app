import 'package:flutter_scroll_app/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/domain/repositories/museum_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumUseCase {
  MuseumUseCase(this._repository);

  final MuseumRepository _repository;

  Future<List<MuseumObject>> execute({int pageNumber = 1}) {
    return _repository.getObjects(pageNumber);
  }
}
