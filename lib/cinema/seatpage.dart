import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:throught_1/data/data.dart';

// Halaman 3: pilih jadwal, pilih kursi, dan bayar
class SeatPage extends StatefulWidget {
  final Map<String, dynamic> movie;
  final int initialTime;
  final String cinema;

  const SeatPage({
    super.key,
    required this.movie,
    required this.cinema,
    this.initialTime = 2,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // Jumlah kursi per baris (bentuk seperti di desain).
  final List<int> _rowSeats = [4, 7, 7, 7, 7, 6];

  // Kursi yang sudah dipesan orang lain, format "baris-kolom".
  final Set<String> _reserved = {
    '0-2', '0-3', '1-1', '1-2', '2-2', '2-3', '2-4', '3-1', '4-5', '4-6', '5-1',
  };

  final Set<String> _selected = {};
  late int _time;

  @override
  void initState() {
    super.initState();
    _time = widget.initialTime;
  }

  void _toggle(String id) {
    if (_reserved.contains(id)) return;
    setState(() {
      if (!_selected.remove(id)) _selected.add(id);
    });
  }

  // Langkah 1: pilih metode pembayaran (QRIS / Cash).
  void _pay() {
    final total = _selected.length * ticketPrice;
    String method = 'QRIS';

    showModalBottomSheet(
      context: context,
      backgroundColor: kCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => StatefulBuilder(
        builder: (ctx, setSheet) {
          Widget option(String name, IconData icon, String desc) {
            final bool active = method == name;
            return GestureDetector(
              onTap: () => setSheet(() => method = name),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: active ? kRed : kBorder, width: active ? 1.5 : 1),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: active ? kRed : Colors.white54),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 2),
                          Text(desc,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.white54)),
                        ],
                      ),
                    ),
                    Icon(
                      active
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: active ? kRed : Colors.white30,
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pilih Pembayaran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  '${widget.movie['title']} • ${_selected.length} kursi • ${formatRp(total)}',
                  style: const TextStyle(fontSize: 12, color: Colors.white60),
                ),
                const SizedBox(height: 18),
                option('QRIS', Icons.qr_code_2, 'Scan kode QR lewat e-wallet / m-banking'),
                option('Cash', Icons.payments_outlined, 'Bayar tunai di kasir bioskop'),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(sheetCtx);
                    _showPaymentResult(method, total);
                  },
                  child: Container(
                    height: 46,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kRed,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Bayar ${formatRp(total)}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Pembayaran cash: input uang diterima, hitung kembalian otomatis.
  void _showCashDialog(int total) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialog) {
          final int paid = int.tryParse(controller.text) ?? 0;
          final int change = paid - total;
          final bool enough = paid >= total;

          Widget info() {
            if (controller.text.isEmpty) {
              return const SizedBox(height: 18);
            }
            return Text(
              enough
                  ? 'Kembalian: ${formatRp(change)}'
                  : 'Uang kurang ${formatRp(total - paid)}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: enough ? Colors.greenAccent : Colors.redAccent,
              ),
            );
          }

          return AlertDialog(
            backgroundColor: kCard,
            title: const Text('Pembayaran Cash'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.movie['title']} • ${_selected.length} kursi',
                      style: const TextStyle(fontSize: 12, color: Colors.white60)),
                  const SizedBox(height: 12),
                  Text('Total bayar: ${formatRp(total)}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 14),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (_) => setDialog(() {}),
                    decoration: InputDecoration(
                      labelText: 'Uang diterima',
                      prefixText: 'Rp ',
                      filled: true,
                      fillColor: kBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kRed),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        controller.text = '$total';
                        setDialog(() {});
                      },
                      child: const Text('Uang pas',
                          style: TextStyle(color: kRed, fontSize: 12)),
                    ),
                  ),
                  info(),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Batal',
                    style: TextStyle(color: Colors.white60)),
              ),
              TextButton(
                onPressed: enough
                    ? () {
                        Navigator.of(ctx).pop();
                        _showCashReceipt(total, paid, change);
                      }
                    : null,
                child: Text('Bayar',
                    style: TextStyle(color: enough ? kRed : Colors.white24)),
              ),
            ],
          );
        },
      ),
    ).then((_) => controller.dispose());
  }

  // Struk pembayaran cash.
  void _showCashReceipt(int total, int paid, int change) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: kCard,
        title: const Text('Pembayaran Berhasil'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.movie['title']}\n'
              '${widget.cinema}\n'
              'Jam ${showTimes[_time]}\n'
              'Kursi: ${_selected.length} • Metode: Cash',
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
            const Divider(height: 24, color: kBorder),
            _receiptRow('Total', formatRp(total)),
            _receiptRow('Uang diterima', formatRp(paid)),
            _receiptRow('Kembalian', formatRp(change), bold: true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).popUntil((r) => r.isFirst);
            },
            child: const Text('Selesai', style: TextStyle(color: kRed)),
          ),
        ],
      ),
    );
  }

  Widget _receiptRow(String label, String value, {bool bold = false}) {
    final style = TextStyle(
      fontSize: 13,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value, style: style)],
      ),
    );
  }

  // Langkah 2: tampilkan instruksi sesuai metode yang dipilih.
  void _showPaymentResult(String method, int total) {
    final bool isQris = method == 'QRIS';
    if (!isQris) {
      _showCashDialog(total);
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: kCard,
        title: Text(isQris ? 'Scan QRIS' : 'Bayar di Kasir'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isQris)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.qr_code_2, size: 150, color: Colors.black),
              )
            else
              const Icon(Icons.payments_outlined, size: 70, color: kRed),
            const SizedBox(height: 14),
            Text(
              isQris
                  ? 'Scan kode di atas untuk membayar ${formatRp(total)}'
                  : 'Tunjukkan pesanan ini ke kasir dan bayar ${formatRp(total)} sebelum film dimulai',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
            const SizedBox(height: 14),
            Text(
              '${widget.movie['title']}\n'
              '${widget.cinema}\n'
              'Jam ${showTimes[_time]}\n'
              'Kursi: ${_selected.length} • Metode: $method',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).popUntil((r) => r.isFirst);
            },
            child: Text(isQris ? 'Sudah Bayar' : 'Selesai',
                style: const TextStyle(color: kRed)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = _selected.length * ticketPrice;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _topBar(),
              Text(widget.movie['title'] as String,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, size: 13, color: kRed),
                  const SizedBox(width: 4),
                  Text(widget.cinema,
                      style: const TextStyle(fontSize: 12, color: Colors.white60)),
                ],
              ),
              const SizedBox(height: 20),
              _timeArc(),
              const SizedBox(height: 30),
              Expanded(child: Center(child: _seatGrid())),
              _legend(),
              const SizedBox(height: 24),
              _buyButton(total),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left, size: 28),
          ),
          const Spacer(),
          const Icon(Icons.crop_free, size: 22),
        ],
      ),
    );
  }

  // Jam tayang tersusun melengkung + garis layar.
  Widget _timeArc() {
    const List<double> xs = [0.0, 0.2, 0.5, 0.8, 1.0];
    const List<double> ys = [48, 20, 0, 20, 48];
    return SizedBox(
      height: 120,
      child: LayoutBuilder(builder: (context, c) {
        return Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _ScreenPainter()),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              child: Center(
                child: Text('SCREEN',
                    style: TextStyle(fontSize: 9, color: Colors.white54)),
              ),
            ),
            for (int i = 0; i < showTimes.length; i++)
              Positioned(
                left: xs[i] * (c.maxWidth - 50),
                top: ys[i],
                child: GestureDetector(
                  onTap: () => setState(() => _time = i),
                  child: Text(
                    showTimes[i],
                    style: TextStyle(
                      fontSize: i == _time ? 16 : 14,
                      fontWeight:
                          i == _time ? FontWeight.bold : FontWeight.normal,
                      color: i == _time ? Colors.white : Colors.white30,
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _seatGrid() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_rowSeats.length, (r) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(_rowSeats[r], (c) {
              final id = '$r-$c';
              final bool reserved = _reserved.contains(id);
              final bool selected = _selected.contains(id);
              Color color = kCard;
              Color border = kBorder;
              if (reserved) {
                color = Colors.white;
                border = Colors.white;
              } else if (selected) {
                color = kRed;
                border = kRed;
              }
              return GestureDetector(
                onTap: () => _toggle(id),
                child: Container(
                  width: 28,
                  height: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: border),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _legend() {
    Widget item(Color dot, String label, {bool outline = false}) {
      return Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: outline ? Colors.transparent : dot,
              border: Border.all(color: outline ? Colors.white24 : dot),
            ),
          ),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(fontSize: 10, color: Colors.white60)),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        item(kCard, 'Available', outline: true),
        item(Colors.white, 'Reserved'),
        item(kRed, 'Selected'),
      ],
    );
  }

  Widget _buyButton(int total) {
    final bool enabled = _selected.isNotEmpty;
    return GestureDetector(
      onTap: enabled ? _pay : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.45,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: kRed,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Center(
                  child: Text('Buy ticket',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                ),
              ),
              Container(width: 1, height: 18, color: Colors.white54),
              Expanded(
                child: Center(
                  child: Text(formatRp(total),
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Garis lengkung layar bioskop.
class _ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [Colors.transparent, Colors.white54, Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(size.width * 0.05, size.height - 22)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height - 62,
        size.width * 0.95,
        size.height - 22,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}