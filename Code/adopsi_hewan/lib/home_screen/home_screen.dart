import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import './components/body.dart';
import '../drawer/drawerscreen.dart';
import '../profile_screen/profile_screen.dart';

class Home_screen extends StatefulWidget {
  Home_screen({Key key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
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

  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7469030649420320~3171622899');
    _interstitialAd = createInterstitialAd()..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              onPressed: () {
                _bannerAd?.dispose();
                _bannerAd = null;
                _interstitialAd?.show();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Profile_screen()),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawerscreen(),
      body: Body(),
    );
  }
}
