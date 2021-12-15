class Tvshow{
  int? id;
  String? backdrop_path, poster_path, first_air_date, name, overview;

  Tvshow({ this.id, this.backdrop_path, this.poster_path, this.first_air_date, this.name, this.overview });

  Tvshow.fromJson(Map<String, dynamic> json) : this.id = json['id'],
                                                this.backdrop_path = json['backdrop_path'],
                                                this.poster_path = json['poster_path'],
                                                this.first_air_date = json['first_air_date'],
                                                this.name = json['name'],
                                                this.overview = json['overview'];
}