import 'package:flutter/material.dart';
import 'package:tmbd/Data/Models/movie.dart';

class MovieItem extends StatelessWidget {

  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: GridTile(
        footer: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.black54,
        alignment: Alignment.bottomCenter,
        child: Text(movie.title, 
        style: const TextStyle(height: 1.3,
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        ),
      ),
      child: Container(
        color: Colors.grey,
        child: movie.posterPath.isNotEmpty ?
        FadeInImage.assetNetwork(
          width: double.infinity,
          height: double.infinity,
          placeholder: "assets/Images/animation_lnst6d0b_small.gif", 
          image: movie.posterPath, fit: BoxFit.cover,) : 
          Image.asset("assets/Images/IMG_20230728_015528_279.jpg"),
      ),
      ),
    );
  }
}