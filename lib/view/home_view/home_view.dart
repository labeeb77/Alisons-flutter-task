import 'package:alisons_flutter_test/controller/product_controller.dart';
import 'package:alisons_flutter_test/services/api_services.dart';
import 'package:alisons_flutter_test/widgets/additional_section.dart';
import 'package:alisons_flutter_test/widgets/flash_sale_and_best.dart';
import 'package:alisons_flutter_test/widgets/new_arrival_section.dart';
import 'package:alisons_flutter_test/widgets/top_accessaries_picks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class HomeView extends StatelessWidget {
  final ProductController productController =
      Get.put(ProductController(ApiServices()));
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 90,
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/Logo 2.png',
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Vector (4).svg",
                height: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Vector (5).svg",
                height: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Group (1).svg",
                height: 24,
              ),
              onPressed: () {},
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Obx(
          () {
            if (productController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        'https://swan.alisonsnewdemo.online/images/product/1696583677A53FAWzwjfJ0WhmpRtWP7T4znCiZENZf0b5JQUXw.webp',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LIU JO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                              ),
                              child: const Text('Shop Now'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Our Brands',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('View All'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: productController.products
                                .asMap()
                                .entries
                                .where(
                                    (entry) => [4, 6, 7, 9].contains(entry.key))
                                .map((entry) {
                              final product = entry.value;
                              final imageUrl =
                                  'https://swan.alisonsnewdemo.online/images/product/${product.image}';

                              print(imageUrl);
                              return _buildBrandCard(
                                  product.manufacturer, imageUrl);
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Suggested For You',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('View All'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productController.products.length,
                            itemBuilder: (context, index) {
                              if ([4, 6, 7, 9].contains(index)) {
                                final product =
                                    productController.products[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 8.0),
                                  child: _buildProductCard2(
                                    product.name,
                                    '${product.symbolLeft} ${product.price}',
                                    'https://swan.alisonsnewdemo.online/images/product/${product.image}',
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const NewArrivalsSection(),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 8.0),
                                child: _buildProductCard2(
                                    'Furla 1927 L Tote',
                                    'OMR 75.000',
                                    "https://swan.alisonsnewdemo.online/images/banner/1695716382_1_sH4k9mEPpOeGBInBvUUc9G2X3tXUhPE41ZH3Vp5B.webp"),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AdditionalSections(),
                        const SizedBox(height: 20),
                        const FlashSaleAndBestOfSwan(),
                        const SizedBox(height: 20),
                        const TopAccessoriesAndBestPicks(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget _buildBrandCard(String brandName, String imageUrl) {
    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                );
              },
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
            ),
            Center(
              child: Text(
                brandName,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard2(String brandName, String price, String imageUrl) {
    return Container(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
