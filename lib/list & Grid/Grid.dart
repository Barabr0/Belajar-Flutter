import 'package:flutter/material.dart';

class GridProductPage extends StatelessWidget {
  const GridProductPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Merch 1',
      'price': 'Rp 250.000',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3CxKbI8kGMOlKPbZ55eFpmdGbQj_as8KxcAFbTQ2xVA&s=10',
    },
    {
      'name': 'Merch 2',
      'price': 'Rp 300.000',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqqX3XEbmlbrjPZUiEGr276Ax7l-Gxgcqfzo9zC5fKIw&s=10',
    },
    {
      'name': 'Merch 3',
      'price': 'Rp 350.000',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlISKks_dUsF4G2vJSx5srrHPnuYkA_efHaK9VZNUChg&s=10',
    },
    {
      'name': 'Merch 4',
      'price': 'Rp 400.000',
      'image': 'https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/a0ee975792b542a0bf033458001ad436~tplv-aphluv4xwc-resize-jpeg:700:0.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product['price']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}