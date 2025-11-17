import 'package:flutter/material.dart';
import 'package:products/home/product_controller.dart';
import 'package:get/get.dart';
import 'package:products/home/product_detailscreen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(title: const Text("Products"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => ProductDetailsScreen(data: data),
              //   ),
              // );

              Get.to(
                ProductDetailsScreen(data: productController.productModel),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      // data["thumbnail"],
                      productController.productModel.products![0].thumbnail ??
                          "",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Product Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // data["title"],
                          productController.productModel.products![0].title ??
                              "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          // data["brand"],
                          productController.productModel.products![0].brand ??
                              "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Text(
                              "\$${productController.productModel.products![0].price ?? ""}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),

                            const Spacer(),

                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 18,
                                ),
                                Text(
                                  "${productController.productModel.products![0].rating ?? ""}",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
