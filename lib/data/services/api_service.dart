import 'dart:convert';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For MediaType

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Map<String, String> _prepareHeaders(Map<String, String>? headers) {
    return <String, String>{
      'Content-Type': 'application/json',
      if (headers != null) ...headers,
    };
  }

  void _logRequest(
    String method,
    Uri uri,
    Map<String, String> headers,
    dynamic body,
  ) {
    print('API Request - $method $uri');
    print('Headers: $headers');
    if (body != null) print('Body: $body');
  }

  T _processResponse<T>(
    http.Response response,
    T Function(dynamic json) decoder,
  ) {
    print('API Response - Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      return decoder(jsonResponse);
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? "Unknown error",
        body: response.body,
      );
    }
  }

  Future<T> get<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    _logRequest('GET', uri, requestHeaders, null);

    final response = await http.get(uri, headers: requestHeaders);
    return _processResponse(response, decoder);
  }

  Future<T> post<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    final encodedBody = jsonEncode(body);
    _logRequest('POST', uri, requestHeaders, encodedBody);

    final response = await http.post(
      uri,
      headers: requestHeaders,
      body: encodedBody,
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
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    final encodedBody = jsonEncode(body);
    _logRequest('PUT', uri, requestHeaders, encodedBody);

    final response = await http.put(
      uri,
      headers: requestHeaders,
      body: encodedBody,
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
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    final encodedBody = jsonEncode(body);
    _logRequest('DELETE', uri, requestHeaders, encodedBody);

    final response = await http.delete(
      uri,
      headers: requestHeaders,
      body: body != null ? encodedBody : null,
    );
    return _processResponse(response, decoder);
  }

  /// Helper method to get MIME type from file extension
  String? _getMimeType(String filename) {
    final ext = filename.split('.').last.toLowerCase();
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      default:
        return null; // Let the http package determine the content type
    }
  }

  Future<T> postDropzoneFiles<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? fields,
    required List<DropzoneFileInterface> files,
    required String fileFieldName,
    required T Function(dynamic json) decoder,
    required DropzoneViewController dropzoneController,
  }) async {
    try {
      final uri = Uri.parse(baseUrl + path);
      final request = http.MultipartRequest('POST', uri);

      // Headers
      final requestHeaders = <String, String>{
        'Accept': 'application/json',
        if (headers != null) ...headers,
      };
      request.headers.addAll(requestHeaders);

      // Fields
      if (fields != null) request.fields.addAll(fields);

      print('Processing ${files.length} files for upload');

      for (int i = 0; i < files.length; i++) {
        final file = files[i];
        final bytes = await dropzoneController.getFileData(file);
        final name = file.name.toLowerCase();

        final isPdf = name.endsWith('.pdf');
        final mimeType = isPdf ? 'application/pdf' : _getMimeType(file.name);

        // ⭐ IMPORTANT PART: correct backend field names
        final fieldName = isPdf ? 'pdf' : 'images';

        final multipartFile = http.MultipartFile.fromBytes(
          fieldName,
          bytes,
          filename: file.name,
          contentType: mimeType != null ? MediaType.parse(mimeType) : null,
        );

        request.files.add(multipartFile);

        print(
          'Added ${file.name} under "$fieldName" with type "${mimeType ?? 'unknown'}"',
        );
      }

      if (request.files.isEmpty) {
        throw Exception('No valid files were added to the request');
      }

      print('Sending request to ${uri.toString()}');
      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      return _processResponse(response, decoder);
    } catch (e) {
      print('Error in postDropzoneFiles: $e');
      rethrow;
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;
  final String body;

  ApiException({
    required this.statusCode,
    required this.message,
    required this.body,
  });

  @override
  String toString() {
    return 'ApiException: HTTP $statusCode - $message\nBody: $body';
  }
}
