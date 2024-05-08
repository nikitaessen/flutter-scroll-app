import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/authentication_exception.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/bad_request_exception.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/internal_server_error_exception.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/validation_exception.dart';
import 'package:flutter_scroll_app/src/data/repository/repository_base.dart';
import 'package:flutter_test/flutter_test.dart';

class TestRepository extends RepositoryBase {}

class TestModel {
  TestModel({
    required this.name,
    required this.age,
  });

  String name;
  int age;
}

void main() {
  group(RepositoryBase, () {
    late TestRepository testRepository;

    setUp(() {
      testRepository = TestRepository();
    });

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall is called with mapper provided'
      'THEN returns expected value',
      () async {
        const expected = 'expected';

        final actual = await testRepository.executeApiCall<dynamic, dynamic>(
          invoker: () => Future.value(
            Response(
              data: expected,
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          ),
          mapper: (model) => model,
        );

        expect(actual, expected);
      },
    );

    test(
      'GIVEN TestRepository response with null body'
      'WHEN executeApiCall is called'
      'THEN throws RepositoryException',
      () async {
        expect(
          testRepository.executeApiCall<dynamic, dynamic>(
            invoker: Future.value,
          ),
          throwsA(isA<RepositoryException>()),
        );
      },
    );

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall is called with no mapper'
      'THEN throws RepositoryException',
      () async {
        expect(
          testRepository.executeApiCall<dynamic, dynamic>(
            invoker: () => Future.value(
              Response(
                requestOptions: RequestOptions(),
                data: 'testData',
              ),
            ),
          ),
          throwsA(isA<RepositoryException>()),
        );
      },
    );

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall executed with status HttpStatus.unauthorized'
      'THEN throws AuthenticationException',
      () async {
        const expected = 'expected';

        final actual =  testRepository.executeApiCall<dynamic, dynamic>(
          invoker: () => Future.value(
            Response(
              data: expected,
              statusCode: HttpStatus.unauthorized,
              requestOptions: RequestOptions(),
            ),
          ),
          mapper: (model) => model,
        );

        expect(actual, throwsA(isA<AuthenticationException>()));
      },
    );

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall executed with status HttpStatus.forbidden'
      'THEN throws AuthenticationException',
      () async {
        const expected = 'expected';

        final actual =  testRepository.executeApiCall<dynamic, dynamic>(
          invoker: () => Future.value(
            Response(
              data: expected,
              statusCode: HttpStatus.forbidden,
              requestOptions: RequestOptions(),
            ),
          ),
          mapper: (model) => model,
        );

        expect(actual, throwsA(isA<AuthenticationException>()));
      },
    );

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall executed with status HttpStatus.conflict'
      'THEN throws ValidationException',
      () async {
        const expected = 'expected';

        final actual =  testRepository.executeApiCall<dynamic, dynamic>(
          invoker: () => Future.value(
            Response(
              data: expected,
              statusCode: HttpStatus.conflict,
              requestOptions: RequestOptions(),
            ),
          ),
          mapper: (model) => model,
        );

        expect(actual, throwsA(isA<ValidationException>()));
      },
    );

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall executed with status HttpStatus.badRequest'
      'THEN throws BadRequestException',
      () async {
        const expected = 'expected';

        final actual =  testRepository.executeApiCall<dynamic, dynamic>(
          invoker: () => Future.value(
            Response(
              data: expected,
              statusCode: HttpStatus.badRequest,
              requestOptions: RequestOptions(),
            ),
          ),
          mapper: (model) => model,
        );

        expect(actual, throwsA(isA<BadRequestException>()));
      },
    );

    test(
      'GIVEN TestRepository'
      'WHEN executeApiCall executed with status HttpStatus.internalServerError'
      'THEN throws InternalServerErrorException',
      () async {
        const expected = 'expected';

        final actual =  testRepository.executeApiCall<dynamic, dynamic>(
          invoker: () => Future.value(
            Response(
              data: expected,
              statusCode: HttpStatus.internalServerError,
              requestOptions: RequestOptions(),
            ),
          ),
          mapper: (model) => model,
        );

        expect(actual, throwsA(isA<InternalServerErrorException>()));
      },
    );
  });
}
