import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/data/exceptions/authentication_exception.dart';
import 'package:flutter_scroll_app/data/exceptions/bad_request_exception.dart';
import 'package:flutter_scroll_app/data/exceptions/internal_server_error_exception.dart';
import 'package:flutter_scroll_app/data/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/data/exceptions/repository_exception_base.dart';
import 'package:flutter_scroll_app/data/exceptions/validation_exception.dart';
import 'package:flutter_scroll_app/data/extensions/response_extensions.dart';

abstract class RepositoryBase {
  RepositoryBase();

  static const _maxAttemptsCount = 3;

  Future<T> executeApiCall<T, TSource>({
    required Future<Response<TSource>> Function() invoker,
    T Function(TSource)? mapper,
    bool useTimeout = true,
    int timeoutInSeconds = 1000,
    int retryAttemptNumber = 0,
  }) async {
    try {
      Future<Response<TSource>> invokerFuture = invoker();

      if (useTimeout) {
        invokerFuture =
            invokerFuture.timeout(Duration(seconds: timeoutInSeconds));
      }

      final response = await invokerFuture;
      final statusCode = response.statusCode!;
      _validateStatusCode(statusCode, response);

      final body = response.data;
      if (response.isSuccessfull && mapper != null && body != null) {
        return mapper(body);
      } else {
        throw RepositoryExceptionBase(
            response: response,
            message: 'Status code: ${response.statusCode}'
                '\nBody: ${response.data.toString()}');
      }
    } catch (ex) {
      if (retryAttemptNumber <= _maxAttemptsCount) {
        executeApiCall(
          invoker: invoker,
          mapper: mapper,
          useTimeout: useTimeout,
          timeoutInSeconds: timeoutInSeconds,
          retryAttemptNumber: retryAttemptNumber + 1,
        );
      }

      // TODO(Nikita): log error
      throw RepositoryException(message: ex.toString());
    }
  }

  void _validateStatusCode(int statusCode, response) {
    if (statusCode == HttpStatus.unauthorized ||
        statusCode == HttpStatus.forbidden) {
      throw AuthenticationException(response: response);
    } else if (statusCode == HttpStatus.conflict) {
      throw ValidationException(response);
    } else if (statusCode == HttpStatus.badRequest) {
      throw BadRequestException(response);
    } else if (statusCode == HttpStatus.internalServerError) {
      throw InternalServerErrorException(response);
    }
  }
}
