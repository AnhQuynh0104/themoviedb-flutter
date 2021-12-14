import 'package:flutter/material.dart';

class ImageMovie extends StatelessWidget {
  const ImageMovie({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: size.height / 5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/hawyeke_bg.jpg"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Positioned(
            top: 12,
            left: 5,
            child: Container(
              width: size.width / 4,
              height: size.height / 6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/hawkeye.jpg")
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
            )
        )
      ],
    );
  }
}
