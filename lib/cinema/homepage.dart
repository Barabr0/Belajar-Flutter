import 'package:flutter/material.dart';
import 'package:throught_1/data/data.dart';
import 'package:throught_1/cinema/detailpage.dart';

// Halaman 1: daftar film
class CinemaHomePage extends StatefulWidget {
  const CinemaHomePage({super.key});

  @override
  State<CinemaHomePage> createState() => _CinemaHomePageState();
}

class _CinemaHomePageState extends State<CinemaHomePage> {
  final PageController _controller = PageController(viewportFraction: 0.5, initialPage: 1);
  int _current = 1;
  int _navIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,   
    titleSpacing: 24,     
    toolbarHeight: 48,    
    title: const Text(
      'MyCinema',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kRed,
      ),
    ),
  ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            _searchBar(),
            _sectionTitle('Category', withSeeAll: true),
            _categoryRow(),
            _sectionTitle('Showing this month'),
            Expanded(child: _carousel()),
            _dots(),
            const SizedBox(height: 12),
            _bottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello Amanda!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Let\'s explore your favorite movies',
                    style: TextStyle(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kRed,
              border: Border.all(color: Colors.white24, width: 2),
            ),
            child: const Icon(Icons.person, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kBorder),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.white70),
            SizedBox(width: 12),
            Expanded(
              child: Text('Search movie',
                  style: TextStyle(color: Colors.white38, fontSize: 13)),
            ),
            Icon(Icons.mic_none, color: Colors.white30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text, {bool withSeeAll = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      child: Row(
        children: [
          Expanded(
            child: Text(text,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          if (withSeeAll)
            const Text('See all  ›',
                style: TextStyle(fontSize: 10, color: kRed)),
        ],
      ),
    );
  }

  Widget _categoryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((c) {
          return Column(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kCard,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kBorder),
                ),
                child: Text(c['emoji']!, style: const TextStyle(fontSize: 26)),
              ),
              const SizedBox(height: 6),
              Text(c['name']!,
                  style: const TextStyle(fontSize: 10, color: Colors.white70)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _carousel() {
    return PageView.builder(
      controller: _controller,
      itemCount: movies.length,
      onPageChanged: (i) => setState(() => _current = i),
      itemBuilder: (context, i) {
        final bool active = i == _current;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: active ? 4 : 28),
          child: GestureDetector(
            onTap: () {
              if (active) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailPage(movie: movies[i])),
                );
              } else {
                _controller.animateToPage(i,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut);
              }
            },
            child: posterBox(movies[i], radius: 12),
          ),
        );
      },
    );
  }

  Widget _dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(movies.length, (i) {
        final bool active = i == _current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
          width: active ? 18 : 5,
          height: 5,
          decoration: BoxDecoration(
            color: active ? kRed : Colors.white24,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  Widget _bottomNav() {
    const icons = [
      Icons.home_filled,
      Icons.explore_outlined,
      Icons.confirmation_number_outlined,
      Icons.person_outline,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(icons.length, (i) {
        final bool active = i == _navIndex;
        return GestureDetector(
          onTap: () => setState(() => _navIndex = i),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: active ? kCard : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icons[i], color: active ? kRed : Colors.white38),
          ),
        );
      }),
    );
  }
}