// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd/Buisness/Bloc/movies_bloc.dart';
import 'package:tmbd/Presentation/Screens/movie_details.dart';
import 'package:tmbd/Presentation/Widgets/movie_item.dart';
import 'package:tmbd/Data/Models/movie.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late List<Movie> allMovies;

  @override
  void initState() {
    super.initState();
        BlocProvider.of<MoviesBloc>(context).getAllMovies();
    //Ui asked cubit to send data and blocProvider works to make created bloc works
    //bloc take data from repository & Repository take data from web services and Web take data from dio
  }

  Widget buildBlocWidget(){
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          allMovies = (state).movies;
          return buildLoadedListWidgets();
        } else{
        return showLoadingIndicators();
        }
      },
    );
  }

  Widget showLoadingIndicators(){
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.amber,
      ),
    );
  }
  
  Widget buildLoadedListWidgets(){
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10, 
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MovieDetails()),
              );
            },
          );
        },
        options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 3)),
            ),
    );
  }
  
  Widget buildCharactersList(){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
      ), 
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allMovies.length,
      itemBuilder: (context, index){
        return MovieItem(movie: allMovies[index],);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Movies",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
