import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/core/util/exceptions/authentication_exception.dart';
import 'package:flutter_scroll_app/core/util/exceptions/bad_request_exception.dart';
import 'package:flutter_scroll_app/core/util/exceptions/internal_server_error_exception.dart';
import 'package:flutter_scroll_app/core/util/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/core/util/exceptions/repository_exception_base.dart';
import 'package:flutter_scroll_app/core/util/exceptions/validation_exception.dart';
import 'package:flutter_scroll_app/core/util/extensions/response_extensions.dart';

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
      // TODO(Nikita): log error

      if (retryAttemptNumber <= _maxAttemptsCount) {
        await executeApiCall<T, TSource>(
          invoker: invoker,
          mapper: mapper,
          useTimeout: useTimeout,
          timeoutInSeconds: timeoutInSeconds,
          retryAttemptNumber: retryAttemptNumber + 1,
        );
      }

      if (ex is RepositoryException) {
        rethrow;
      } else {
        throw RepositoryException(message: ex.toString());
      }
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
