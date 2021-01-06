import 'package:flutter/material.dart';
import 'package:adopsi_hewan/model/Hewan.dart';

class Hewan_card extends StatelessWidget {
  final Hewan hewan;
  final Function press;
  const Hewan_card({Key key, this.hewan, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // radius of 10
        color: Colors.white, // green as background color
      ),
      child: Column(
        children: [
          Divider(
            color: hewan.id != 0 ? Colors.black45 : Colors.transparent,
          ),
          GestureDetector(
            onTap: press,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        hewan.image,
                        width: 60,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hewan.name,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("Rp ${hewan.price}")
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
