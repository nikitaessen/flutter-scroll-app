import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/core/util/exceptions/repository_exception.dart';

class BadRequestException extends RepositoryException {
  BadRequestException(
    this.response) : super(message: response?.data.toString() ?? 'Bad Request');

  final Response? response;
}
