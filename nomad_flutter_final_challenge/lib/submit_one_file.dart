import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Linux; Android 5.1.1; Android SDK built for x86 Build/LMY48X) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/39.0.0.0 Mobile Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

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

class MovieDetail {
  final int id;
  final String? backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final List<String> genres;
  final int runtime;

  MovieDetail({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.runtime,
  });

  String getFullBackdropPath() {
    return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      genres: List<String>.from(json['genres'].map((genre) => genre['name'])),
      runtime: json['runtime'],
    );
  }
}

// Model Class
class MovieModel {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieModel(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  String getFullPosterPath() {
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String getFullBackdropPath() {
    return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        json['adult'] as bool,
        json['backdrop_path'] as String?,
        (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
        json['id'] as int,
        json['original_language'] as String,
        json['original_title'] as String,
        json['overview'] as String,
        (json['popularity'] as num).toDouble(),
        json['poster_path'] as String,
        json['release_date'] as String,
        json['title'] as String,
        json['video'] as bool,
        (json['vote_average'] as num).toDouble(),
        json['vote_count'] as int,
      );

  Map<String, dynamic> toJson(MovieModel instance) => {
        'adult': instance.adult,
        'backdrop_path': instance.backdropPath,
        'genre_ids': instance.genreIds,
        'id': instance.id,
        'original_language': instance.originalLanguage,
        'original_title': instance.originalTitle,
        'overview': instance.overview,
        'popularity': instance.popularity,
        'poster_path': instance.posterPath,
        'release_date': instance.releaseDate,
        'title': instance.title,
        'video': instance.video,
        'vote_average': instance.voteAverage,
        'vote_count': instance.voteCount,
      };
}

class BelongToCollection {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  BelongToCollection(this.id, this.name, this.posterPath, this.backdropPath);

  factory BelongToCollection.fromJson(Map<String, dynamic> json) =>
      BelongToCollection(
        json['id'] as int,
        json['name'] as String,
        json['poster_path'] as String?,
        json['backdrop_path'] as String?,
      );

  Map<String, dynamic> toJson(BelongToCollection instance) => {
        'id': instance.id,
        'name': instance.name,
        'poster_path': instance.posterPath,
        'backdrop_path': instance.backdropPath,
      };
}

class Genres {
  final int id;
  final String name;

  Genres(this.id, this.name);

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        json['id'] as int,
        json['name'] as String,
      );

  Map<String, dynamic> toJson(Genres instance) => {
        'id': instance.id,
        'name': instance.name,
      };
}

class ProductionCompanies {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompanies(this.id, this.logoPath, this.name, this.originCountry);

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      ProductionCompanies(
        json['id'] as int,
        json['logo_path'] as String?,
        json['name'] as String,
        json['origin_country'] as String,
      );
  Map<String, dynamic> toJson(ProductionCompanies instance) => {
        'id': instance.id,
        'logo_path': instance.logoPath,
        'name': instance.name,
        'origin_country': instance.originCountry,
      };
}

class ProductionCountries {
  final String iso31661;
  final String name;

  ProductionCountries(this.iso31661, this.name);

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      ProductionCountries(
        json['iso_3166_1'] as String,
        json['name'] as String,
      );
  Map<String, dynamic> toJson(ProductionCountries instance) => {
        'iso_3166_1': instance.iso31661,
        'name': instance.name,
      };
}

class SpokenLanguages {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguages(this.englishName, this.iso6391, this.name);

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      SpokenLanguages(
        json['english_name'] as String,
        json['iso_639_1'] as String,
        json['name'] as String,
      );
  Map<String, dynamic> toJson(SpokenLanguages instance) => {
        'english_name': instance.englishName,
        'iso_639_1': instance.iso6391,
        'name': instance.name,
      };
}

class DetailScreen extends StatefulWidget {
  final String title;
  final int id;
  final String backdropPath;

  const DetailScreen({
    super.key,
    required this.title,
    required this.id,
    required this.backdropPath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetail> movie;

  @override
  void initState() {
    //id를 이용하기 위해 StatefulWidget으로 바꿔준 후 initState사용
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  String timeFormat(int runtime) {
    String time;
    int hour = runtime ~/ 60;
    int minute = runtime % 60;
    time = '${hour}h ${minute}min';
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Back to list',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          image: DecorationImage(
            image: NetworkImage(widget.backdropPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'popular${widget.id}',
                      child: Container(
                        width: 250,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(10, 10),
                                color: Colors.black.withOpacity(0.5))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder(
                  future: movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 330,
                            ),
                            Text(
                              snapshot.data!.title,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.grey.withOpacity(0.5),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              // '${timeFormat(snapshot.data!.runtime)} | 장르, 장르, 장르',
                              '${timeFormat(snapshot.data!.runtime)} | ${snapshot.data!.genres.join(', ')}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'StoryLine',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                      child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 8,
                                    strutStyle: const StrutStyle(fontSize: 20),
                                    text: TextSpan(
                                        text: snapshot.data!.overview,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                      );
                    }
                    return const Text("...ㅠ");
                  },
                ),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.yellow.shade800,
                    onPressed: () {},
                    label: const Text(
                      'Buy ticket',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NowDetailScreen extends StatefulWidget {
  final String title;
  final int id;
  final String backdropPath;

  const NowDetailScreen({
    super.key,
    required this.title,
    required this.id,
    required this.backdropPath,
  });

  @override
  State<NowDetailScreen> createState() => _NowDetailScreenState();
}

class _NowDetailScreenState extends State<NowDetailScreen> {
  late Future<MovieDetail> movie;

  @override
  void initState() {
    //id를 이용하기 위해 StatefulWidget으로 바꿔준 후 initState사용
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  String timeFormat(int runtime) {
    String time;
    int hour = runtime ~/ 60;
    int minute = runtime % 60;
    time = '${hour}h ${minute}min';
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Back to list',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          image: DecorationImage(
            image: NetworkImage(widget.backdropPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'now${widget.id}',
                      child: Container(
                        width: 250,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(10, 10),
                                color: Colors.black.withOpacity(0.5))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder(
                  future: movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 330,
                            ),
                            Text(
                              snapshot.data!.title,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.grey.withOpacity(0.5),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              // '${timeFormat(snapshot.data!.runtime)} | 장르, 장르, 장르',
                              '${timeFormat(snapshot.data!.runtime)} | ${snapshot.data!.genres.join(', ')}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'StoryLine',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                      child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 8,
                                    strutStyle: const StrutStyle(fontSize: 20),
                                    text: TextSpan(
                                        text: snapshot.data!.overview,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       color: Colors.yellow.shade800),
                            //   child: const Text(
                            //     'Buy ticket',
                            //     style: TextStyle(
                            //         fontSize: 20, fontWeight: FontWeight.w800),
                            //   ),
                            // )
                          ],
                        ),
                      );
                    }
                    return const Text("...ㅠ");
                  },
                ),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.yellow.shade800,
                    onPressed: () {},
                    label: const Text(
                      'Buy ticket',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ComingDetailScreen extends StatefulWidget {
  final String title;
  final int id;
  final String backdropPath;

  const ComingDetailScreen({
    super.key,
    required this.title,
    required this.id,
    required this.backdropPath,
  });

  @override
  State<ComingDetailScreen> createState() => _ComingDetailScreenState();
}

class _ComingDetailScreenState extends State<ComingDetailScreen> {
  late Future<MovieDetail> movie;

  @override
  void initState() {
    //id를 이용하기 위해 StatefulWidget으로 바꿔준 후 initState사용
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  String timeFormat(int runtime) {
    String time;
    int hour = runtime ~/ 60;
    int minute = runtime % 60;
    time = '${hour}h ${minute}min';
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Back to list',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          image: DecorationImage(
            image: NetworkImage(widget.backdropPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'coming${widget.id}',
                      child: Container(
                        width: 250,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(10, 10),
                                color: Colors.black.withOpacity(0.5))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder(
                  future: movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 330,
                            ),
                            Text(
                              snapshot.data!.title,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade800,
                                )),
                                (Icon(
                                  Icons.star,
                                  color: Colors.grey.withOpacity(0.5),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              // '${timeFormat(snapshot.data!.runtime)} | 장르, 장르, 장르',
                              '${timeFormat(snapshot.data!.runtime)} | ${snapshot.data!.genres.join(', ')}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'StoryLine',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                      child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 8,
                                    strutStyle: const StrutStyle(fontSize: 20),
                                    text: TextSpan(
                                        text: snapshot.data!.overview,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       color: Colors.yellow.shade800),
                            //   child: const Text(
                            //     'Buy ticket',
                            //     style: TextStyle(
                            //         fontSize: 20, fontWeight: FontWeight.w800),
                            //   ),
                            // )
                          ],
                        ),
                      );
                    }
                    return const Text("...ㅠ");
                  },
                ),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.yellow.shade800,
                    onPressed: () {},
                    label: const Text(
                      'Buy ticket',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopularMovie extends StatelessWidget {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  static const String imgUrl = 'https://image.tmdb.org/t/p/w500';

  const PopularMovie({
    super.key,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              id: id,
              backdropPath: '$imgUrl$posterPath',
            ),
            fullscreenDialog: true, // 페이지 띄우는 것 같은 효과 주기
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: 'popular$id',
            child: Container(
              width: 350,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Image.network('$imgUrl$backdropPath'),
            ),
          ),
        ],
      ),
    );
  }
}

class NowMovie extends StatelessWidget {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  static const String imgUrl = 'https://image.tmdb.org/t/p/w500';

  const NowMovie(
      {super.key,
      required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NowDetailScreen(
              title: title,
              id: id,
              backdropPath: '$imgUrl$posterPath',
            ),
            fullscreenDialog: true, // 페이지 띄우는 것 같은 효과 주기
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: 'now$id',
            child: Container(
              width: 180,
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Image.network('$imgUrl$backdropPath', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class ComingMovie extends StatelessWidget {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  static const String imgUrl = 'https://image.tmdb.org/t/p/w500';

  const ComingMovie(
      {super.key,
      required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComingDetailScreen(
              title: title,
              id: id,
              backdropPath: '$imgUrl$posterPath',
            ),
            fullscreenDialog: true, // 페이지 띄우는 것 같은 효과 주기
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 180,
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Image.network('$imgUrl$backdropPath', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  static const String today = "today";

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static const String imgUrl = 'https://image.tmdb.org/t/p/w500/';

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final allMovies = jsonDecode(response.body);
      final movies = allMovies['results'];
      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final allMovies = jsonDecode(response.body);
      final movies = allMovies['results'];
      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final allMovies = jsonDecode(response.body);
      final movies = allMovies['results'];
      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetail> getMovieById(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetail.fromJson(movie);
    }
    throw Error();
  }
}
