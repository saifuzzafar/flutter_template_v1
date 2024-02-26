class MovieListModel {
  int? id;
  int? page;
  List<MovieLisResultsModel>? movieResults;
  int? totalPages;

  MovieListModel({this.id, this.page, this.movieResults, this.totalPages});
}

class MovieLisResultsModel {
  String? description;
  String? listType;
  String? name;

  MovieLisResultsModel({
    this.description,
    this.listType,
    this.name,
  });
}
