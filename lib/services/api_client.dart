import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'api_exception.dart';

class ApiClient {
  static const _tokenKey = 'access_token';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // ---------------- REQUEST JSON (surat) ----------------
  Future<Map<String, dynamic>> request(
    String method,
    String url, {
    Map<String, dynamic>? body,
  }) async {
    final token = await _getToken();
    final uri = Uri.parse(url);
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
    final encoded = body == null ? null : jsonEncode(body);

    final response = await _guard(switch (method.toUpperCase()) {
      'GET' => http.get(uri, headers: headers),
      'POST' => http.post(uri, headers: headers, body: encoded),
      'PUT' => http.put(uri, headers: headers, body: encoded),
      'DELETE' => http.delete(uri, headers: headers),
      _ => throw ArgumentError('Method tidak dikenal: $method'),
    });

    return _handle(response);
  }

  // ---------------- REQUEST MULTIPART (paket + file / bytes) ----------------
  Future<Map<String, dynamic>> multipart(
    String url, {
    required Map<String, String> fields,
    File? file,
    Uint8List? fileBytes,
    String fileField = 'image',
  }) async {
    final token = await _getToken();

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll({
        'Accept': 'application/json',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      })
      ..fields.addAll(fields);

    try {
      if (kIsWeb && fileBytes != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            fileField,
            fileBytes,
            filename: 'upload.jpg',
          ),
        );
      } else if (file != null) {
        request.files.add(
          await http.MultipartFile.fromPath(fileField, file.path),
        );
      }
    } on FileSystemException {
      throw ApiException('File tidak bisa dibaca atau tidak ditemukan');
    }

    final response = await _guard(
      request.send().then(http.Response.fromStream),
      timeout: const Duration(seconds: 30),
    );

    return _handle(response);
  }

  // ---------------- ALAT BANTU ----------------

  Future<http.Response> _guard(
    Future<http.Response> future, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    try {
      return await future.timeout(timeout);
    } on TimeoutException {
      throw ApiException('Koneksi timeout, coba lagi');
    } on SocketException {
      throw ApiException('Tidak ada koneksi atau server tidak terjangkau');
    } on http.ClientException {
      // Di Flutter Web, error jaringan/CORS muncul sebagai ClientException
      throw ApiException('Tidak ada koneksi atau server tidak terjangkau');
    }
  }

  Future<Map<String, dynamic>> _handle(http.Response response) async {
    final data = _decode(response);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    switch (response.statusCode) {
      case 401:
        await _clearToken();
        throw ApiException('Sesi habis, silakan login lagi', 401);
      case 404:
        throw ApiException('Data tidak ditemukan', 404);
      case 413:
        throw ApiException('Ukuran file terlalu besar', 413);
      case 422:
        throw ApiException(_parseErrors(data), 422);
      default:
        throw ApiException(
          data['message']?.toString() ?? 'Terjadi kesalahan pada server',
          response.statusCode,
        );
    }
  }

  Map<String, dynamic> _decode(http.Response response) {
    if (response.body.isEmpty) return {};
    try {
      final data = jsonDecode(response.body);
      if (data is Map<String, dynamic>) return data;
      // Kalau root JSON berupa list, bungkus supaya datanya tidak hilang
      if (data is List) return {'data': data};
      return {};
    } on FormatException {
      throw ApiException('Response server tidak valid', response.statusCode);
    }
  }

  String _parseErrors(Map<String, dynamic> body) {
    final source = body['errors'] is Map ? body['errors'] as Map : body;
    final messages = source.values
        .expand((e) => e is List ? e : [e])
        .map((e) => e.toString())
        .toList();
    return messages.isEmpty ? 'Data tidak valid' : messages.join('\n');
  }
}