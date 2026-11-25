import 'dart:io';
import 'package:flutter/foundation.dart'; // Wajib untuk kIsWeb
import '../constants/api_constants.dart';
import '../models/article_model.dart';
import 'api_client.dart';

class ArticleService {
  final _api = ApiClient();

  // READ (list)
  Future<List<ArticleModel>> getAll() async {
    final body = await _api.request('GET', ApiConstants.articles);
    final list = body['data'] as List;
    return list.map((e) => ArticleModel.fromJson(e)).toList();
  }

  // CREATE (mendukung File untuk Mobile & Uint8List untuk Web)
  Future<ArticleModel> create({
    required String title,
    required String content,
    File? image,
    Uint8List? imageBytes, // Tambahan parameter untuk Web
  }) async {
    final body = await _api.multipart(
      ApiConstants.articles,
      fields: {'title': title, 'content': content},
      file: image,
      fileBytes: imageBytes, // Kirim bytes ke ApiClient Anda jika didukung
    );
    return ArticleModel.fromJson(body['data']);
  }

  // UPDATE (mendukung File untuk Mobile & Uint8List untuk Web)
  Future<ArticleModel> update(
    int id, {
    required String title,
    required String content,
    File? image,
    Uint8List? imageBytes, // Tambahan parameter untuk Web
    bool removeImage = false,
  }) async {
    final body = await _api.multipart(
      '${ApiConstants.articles}/$id',
      fields: {
        '_method': 'PUT', // method spoofing
        'title': title,
        'content': content,
        if (removeImage) 'remove_image': '1',
      },
      file: image,
      fileBytes: imageBytes, // Kirim bytes ke ApiClient Anda jika didukung
    );
    return ArticleModel.fromJson(body['data']);
  }

  // DELETE
  Future<void> delete(int id) async {
    await _api.request('DELETE', '${ApiConstants.articles}/$id');
  }
}