import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:flutter_scroll_app/domain/repository/museum_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumUseCase {
  MuseumUseCase(this._repository);

  final MuseumRepository _repository;

  Future<List<MuseumItem>> execute({int pageNumber = 1}) {
    return _repository.getItems(pageNumber);
  }
}
