import 'package:flutter/material.dart';
import 'package:adopsi_hewan/model/Hewan.dart';
import './components/body.dart';

class Detail_screen extends StatelessWidget {
  final Hewan hewan;
  const Detail_screen({Key key, this.hewan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCE9034),
      appBar: AppBar(
        backgroundColor: Color(0xFFCE9034),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Body(hewan: hewan),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.pop(context),
          print('Added ' + hewan.name + ' to cart.'),
        },
        label: Text('Pesan (Rp ' + hewan.price.toString() + ')'),
        backgroundColor: Color(0xFFCE9034),
      ),
    );
  }
}
