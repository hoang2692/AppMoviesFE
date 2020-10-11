import 'package:demo/HomePage/movieDetail.dart';
import 'package:demo/modal/movie.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  final List<Movie> images = movieList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        child: CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, index) {
            return Container(
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(MovieDetails.routeName, arguments: {
                    'id': movieList[index].id,
                    'title': movieList[index].title,
                    'imageUrl': movieList[index].imageUrl,
                    'description': movieList[index].description,
                    'rating': movieList[index].rating,
                    'year': movieList[index].year,
                    'duration': movieList[index].duration,
                    'trailer': movieList[index].trailer
                  });
                },
                child: Image.network(
                  images[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 400,
                  width: 500,
                ),
              )),
            );
          },
        ));
  }
}
