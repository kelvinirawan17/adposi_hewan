import 'dart:convert';

import 'package:flutter/material.dart';
import './hewan_card.dart';
import 'package:adopsi_hewan/detail_screen/detail_screen.dart';
import '../../model/Hewan.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  Future<List<Hewan>> myHewan;

  @override
  void initState() {
    super.initState();
    myHewan = fetchHewan();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      color: Colors.teal[800],
      child: FutureBuilder<List<Hewan>>(
        future: myHewan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cari dan temukan',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Categories(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Hewan_card(
                        hewan: snapshot.data[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail_screen(
                              hewan: snapshot.data[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'Kucing',
    'Anjing',
    'Burung',
    'Ikan',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    selectedIndex == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: selectedIndex == index ? Colors.black : Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<List<Hewan>> fetchHewan() async {
  final response = await http.get('http://10.0.2.2/adopsi_hewan/hewan.php');
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  return parsed.map<Hewan>((json) => Hewan.fromJson(json)).toList();
}
