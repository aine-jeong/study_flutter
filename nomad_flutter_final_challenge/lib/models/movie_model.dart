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
