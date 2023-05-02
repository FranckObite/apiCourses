import 'package:api_application/services/api_service.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class DataRepository with ChangeNotifier {
  final APIService apiService = APIService();
  final List<Movie> _popularMovieList = [];
  int _popularMoviePage = 1;

  //creation des getters

  List<Movie> get popularMovieList => _popularMovieList;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies =
          await apiService.getPopularMovies(pageNumber: _popularMoviePage);
      _popularMovieList.addAll(movies);
      _popularMoviePage++;
    } catch (e) {}
  }
}
