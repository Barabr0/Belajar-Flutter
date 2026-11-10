import 'dart:math';

import 'package:flutter/material.dart';

class OutputEskulScreen extends StatelessWidget {
  final String namaLengkap, nomor, email, tglDaftar,kelas,eskul;

  OutputEskulScreen({
    Key? key,
    required this.namaLengkap,
    required this.nomor,
    required this.email,
    required this.tglDaftar,
    required this.kelas,
    required this.eskul,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
         child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(vertical: 24,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textWidget("Nama Lengkap",namaLengkap),
                _textWidget("Nomor",nomor),
                _textWidget("Email",email),
                _textWidget("Tanggal Daftar",tglDaftar),
                _textWidget("Kelas",kelas),
                _textWidget("Eskul",eskul),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
   Widget _textWidget(String label, String value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}