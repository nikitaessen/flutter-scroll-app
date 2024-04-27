import 'package:dio/dio.dart';

abstract class MuseumApiService {
  Future<Response<Object>> getData(int page);
}