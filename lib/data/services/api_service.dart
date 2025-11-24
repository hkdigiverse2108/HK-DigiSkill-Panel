import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Map<String, String> _prepareHeaders(Map<String, String>? headers) {
    return <String, String>{
      'Content-Type': 'application/json',
      if (headers != null) ...headers,
    };
  }

  Future<T> get<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(baseUrl + path).replace(
        queryParameters: queryParameters);
    final response = await http.get(uri, headers: _prepareHeaders(headers));
    return _processResponse(response, decoder);
  }

  Future<T> post<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(baseUrl + path).replace(
        queryParameters: queryParameters);
    final response = await http.post(
      uri,
      headers: _prepareHeaders(headers),
      body: jsonEncode(body),
    );
    return _processResponse(response, decoder);
  }

  Future<T> put<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(baseUrl + path).replace(
        queryParameters: queryParameters);
    final response = await http.put(
      uri,
      headers: _prepareHeaders(headers),
      body: jsonEncode(body),
    );
    return _processResponse(response, decoder);
  }

  Future<T> delete<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(baseUrl + path).replace(
        queryParameters: queryParameters);
    final response = await http.delete(
      uri,
      headers: _prepareHeaders(headers),
      body: jsonEncode(body),
    );
    return _processResponse(response, decoder);
  }

  T _processResponse<T>(http.Response response,
      T Function(dynamic json) decoder) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      return decoder(jsonResponse);
    } else {
      throw Exception(
          'API Error: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
