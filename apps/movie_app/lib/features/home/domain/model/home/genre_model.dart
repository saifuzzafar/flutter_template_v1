class GenreListModel {
  List<GenreListResultModel> genres;

  GenreListModel({required this.genres});
}

class GenreListResultModel {
  int? id;
  String? name;

  GenreListResultModel({this.id, this.name});
}
