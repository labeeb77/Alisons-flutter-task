import 'package:flutter/material.dart';
import 'dart:async';

class FlashSaleAndBestOfSwan extends StatefulWidget {
  const FlashSaleAndBestOfSwan({super.key});

  @override
  _FlashSaleAndBestOfSwanState createState() => _FlashSaleAndBestOfSwanState();
}

class _FlashSaleAndBestOfSwanState extends State<FlashSaleAndBestOfSwan> {
  int _hours = 0;
  int _minutes = 12;
  int _seconds = 37;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else if (_minutes > 0) {
          _minutes--;
          _seconds = 59;
        } else if (_hours > 0) {
          _hours--;
          _minutes = 59;
          _seconds = 59;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFlashSaleSection(),
        const SizedBox(height: 20),
        _buildBestOfSwanSection(),
      ],
    );
  }

  Widget _buildFlashSaleSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'FLASH',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Icon(Icons.flash_on, color: Colors.yellow[700], size: 30),
              const Text(
                'SALE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Discounted Price Valid Only For',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildTimerBox(_hours.toString().padLeft(2, '0')),
              const SizedBox(width: 4),
              _buildTimerBox(_minutes.toString().padLeft(2, '0')),
              const SizedBox(width: 4),
              _buildTimerBox(_seconds.toString().padLeft(2, '0')),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFlashSaleItem('WINTER FIT', 'OMR 76.000', '50% OFF', 'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg'),
                _buildFlashSaleItem('WINTER FIT', 'OMR 76.000', '50% OFF', 'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg'),
                _buildFlashSaleItem('FLASH SALE', 'OMR 76.000', '50% OFF', 'https://swan.alisonsnewdemo.online/images/category/1695626477.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        value,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildFlashSaleItem(String title, String price, String discount, String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(imageUrl, height: 150, width: 120, fit: BoxFit.cover),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildBestOfSwanSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Best of Swan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: NetworkImage('https://swan.alisonsnewdemo.online/images/category/1695626477.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SHORTS SEASON IS HERE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Stay Cool and Comfortable',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: List.generate(
                        4,
                        (index) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0 ? Colors.white : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}