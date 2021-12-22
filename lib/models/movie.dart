class Movie{
  int? id;
  String? poster_path, title, release_date, overview, backdrop_path;

  Movie({ this.id, this.poster_path, this.title, this.release_date, this.overview, this.backdrop_path});

  Movie.fromJson(Map<String, dynamic> json) : this.id = json['id'],
                                              this.poster_path = json['poster_path'],
                                              this.title = json['title'],
                                              this.release_date = json['release_date'],
                                              this.overview = json['overview'],
                                              this.backdrop_path = json['backdrop_path'];
}