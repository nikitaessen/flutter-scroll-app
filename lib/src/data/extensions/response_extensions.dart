import 'package:dio/dio.dart';

extension ResponseExtensions on Response {
  bool get isSuccessfull =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;
}
