import 'dart:convert';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import 'package:http/http.dart' as http;
import '../model/Profile.dart';

class Profile_screen extends StatefulWidget {
  @override
  _Profile_screen createState() => _Profile_screen();
}

class _Profile_screen extends State<Profile_screen> {
  Future<Profile> myProfile;
  BannerAd _bannerAd;
  @override
  void initState() {
    super.initState();
    myProfile = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    _bannerAd = null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.teal[800],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home_screen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.teal[800],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: FutureBuilder<Profile>(
          future: myProfile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.teal[800],
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Nama Lengkap",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: snapshot.data.name,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Username",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: snapshot.data.username,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: snapshot.data.email,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_screen()),
                            );
                          },
                          child: Text(
                            "BATAL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_screen()),
                            );
                          },
                          color: Colors.teal[800],
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "SIMPAN",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Profile> fetchProfile() async {
  final response =
      await http.get('http://192.168.40.110/adopsi_hewan/profile.php');
  return Profile.fromJson(jsonDecode(response.body));
}
