import 'package:flutter/material.dart';
import 'package:nomad_flutter_final_challenge/models/coming_movie_mode.dart';
import 'package:nomad_flutter_final_challenge/models/movie_model.dart';
import 'package:nomad_flutter_final_challenge/models/now_movie_model.dart';
import 'package:nomad_flutter_final_challenge/services/api_service.dart';
import 'package:nomad_flutter_final_challenge/widgets/movie_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> movies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowMovies = ApiService.getNowMovies();
  final Future<List<MovieModel>> comingMovies = ApiService.getComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.deepPurple,
        title: Text(
          "AIN MOVIE",
          style: GoogleFonts.eastSeaDokdo(
            fontSize: 40,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFB062FF),
                Color(0xFF629AEF),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: FutureBuilder(
                future: movies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //snapshot.data -> future의 결과값!
                    // return makeList(snapshot);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text('Popular Movies',
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25, fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          child: makeList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 330,
              child: FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //snapshot.data -> future의 결과값!
                    // return makeList(snapshot);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text('Now in Cinemas',
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25, fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          child: makeNowList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 330,
              child: FutureBuilder(
                future: comingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //snapshot.data -> future의 결과값!
                    // return makeList(snapshot);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text('Coming soon',
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25, fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                          child: makeNowList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        //itemBuilder -> 한번에 10개의 아이템만 로딩하고, 필요할 때 다른 데이터를 로딩한다.
        var movie = snapshot.data![index];
        return PopularMovie(
            adult: movie.adult,
            backdropPath: movie.backdropPath,
            genreIds: movie.genreIds,
            id: movie.id,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            popularity: movie.popularity,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            title: movie.title,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
        height: 40,
      ),
    );
  }
}

ListView makeNowList(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    itemBuilder: (context, index) {
      //itemBuilder -> 한번에 10개의 아이템만 로딩하고, 필요할 때 다른 데이터를 로딩한다.
      var movie = snapshot.data![index];
      return NowMovie(
          adult: movie.adult,
          backdropPath: movie.backdropPath,
          genreIds: movie.genreIds,
          id: movie.id,
          originalLanguage: movie.originalLanguage,
          originalTitle: movie.originalTitle,
          overview: movie.overview,
          popularity: movie.popularity,
          posterPath: movie.posterPath,
          releaseDate: movie.releaseDate,
          title: movie.title,
          video: movie.video,
          voteAverage: movie.voteAverage,
          voteCount: movie.voteCount);
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 20,
      height: 40,
    ),
  );
}

ListView makeComingList(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    itemBuilder: (context, index) {
      //itemBuilder -> 한번에 10개의 아이템만 로딩하고, 필요할 때 다른 데이터를 로딩한다.
      var movie = snapshot.data![index];
      return ComingMovie(
          adult: movie.adult,
          backdropPath: movie.backdropPath,
          genreIds: movie.genreIds,
          id: movie.id,
          originalLanguage: movie.originalLanguage,
          originalTitle: movie.originalTitle,
          overview: movie.overview,
          popularity: movie.popularity,
          posterPath: movie.posterPath,
          releaseDate: movie.releaseDate,
          title: movie.title,
          video: movie.video,
          voteAverage: movie.voteAverage,
          voteCount: movie.voteCount);
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 20,
      height: 40,
    ),
  );
}
