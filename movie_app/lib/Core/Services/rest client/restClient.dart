import 'package:http/http.dart';
import 'package:movie_app/Core/Configs/MovieApiUrls.dart';
import 'package:movie_app/Core/Services/rest%20client/iRestClient.dart';

class RestClient extends IRestClient {
  final Client _client;
  final MovieApi _appConfig;

  RestClient(this._client, this._appConfig);

  @override
  Future<Response> get(String path,
      {Map<String, String>? header,
      Map<String, dynamic>? parameters,
      bool isAuthenticationRequired = true}) async {
    final client = _client;
    return await client.get(
      Uri.https(_appConfig.movieApi, path, parameters),
      headers: header,
    );
  }
}
