class PopularMovieListModel {
  final String title, backdrop_path, id;

  PopularMovieListModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdrop_path = json['backdrop_path'],
        id = json['id'];
}
