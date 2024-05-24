import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/core/util/exceptions/repository_exception.dart';

class InternalServerErrorException extends RepositoryException {
  InternalServerErrorException(this.response) : super(message: response?.data.toString() ?? 'Internal Server Error');
  final Response? response;
}