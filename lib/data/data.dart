import 'package:flutter/material.dart';

// Warna tema yang dipakai di semua halaman.
const Color kBg = Color(0xFF0F0F12);
const Color kCard = Color(0xFF1A1A20);
const Color kBorder = Color(0xFF2A2A32);
const Color kRed = Color(0xFFD32F2F);

// Data kategori (tanpa model, hanya List<Map>).
final List<Map<String, String>> categories = [
  {'emoji': '🥰', 'name': 'Romance'},
  {'emoji': '😱', 'name': 'Horror'},
  {'emoji': '😂', 'name': 'Comedy'},
  {'emoji': '😢', 'name': 'Drama'},
];

// Data film (tanpa model, hanya List<Map>).
// Poster dibuat dari gradasi warna + judul agar tidak butuh aset gambar.
final List<Map<String, dynamic>> movies = [
  {
    'title': 'Dark Mystic',
    'genre': 'Horror',
    'duration': '2h 06m',
    'rating': '7.4 / 10',
    'colors': [Color(0xFF5B0F14), Color(0xFF1B1B22)],
    'synopsis':
        'Seorang dokter bedah saraf terjebak dalam teka-teki antar dimensi '
        'ketika sebuah kekuatan gelap mulai merembes ke dunia nyata. Ia harus '
        'bekerja sama dengan sekutu yang tak terduga untuk menutup gerbang '
        'sebelum semuanya terlambat.',
  },
  {
    'title': 'Thunder Love',
    'genre': 'Comedy',
    'duration': '1h 59m',
    'rating': '8.1 / 10',
    'colors': [Color(0xFF7A2FD0), Color(0xFFE8563A), Color(0xFF1E88C9)],
    'synopsis':
        'Seorang pahlawan yang ingin pensiun menemukan ketenangan batin, '
        'sampai ancaman dari seorang pembunuh galaksi memaksanya kembali '
        'bertarung. Bersama mantan kekasih dan para sahabat lamanya, ia '
        'memulai petualangan kosmik yang mengubah segalanya. Di tengah aksi '
        'dan humor, mereka belajar tentang cinta, kehilangan, dan arti '
        'pengorbanan sejati.',
  },
  {
    'title': 'Yellow Rise',
    'genre': 'Comedy',
    'duration': '1h 35m',
    'rating': '6.9 / 10',
    'colors': [Color(0xFFE0A21B), Color(0xFF7C4A0A)],
    'synopsis':
        'Sekelompok makhluk kecil berwarna kuning bersaing menjadi asisten '
        'penjahat paling hebat di dunia. Kekacauan pun tak terelakkan ketika '
        'rencana besar mereka berantakan di tengah kota.',
  },
  {
    'title': 'Midnight Run',
    'genre': 'Drama',
    'duration': '2h 12m',
    'rating': '7.8 / 10',
    'colors': [Color(0xFF0D3B66), Color(0xFF111827)],
    'synopsis':
        'Dua orang asing bertemu di stasiun terakhir malam itu dan '
        'menghabiskan semalam suntuk menyusuri kota sambil membuka rahasia '
        'masing-masing.',
  },
  {
    'title': 'Sweet Season',
    'genre': 'Romance',
    'duration': '1h 48m',
    'rating': '7.2 / 10',
    'colors': [Color(0xFFD6457A), Color(0xFF512B58)],
    'synopsis':
        'Musim semi membawa dua mantan kekasih kembali ke kota kecil '
        'tempat mereka tumbuh. Perlahan, kenangan lama dan perasaan yang '
        'belum selesai muncul kembali.',
  },
];

// Jadwal tayang.
const List<String> showTimes = ['15:45', '18:10', '19:30', '19:45', '20:15'];

// Daftar bioskop yang bisa dipilih (tanpa model, hanya List<Map>).
final List<Map<String, String>> cinemas = [
  {'name': 'Cinema XXI Jember', 'location': 'Lippo Plaza Jember'},
  {'name': 'CGV Jember', 'location': 'Roxy Square Jember'},
  {'name': 'Cinepolis Surabaya', 'location': 'Lenmarc Mall Surabaya'},
  {'name': 'Cinema XXI Malang', 'location': 'Malang Town Square'},
];

// Harga satu tiket (rupiah).
const int ticketPrice = 50000;

// Format angka jadi Rupiah, contoh: 50000 -> "Rp 50.000".
String formatRp(int value) {
  final String digits = value.abs().toString();
  final StringBuffer buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write('.');
    buffer.write(digits[i]);
  }
  return '${value < 0 ? '-' : ''}Rp $buffer';
}

// Poster film berupa gradasi + judul (pengganti gambar).
Widget posterBox(Map<String, dynamic> movie, {double radius = 16}) {
  final List<Color> colors = List<Color>.from(movie['colors'] as List);
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      ),
    ),
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.all(10),
    child: Text(
      (movie['title'] as String).toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        letterSpacing: 1,
        color: Colors.white,
        shadows: [Shadow(blurRadius: 8, color: Colors.black87)],
      ),
    ),
  );
}