import 'package:http/http.dart';

abstract class IRestClient {
  Future<Response> get(
    String path, {
    Map<String, String> header,
    Map<String, dynamic> parameters,
  });
}
