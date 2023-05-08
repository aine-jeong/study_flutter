import 'package:flutter/material.dart';
import 'package:nomad_flutter_final_challenge/screens/detail_screen_now.dart';

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
