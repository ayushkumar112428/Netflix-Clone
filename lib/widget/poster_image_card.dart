import 'package:flutter/material.dart';

class PosterImageCard extends StatelessWidget {
  final String posterImage;
  const PosterImageCard({super.key, required this.posterImage});

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: wSize * 0.3,
          height: wSize * 0.562 * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: NetworkImage(posterImage)),
          ),
        ),
        Positioned(
          top: 6,left: 6,
          child: Image.asset("assets/netflix/netflixN.png",height: 12,)),
      ],
    );
  }
}
