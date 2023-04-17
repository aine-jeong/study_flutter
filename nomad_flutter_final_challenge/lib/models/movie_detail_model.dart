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
