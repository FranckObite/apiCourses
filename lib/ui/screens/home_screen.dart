import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/movie.dart';
import '../../services/api_service.dart';
import '../../utils/constante.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? movies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  void getMovies() {
    APIService().getPopularMovies(pageNumber: 1).then((movielist) {
      setState(() {
        movies = movielist;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: Image.asset("assets/images/n.png"),
        backgroundColor: kBackgroundColor,
      ),
      body: ListView(
        children: [
          Container(
            height: 650,
            color: kPrimaryColor,
            child: movies == null
                ? const Center()
                : Image.network(
                    movies![0].posterUrl(),
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Tendances actuelles",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 110,
                  //color: Colors.yellow,
                  child: movies == null
                      ? Center(
                          child: Text(index.toString()),
                        )
                      : Image.network(movies![index].posterUrl(),
                          fit: BoxFit.cover),
                );
              },
              itemCount: 10,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Actuellement au cinema",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 220,
                  color: Colors.blue,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Ils arrivent bientôt",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 110,
                  color: Colors.green,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
