import 'package:dio/dio.dart';
import 'package:flutter_scroll_app/data/api/museum_api_service.dart';
import 'package:flutter_scroll_app/shared/base_executor.dart';
import 'package:injectable/injectable.dart';

const _baseUrl = 'rijksmuseum.nl';
const _locale = 'en';

@Injectable(as: MuseumApiService)
class MuseumApiServiceImpl with BaseExecutor implements MuseumApiService {
  MuseumApiServiceImpl();

  @override
  Future<Response<Object>> getData(int page) async {
    final requestUrl = Uri.https(
      _baseUrl,
      '/api/$_locale/collection',
      {'key': 'dummyKey'},
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
