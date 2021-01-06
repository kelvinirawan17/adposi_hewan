import 'package:flutter/material.dart';
import 'package:adopsi_hewan/model/Hewan.dart';
import './main.dart';

class Body extends StatelessWidget {
  final Hewan hewan;
  const Body({Key key, this.hewan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.2,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(hewan.description),
                    ],
                  ),
                ),
                Main(hewan: hewan),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
