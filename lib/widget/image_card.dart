import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String img;
  const ImageCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 166.67*0.75, height: 250 * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(image: NetworkImage(img),fit: BoxFit.fill),
            ),
          ),
          Positioned(
          top: 6,left: 6,
          child: Image.asset("assets/netflix/netflixN.png",height: 18,)),
        ],
      ),
    );
  }
}
