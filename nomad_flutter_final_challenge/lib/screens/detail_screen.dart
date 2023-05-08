import 'package:flutter/material.dart';
import 'package:nomad_flutter_final_challenge/models/movie_detail_model.dart';
import 'package:nomad_flutter_final_challenge/services/api_service.dart';

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
