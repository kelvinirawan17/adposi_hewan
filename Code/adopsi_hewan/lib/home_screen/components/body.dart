import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import './hewan_card.dart';
import 'package:adopsi_hewan/detail_screen/detail_screen.dart';
import '../../model/Hewan.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  Future<List<Hewan>> myHewan;

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      targetingInfo: targetingInfo,
      adUnitId: InterstitialAd.testAdUnitId,
      listener: (MobileAdEvent event) {
        print('interstitial event: $event');
      },
    );
  }

  BannerAd createBannerAdd() {
    return BannerAd(
      targetingInfo: targetingInfo,
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      listener: (MobileAdEvent event) {
        print('Banner Event: $event');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    myHewan = fetchHewan();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7469030649420320~3171622899');
    _bannerAd = createBannerAdd()..load();
    _interstitialAd = createInterstitialAd()..load();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () {
        _bannerAd?.show();
      },
    );
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
  final response =
      await http.get('http://192.168.40.110/adopsi_hewan/hewan.php');
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  return parsed.map<Hewan>((json) => Hewan.fromJson(json)).toList();
}
