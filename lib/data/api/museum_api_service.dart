import 'package:dio/dio.dart';

abstract class MuseumApiService {
  Future<Response<Object>> fetchCollectionData(int page);
  Future<Response<Object>> fetchItemDetails(String objectNumber);
}
