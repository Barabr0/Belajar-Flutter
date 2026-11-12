import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constants_comment.dart';
import '../models/comment.dart';

class ApiService {
  Future<List<Comment>> fetchComments() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}'
    );

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return data.map((e) => Comment.fromJson(e)).toList();
      }else {
        throw Exception('Gagal memuat data (kode: ${response.statusCode})');
      }
    } on TimeoutException{
      throw Exception('Koneksi terlalu lama');
    }
  }
}