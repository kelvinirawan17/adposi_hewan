class Hewan {
  final String image, name, description;
  final String id;
  final String price;

  Hewan(
    this.image,
    this.name,
    this.description,
    this.price,
    this.id,
  );

  Hewan.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        name = json['name'],
        description = json['description'],
        id = json['id'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'image': image,
        'name': name,
        'description': description,
        'id': id,
        'price': price,
      };
}

// import 'package:flutter/material.dart';

// class Hewan {
//   final String image, name, description;
//   final int id;
//   final double price;
//   final Color bgcolor;

//   Hewan({
//     this.image,
//     this.name,
//     this.description,
//     this.price,
//     this.id,
//     this.bgcolor,
//   });
// }

// List<Hewan> hewanList = [
//   Hewan(
//     id: 0,
//     name: 'Persia Medium',
//     description:
//         'Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga',
//     price: 400000,
//     image: 'assets/images/adopt.png',
//     bgcolor: Color(0xFFCE9034),
//   ),
//   Hewan(
//     id: 1,
//     name: 'Mix Dom',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 400000,
//     image: 'assets/images/deal.png',
//     bgcolor: Color(0xFF3D82AE),
//   ),
//   Hewan(
//     id: 2,
//     name: 'Anggora Longhair',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 400000,
//     image: 'assets/images/adopt.png',
//     bgcolor: Color(0xFF3D6356),
//   ),
//   Hewan(
//     id: 3,
//     name: 'Persia Medium',
//     description:
//         'Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga',
//     price: 500000,
//     image: 'assets/images/deal.png',
//     bgcolor: Color(0xFFC980F2),
//   ),
//   Hewan(
//     id: 4,
//     name: 'Lokal',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 500000,
//     image: 'assets/images/adopt.png',
//     bgcolor: Color(0xFFDB657F),
//   ),
//   Hewan(
//     id: 5,
//     name: 'Mix Dom',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 500000,
//     image: 'assets/images/deal.png',
//     bgcolor: Color(0xFFC1E394),
//   ),
//   Hewan(
//     id: 6,
//     name: 'Anggora Mix',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 500000,
//     image: 'assets/images/deal.png',
//     bgcolor: Color(0xFFC1E394),
//   ),
//   Hewan(
//     id: 7,
//     name: 'Persia Mix',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 600000,
//     image: 'assets/images/deal.png',
//     bgcolor: Color(0xFFC1E394),
//   ),
//   Hewan(
//     id: 8,
//     name: 'Lokal',
//     description:
//         "Kucing ini memiliki sifat yang agak sensitif ketika sedang makan, disaran kan untuk memberi makanan yang dijual pada petshop, dan sering diberikan vaksinasi agar terjaga",
//     price: 600000,
//     image: 'assets/images/deal.png',
//     bgcolor: Color(0xFFC1E394),
//   ),
// ];
