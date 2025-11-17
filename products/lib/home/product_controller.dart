import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:products/home/model.dart';

class ProductController extends GetxController {
  ProductModel productModel = ProductModel();

  void getProducts() async {
    var result = await http.get(Uri.parse("https://dummyjson.com/products"));

    if (result.statusCode == 200) {
      print(result.body);

      productModel = ProductModel.fromJson(jsonDecode(result.body));

      print(productModel.total);
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
