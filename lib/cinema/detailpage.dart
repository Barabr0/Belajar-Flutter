import 'package:flutter/material.dart';
import 'package:throught_1/data/data.dart';
import 'package:throught_1/cinema/seatpage.dart';

// Halaman 2: detail film + jadwal tayang
class DetailPage extends StatefulWidget {
  final Map<String, dynamic> movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedTime = 2; // default 19:30
  int _selectedCinema = 0; // default bioskop pertama

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              _topBar(),
              const SizedBox(height: 20),
              SizedBox(
                height: 240,
                child: Row(
                  children: [
                    Expanded(child: posterBox(movie, radius: 14)),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoBox(Icons.movie_filter_outlined, 'Genre',
                            movie['genre'] as String),
                        _infoBox(Icons.access_time, 'Duration',
                            movie['duration'] as String),
                        _infoBox(Icons.star, 'Rating', movie['rating'] as String),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(movie['title'] as String,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Divider(color: kBorder),
              const SizedBox(height: 6),
              const Text('Sypnosis',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                movie['synopsis'] as String,
                style: const TextStyle(
                    fontSize: 12, height: 1.6, color: Colors.white60),
              ),
              const SizedBox(height: 16),
              const Text('Pilih Bioskop',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _cinemaList(),
              const SizedBox(height: 14),
              const Text('Jadwal Tayang',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _timeChips(),
              const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _redButton(
                label: 'Get Reservation',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeatPage(
                        movie: movie,
                        initialTime: _selectedTime,
                        cinema: cinemas[_selectedCinema]['name']!,
                      ),
                    ),
                  );
                },
              ),
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.chevron_left, size: 28),
            ),
          ),
          const Text('Movie Detail',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _infoBox(IconData icon, String label, String value) {
    return Container(
      width: 75,
      height: 70,
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(fontSize: 8, color: Colors.white54)),
          Text(value,
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _cinemaList() {
    return SizedBox(
      height: 58,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cinemas.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final bool selected = i == _selectedCinema;
          return GestureDetector(
            onTap: () => setState(() => _selectedCinema = i),
            child: Container(
              width: 170,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: selected ? kRed : kBorder, width: selected ? 1.5 : 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on,
                      size: 18, color: selected ? kRed : Colors.white38),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cinemas[i]['name']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 3),
                        Text(cinemas[i]['location']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _timeChips() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: showTimes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final bool selected = i == _selectedTime;
          return GestureDetector(
            onTap: () => setState(() => _selectedTime = i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? kRed : kCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: selected ? kRed : kBorder),
              ),
              child: Text(showTimes[i],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600)),
            ),
          );
        },
      ),
    );
  }

  Widget _redButton({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kRed,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}