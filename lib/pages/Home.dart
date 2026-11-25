import 'dart:math';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  late Future<UserModel> _futureUser;
  int _tab = 0;

  static const _navy = Color(0xFF0E1B33);

  @override
  void initState() {
    super.initState();
    _futureUser = _auth.getUser();
  }

  Future<void> _logout() async {
    await _auth.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  String get _dateText {
    const m = [
      'januari', 'februari', 'maret', 'april', 'mei', 'juni', 'juli',
      'agustus', 'september', 'oktober', 'november', 'desember'
    ];
    final n = DateTime.now();
    return '${n.day} ${m[n.month - 1]}, ${n.year}';
  }

  @override
  Widget build(BuildContext context) {
    // Tab 1 (ikon bulan) = mode malam / jadwal
    final night = _tab == 1;

    return Scaffold(
      backgroundColor: _navy,
      body: FutureBuilder<UserModel>(
        future: _futureUser,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snap.error.toString(),
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _logout,
                    child: const Text('Kembali ke Login'),
                  ),
                ],
              ),
            );
          }
          final user = snap.data!;
          return Stack(
            children: [
              // Ilustrasi latar
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: CustomPaint(
                    key: ValueKey(night),
                    painter: _ScenePainter(night: night),
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 12, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  night
                                      ? 'Good Night, ${user.name}'
                                      : 'Welcome, ${user.name}',
                                  style: TextStyle(
                                    color: night ? Colors.white : _navy,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user.email,
                                  style: TextStyle(
                                    color: night ? Colors.white70 : _navy,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _dateText,
                                  style: TextStyle(
                                    color: night ? Colors.white : _navy,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: _logout,
                            icon: Icon(Icons.logout,
                                color: night ? Colors.white : _navy),
                          ),
                        ],
                      ),
                    ),
                    if (!night) _activityCard(),
                    const Spacer(),
                    night ? _programmation() : _needToday(),
                    _bottomNav(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ---------- Siang ----------
  Widget _activityCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.circle, size: 10, color: Colors.deepOrange),
              SizedBox(width: 6),
              Text('Activities today',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 11)),
              Spacer(),
              Text('8:00 p.m.', style: TextStyle(fontSize: 11)),
            ],
          ),
          const SizedBox(height: 6),
          const Text('Meditation and relaxation',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _needToday() {
    final items = [
      ('Meditation Zen', 'Recommend in the morning', Icons.self_improvement),
      ('Deep Sleep', 'Recommend at night', Icons.bedtime_outlined),
      ('Breathing', 'Recommend anytime', Icons.air),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: Text(
            'What do you need today?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        SizedBox(
          height: 72,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) {
              final it = items[i];
              return Container(
                width: 220,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: [
                    Icon(it.$3, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(it.$1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          const SizedBox(height: 2),
                          Text(it.$2,
                              style: const TextStyle(
                                  color: Colors.white54, fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // ---------- Malam ----------
  Widget _programmation() {
    Widget row(IconData icon, String title, String status, String time,
        {bool active = false}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF1A4FA3),
                shape: BoxShape.circle,
                border: active
                    ? Border.all(color: Colors.greenAccent, width: 2)
                    : null,
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                  Text(status,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 10)),
                ],
              ),
            ),
            Text(time,
                style: const TextStyle(color: Colors.white, fontSize: 11)),
          ],
        ),
      );
    }

    return Container(
      color: _navy.withOpacity(0.92),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('Programmation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                width: 64,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E6FE0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          row(Icons.self_improvement, 'Meditation Zen', 'In progress',
              '10.00 p.m.',
              active: true),
          row(Icons.bedtime, 'Bedtime', 'To do', '11.00 p.m.'),
        ],
      ),
    );
  }

  // ---------- Bottom nav ----------
  Widget _bottomNav() {
    final icons = [
      Icons.home_outlined,
      Icons.nightlight_outlined,
      Icons.circle_outlined,
      Icons.music_note_outlined,
    ];
    return Container(
      height: 64,
      color: const Color(0xFF0A1428),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          final sel = _tab == i;
          return InkWell(
            onTap: () => setState(() => _tab = i),
            child: SizedBox(
              width: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[i], color: Colors.white, size: 26),
                  const SizedBox(height: 4),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: sel ? Colors.amber : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Ilustrasi pemandangan (siang / malam) digambar dengan CustomPainter,
/// jadi tidak butuh asset gambar.
class _ScenePainter extends CustomPainter {
  final bool night;
  _ScenePainter({required this.night});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final rect = Offset.zero & size;

    // Langit
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: night
              ? const [Color(0xFF0B1030), Color(0xFF1B2250), Color(0xFF2C2A5A)]
              : const [Color(0xFF7FC4D8), Color(0xFFB9E0D8), Color(0xFFF2E6B8)],
          stops: const [0, 0.5, 0.75],
        ).createShader(rect),
    );

    if (night) {
      final rnd = Random(7);
      final star = Paint()..color = Colors.white.withOpacity(0.8);
      for (var i = 0; i < 60; i++) {
        canvas.drawCircle(
          Offset(rnd.nextDouble() * w, rnd.nextDouble() * h * 0.5),
          rnd.nextDouble() * 1.4 + 0.3,
          star,
        );
      }
      // Bulan sabit
      final c = Offset(w * 0.68, h * 0.2);
      canvas.drawCircle(c, 26, Paint()..color = const Color(0xFFFFE9A8));
      canvas.drawCircle(c.translate(10, -6), 24,
          Paint()..color = const Color(0xFF1B2250));
    } else {
      canvas.drawCircle(Offset(w * 0.55, h * 0.5), 26,
          Paint()..color = const Color(0xFFFFF3B0).withOpacity(0.8));
      // Awan
      final cloud = Paint()..color = Colors.white.withOpacity(0.9);
      for (final o in [Offset(w * 0.25, h * 0.2), Offset(w * 0.8, h * 0.3)]) {
        canvas.drawOval(
            Rect.fromCenter(center: o, width: 110, height: 26), cloud);
        canvas.drawOval(
            Rect.fromCenter(center: o.translate(-14, -10), width: 60, height: 28),
            cloud);
      }
    }

    // Gunung belakang
    final back = Path()
      ..moveTo(0, h * 0.62)
      ..lineTo(w * 0.28, h * 0.42)
      ..lineTo(w * 0.5, h * 0.55)
      ..lineTo(w * 0.72, h * 0.45)
      ..lineTo(w, h * 0.62)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(
        back,
        Paint()
          ..color =
              night ? const Color(0xFF5B4A7A) : const Color(0xFF9E8F8A));

    // Gunung depan
    final front = Path()
      ..moveTo(0, h * 0.7)
      ..lineTo(w * 0.2, h * 0.52)
      ..lineTo(w * 0.42, h * 0.68)
      ..lineTo(w * 0.7, h * 0.56)
      ..lineTo(w, h * 0.7)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(
        front,
        Paint()
          ..color =
              night ? const Color(0xFF2B2650) : const Color(0xFF5E7F6A));

    // Pohon
    final tree = Paint()
      ..color = night ? const Color(0xFF14183A) : const Color(0xFF2F5A45);
    void pine(double x, double base, double th) {
      final p = Path()
        ..moveTo(x, base - th)
        ..lineTo(x - th * 0.28, base)
        ..lineTo(x + th * 0.28, base)
        ..close();
      canvas.drawPath(p, tree);
    }

    for (final x in [0.04, 0.1, 0.16, 0.22]) {
      pine(w * x, h * 0.74, 70 + x * 100);
    }
    for (final x in [0.8, 0.88, 0.95]) {
      pine(w * x, h * 0.74, 80 - (x - 0.8) * 100);
    }

    // Danau / tanah
    canvas.drawRect(
      Rect.fromLTWH(0, h * 0.74, w, h * 0.26),
      Paint()
        ..color = night ? const Color(0xFF10163A) : const Color(0xFF6FA7A0),
    );

    // Tenda (malam)
    if (night) {
      final colors = [Colors.orange, Colors.amber, Colors.deepOrange];
      for (var i = 0; i < 3; i++) {
        final x = w * (0.4 + i * 0.1);
        final t = Path()
          ..moveTo(x, h * 0.74 - 14)
          ..lineTo(x - 14, h * 0.74)
          ..lineTo(x + 14, h * 0.74)
          ..close();
        canvas.drawPath(t, Paint()..color = colors[i]);
      }
    }

    // Gradient gelap di bawah supaya teks terbaca
    canvas.drawRect(
      Rect.fromLTWH(0, h * 0.6, w, h * 0.4),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            const Color(0xFF0E1B33).withOpacity(0.95),
          ],
        ).createShader(Rect.fromLTWH(0, h * 0.6, w, h * 0.4)),
    );
  }

  @override
  bool shouldRepaint(covariant _ScenePainter old) => old.night != night;
}