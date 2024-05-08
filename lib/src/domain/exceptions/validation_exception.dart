import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/repository_exception.dart';

class ValidationException extends RepositoryException {
  ValidationException(this.response)
      : super(message: response?.data.toString() ?? 'Validation failed');

  final Response? response;
}