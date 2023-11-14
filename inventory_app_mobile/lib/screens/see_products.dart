import 'package:flutter/material.dart';
import 'package:inventory_app_mobile/models/product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;

  const ProductListPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text('Harga: ${products[index].price}\nDeskripsi: ${products[index].description}'),
            ),
          );
        },
      ),
    );
  }
}