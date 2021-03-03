import 'package:flutter/material.dart';

class GenreInfomation extends StatelessWidget {
  final String text;
  final Icon icon;
  final EdgeInsetsGeometry padding;

  GenreInfomation({@required this.text, this.icon,this.padding});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: padding,
          child: icon,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
