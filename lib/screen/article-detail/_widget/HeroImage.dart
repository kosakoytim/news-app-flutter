import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String thumbnail;

  HeroImage({ @required this.thumbnail });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(thumbnail),
      fit: BoxFit.contain,
    );
  }
}