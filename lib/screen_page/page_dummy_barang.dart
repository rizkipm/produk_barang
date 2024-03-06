import 'package:flutter/material.dart';

class Product {
  final String image;
  final String nama;
  final String deskripsi;
  final String harga;
  final String seller;
  final String rating;
  final String terjual;
  final String lokasi;

  Product({
    required this.image,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.seller,
    required this.rating,
    required this.terjual,
    required this.lokasi,
  });
}

class ProductListScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  ProductListScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          String category = data.keys.elementAt(index);
          List<dynamic> productList = data[category];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> productData = productList[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(productData['image']),
                      title: Text(productData['nama']),
                      subtitle: Text(productData['deskripsi']),
                      trailing: Text('Rp ${productData['harga']}'),
                      onTap: () {
                        // Handle product tap
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductListScreen(
      data: {
        'Xiaomi': [
          {
            'image': 'https://...',
            'nama': 'Xiaomi Phone 1',
            'deskripsi': 'Description...',
            'harga': '1000000',
            'seller': 'Seller A',
            'rating': '4.5',
            'terjual': '50',
            'lokasi': 'Location A',
          },
          // Other Xiaomi products
        ],
        'Samsung': [
          {
            'image': 'https://...',
            'nama': 'Samsung Phone 1',
            'deskripsi': 'Description...',
            'harga': '1500000',
            'seller': 'Seller B',
            'rating': '4.3',
            'terjual': '60',
            'lokasi': 'Location B',
          },
          // Other Samsung products
        ],
        // Other categories and products
      },
    ),
  ));
}