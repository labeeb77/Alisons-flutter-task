import 'package:flutter/material.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNewArrivalsHeader(),
        _buildProductGrid(),
        const SizedBox(height: 16),
        _buildViewAllButton(),
        const SizedBox(height: 16),
        _buildSummerColorsBanner(),
      ],
    );
  }

  Widget _buildNewArrivalsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.purple[800],
      child: const Center(
        child: Text(
          'New arrivals ✦ New arrivals ✦ New arrivals ✦',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: _buildProductCard(
                  'Furla Diamante',
                  'OMR 75.000',
                  'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg',
                  isLarge: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildProductCard(
                      'Max & Co Smart Look',
                      'OMR 75.000',
                      'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg',
                    ),
                    const SizedBox(height: 8),
                    _buildProductCard(
                      'Furla Sunglass',
                      'OMR 75.000',
                      'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildProductCard(
            'Pennyblack Brown Black',
            'OMR 75.000',
            'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String price, String imageNetwork, {bool isLarge = false}) {
    return Container(
      height: isLarge ? 300 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageNetwork),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton() {
    return TextButton(
      onPressed: () {
        // Handle view all action
      },
      child: const Text('View All'),
    );
  }

  Widget _buildSummerColorsBanner() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUMMER COLORS OF FURAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Float in Lightweight Summer Fits',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}