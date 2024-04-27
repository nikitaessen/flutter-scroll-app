import 'dart:async';

import 'package:flutter/foundation.dart';

typedef ExecutiveFunction<DomainModel> = Future<DomainModel> Function();
const _maxAttemptsCount = 3;

mixin BaseExecutor {
  Future<void> makeAsyncSafeExecution<T>({
    required ExecutiveFunction<T> function,
    ValueChanged<T>? onSuccess,
    FutureOr<void> Function(Exception ex)? onError,
    VoidCallback? onAuthenticationError,
    VoidCallback? onValidationError,
    int retryAttemptNumber = 0,
  }) async {
    if (retryAttemptNumber > _maxAttemptsCount) {
      return;
    }

    Future<void> repeatSafeAsyncExecution() async {
      return makeAsyncSafeExecution(
        function: function,
        onSuccess: onSuccess,
        onError: onError,
        onAuthenticationError: onAuthenticationError,
        retryAttemptNumber: retryAttemptNumber + 1,
      );
    }

    try {
      T result;
      result = await function();

      if (onSuccess != null) {
        onSuccess(result);
      }
    } catch (ex) {
      // TODO(Nikita): log error

      final exception = ex is Exception ? ex : Exception(ex);
      if (onError != null) {
        onError.call(exception);
      }
    }
  }
}
