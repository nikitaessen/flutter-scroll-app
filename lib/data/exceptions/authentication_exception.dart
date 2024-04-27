import 'package:flutter_scroll_app/data/exceptions/repository_exception_base.dart';

class AuthenticationException extends RepositoryExceptionBase {
  AuthenticationException({
    super.message = 'Authentication Exception',
    super.response,
  });
}
