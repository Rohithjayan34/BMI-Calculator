import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour,this.cardChild});
  final Widget cardChild;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(15.0),
        color:colour,
      ),

    );
  }
}