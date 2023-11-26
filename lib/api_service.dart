import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/popular_movie_list.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = "popular";

  //홈스크린의 popular movies 값을 요청
  static Future<List<PopularMovieListModel>> getPopularMovies() async {
    List<PopularMovieListModel> popularInstances = [];
    final url = Uri.parse('$baseUrl/$popular');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> populars = jsonDecode(response.body);
      for (var popular in populars) {
        popularInstances.add(PopularMovieListModel.fromJson(popular));
      }
      print("popularInstances");
      print(popularInstances);
      return popularInstances;
    }
    throw Error();
  }
}


// release_date: string
// title: string
// video: false 
// vote average: double
// vote_count: int 
