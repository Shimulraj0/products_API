import 'package:flutter/material.dart';
import 'package:products/home/model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel data;

  const ProductDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.products![0].title ?? ""),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                data.products![0].images![0],
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Brand
                  Text(
                    data.products![0].title ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.products![0].brand ?? "",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 16),

                  // Price + Rating
                  Row(
                    children: [
                      Text(
                        "\$${data.products![0].price ?? ""}",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${data.products![0].discountPercentage ?? ""}% OFF",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 22,
                          ),
                          Text("${data.products![0].rating ?? ""}"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Availability
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        (data.products![0].stock! > 0)
                            ? "In Stock"
                            : "Out of Stock",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.products![0].description ?? "",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),

                  const SizedBox(height: 20),

                  // Shipping
                  const Text(
                    "Shipping Information",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(data.products![0].shippingInformation ?? ""),

                  const SizedBox(height: 20),

                  // Warranty
                  const Text(
                    "Warranty",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(data.products![0].warrantyInformation ?? ""),

                  const SizedBox(height: 20),

                  // QR Code
                  const Text(
                    "QR Code",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    data.products![0].meta?.qrCode ?? "",
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  // Reviews
                  const Text(
                    "Reviews",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  Column(
                    children: List.generate(data.products![0].reviews!.length, (
                      index,
                    ) {
                      var r = data.products![0].reviews![index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(width: 8),
                                Text(
                                  r.reviewerName ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
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
                                    Text("${r.rating ?? ""}"),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(r.comment ?? ""),
                          ],
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
