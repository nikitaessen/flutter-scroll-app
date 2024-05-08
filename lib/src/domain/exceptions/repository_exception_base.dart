import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/repository_exception.dart';

class RepositoryExceptionBase extends RepositoryException {
  RepositoryExceptionBase({
    this.response,
    required super.message,
  });

  final Response? response;
}
