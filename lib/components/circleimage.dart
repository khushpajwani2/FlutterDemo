import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circleImage(String path) {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [Colors.transparent, Colors.transparent],
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: CircleAvatar(
      radius: 45.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(400.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              /// change this to your  image directory
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.darken),
            ),
          ),
        ),
      ),
    ),
  );
}
