import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:produk_barang/model/model_barang.dart';

class PageListBarang extends StatefulWidget {
  const PageListBarang({super.key});

  @override
  State<PageListBarang> createState() => _PageListBarangState();
}

class _PageListBarangState extends State<PageListBarang> {

  bool isLoading = false;
  List<ModelProduk> listUser = [];

  Future getDataProduk() async{
    try{
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.get(Uri.parse('https://mobile-roni.000webhostapp.com/api_2b/index.php?folder=home&file=produk'));
      var data = jsonDecode(res.body);
      setState(() {
        for(Map<String, dynamic> i in data){
          listUser.add(ModelProduk.fromJson(i));
        }
      });

    }catch (e){
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataProduk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data User from Api"),
        backgroundColor: Colors.deepOrangeAccent,
      ),

      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          ModelProduk category = listUser[index]elementAt(index);
          List<dynamic> productList = listUser[category];
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
