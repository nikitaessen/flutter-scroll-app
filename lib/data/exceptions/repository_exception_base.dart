import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/data/exceptions/repository_exception.dart';

class RepositoryExceptionBase extends RepositoryException {
  RepositoryExceptionBase({
    this.response,
    required super.message,
  });

  final Response? response;
}
