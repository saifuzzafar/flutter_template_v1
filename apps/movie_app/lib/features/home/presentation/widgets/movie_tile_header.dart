import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MovieTileHeader extends StatelessWidget {
  final String title;

  MovieTileHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: () => print("tile tapped $title"),
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Icon(
              CupertinoIcons.forward,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
