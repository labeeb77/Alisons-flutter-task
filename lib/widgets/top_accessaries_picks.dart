import 'package:flutter/material.dart';

class TopAccessoriesAndBestPicks extends StatelessWidget {
  const TopAccessoriesAndBestPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopAccessoriesSection(),
        const SizedBox(height: 20),
        _buildOurBestPicksSection(),
      ],
    );
  }

  Widget _buildTopAccessoriesSection() {
    final accessories = [
      {'name': 'Handbags', 'image': 'https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp'},
      {'name': 'Wallets', 'image': 'https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp'},
      {'name': 'Boots', 'image': 'https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp'},
      {'name': 'Watches', 'image': 'https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp'},
      {'name': 'Sunglasses', 'image': 'https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp'},
      {'name': 'Belts', 'image': 'https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Accessories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View All'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: accessories.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return _buildAccessoryCard(
              accessories[index]['name']!,
              accessories[index]['image']!,
            );
          },
        ),
      ],
    );
  }

  Widget _buildAccessoryCard(String name, String imageUrl) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOurBestPicksSection() {
    final List<Map<String, dynamic>> bestPicks = [
      {
        'brand': 'MAX&Co',
        'title': 'THE SUIT IS A MEASURE OF ELEGANCE',
        'subtitle': 'Your Favorites At Unbelievable Prices',
        'image': 'https://example.com/maxco_suit.jpg',
        'color': const Color(0xFFD2B48C),
      },
      {
        'brand': 'PENNYBLACK',
        'title': 'SPECIAL ELEGANCE FROM BANI BLACK',
        'subtitle': 'Your Favorites At Unbelievable Prices',
        'image': 'https://example.com/pennyblack_elegance.jpg',
        'color': const Color(0xFFF5F5F5),
      },
      {
        'brand': 'FURLA',
        'title': 'WHEN THE BEST THING COME IN SETS OF TWO',
        'subtitle': 'Your Favorites At Unbelievable Prices',
        'image': 'https://example.com/furla_sets.jpg',
        'color': const Color(0xFF006400),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Our Best Picks',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bestPicks.length,
          itemBuilder: (context, index) {
            final pick = bestPicks[index];
            return _buildBestPickCard(
              brand: pick['brand'] as String,
              title: pick['title'] as String,
              subtitle: pick['subtitle'] as String,
              imageUrl: pick['image'] as String,
              backgroundColor: pick['color'] as Color,
            );
          },
        ),
      ],
    );
  }

  Widget _buildBestPickCard({
    required String brand,
    required String title,
    required String subtitle,
    required String imageUrl,
    required Color backgroundColor,
  }) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 150,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  brand,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: backgroundColor.computeLuminance() > 0.5 ? Colors.black54 : Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}