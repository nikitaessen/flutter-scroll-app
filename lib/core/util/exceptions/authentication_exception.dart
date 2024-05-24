import 'package:flutter_scroll_app/core/util/exceptions/repository_exception_base.dart';

class AuthenticationException extends RepositoryExceptionBase {
  AuthenticationException({
    super.message = 'Authentication Exception',
    super.response,
  });
}
