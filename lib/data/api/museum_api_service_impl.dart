import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/data/api/museum_api_service.dart';
import 'package:injectable/injectable.dart';

const _baseUrl = 'rijksmuseum.nl';
const _locale = 'en';

@Injectable(as: MuseumApiService)
class MuseumApiServiceImpl implements MuseumApiService {
  MuseumApiServiceImpl();

  String get apiKey => const String.fromEnvironment('MUSEUM_KEY');

  @override
  Future<Response<Object>> fetchCollectionData(int page) async {
    final requestUrl = Uri.https(
      _baseUrl,
      '/api/$_locale/collection',
      {
        'key': apiKey,
        'p': '$page',
        'culture': 'en',
      },
    );

    final client = Dio();
    final response = client.get<Object>(
      requestUrl.toString(),
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    return response;
  }

  @override
  Future<Response<Object>> fetchItemDetails(String objectNumber) async {
    final requestUrl = Uri.https(
      _baseUrl,
      '/api/$_locale/collection/$objectNumber',
      {
        'key': apiKey,
        'culture': 'en',
      },
    );

    final client = Dio();
    final response = client.get<Object>(
      requestUrl.toString(),
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    return response;
  }
}
