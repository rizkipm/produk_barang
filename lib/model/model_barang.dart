// To parse this JSON data, do
//
//     final modelProduk = modelProdukFromJson(jsonString);

import 'dart:convert';

ModelProduk modelProdukFromJson(String str) => ModelProduk.fromJson(json.decode(str));

String modelProdukToJson(ModelProduk data) => json.encode(data.toJson());

class ModelProduk {
  int success;
  String message;
  List<ListOppoElement> listXiaomi;
  List<ListOppoElement> listSamsung;
  List<ListOppoElement> listOppo;
  List<ListOppoElement> listVivo;

  ModelProduk({
    required this.success,
    required this.message,
    required this.listXiaomi,
    required this.listSamsung,
    required this.listOppo,
    required this.listVivo,
  });

  factory ModelProduk.fromJson(Map<String, dynamic> json) => ModelProduk(
    success: json["success"],
    message: json["message"],
    listXiaomi: List<ListOppoElement>.from(json["list_xiaomi"].map((x) => ListOppoElement.fromJson(x))),
    listSamsung: List<ListOppoElement>.from(json["list_samsung"].map((x) => ListOppoElement.fromJson(x))),
    listOppo: List<ListOppoElement>.from(json["list_oppo"].map((x) => ListOppoElement.fromJson(x))),
    listVivo: List<ListOppoElement>.from(json["list_vivo"].map((x) => ListOppoElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "list_xiaomi": List<dynamic>.from(listXiaomi.map((x) => x.toJson())),
    "list_samsung": List<dynamic>.from(listSamsung.map((x) => x.toJson())),
    "list_oppo": List<dynamic>.from(listOppo.map((x) => x.toJson())),
    "list_vivo": List<dynamic>.from(listVivo.map((x) => x.toJson())),
  };
}

class ListOppoElement {
  String image;
  String nama;
  String deskripsi;
  String harga;
  String seller;
  String rating;
  String terjual;
  Lokasi lokasi;

  ListOppoElement({
    required this.image,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.seller,
    required this.rating,
    required this.terjual,
    required this.lokasi,
  });

  factory ListOppoElement.fromJson(Map<String, dynamic> json) => ListOppoElement(
    image: json["image"],
    nama: json["nama"],
    deskripsi: json["deskripsi"],
    harga: json["harga"],
    seller: json["seller"],
    rating: json["rating"],
    terjual: json["terjual"],
    lokasi: lokasiValues.map[json["lokasi"]]!,
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "nama": nama,
    "deskripsi": deskripsi,
    "harga": harga,
    "seller": seller,
    "rating": rating,
    "terjual": terjual,
    "lokasi": lokasiValues.reverse[lokasi],
  };
}

enum Lokasi {
  PADANG
}

final lokasiValues = EnumValues({
  "Padang": Lokasi.PADANG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
