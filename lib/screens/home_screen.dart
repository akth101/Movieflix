import 'package:flutter/material.dart';
import 'package:movieflix/api_service.dart';
import 'package:movieflix/models/popular_movie_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopularMovieListModel>> populars =
      ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    print(populars);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Popular Movies',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          FutureBuilder(
              future: populars,
              builder: (context, futureResult) {
                print('hello ${futureResult.hasData}');
                if (futureResult.hasData) {
                  print('hello');
                  return const Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      // Expanded(child: makeList(futureResult)),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}


//   ListView makeList(AsyncSnapshot<List<PopularMovieListModel>> futureResult) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: futureResult.data!.length,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       itemBuilder: (context, index) {
//         var popular = futureResult.data![index];
//         return Webtoon(
//             title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
//       },
//       separatorBuilder: (context, index) => const SizedBox(width: 40),
//     );
//   }
// }