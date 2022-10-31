import 'dart:convert';

class Title {
  String? id;
  String? title;
  String? type;
  String? description;
  int? releaseYear;
  String? ageCertification;
  int? runtime;
  String? genres;
  String? productionCountries;
  int? seasons;
  Null? imdbId;
  Null? imdbScore;
  Null? imdbVotes;
  double? tmdbPopularity;
  Null? tmdbScore;

  Title(
      {this.id,
      this.title,
      this.type,
      this.description,
      this.releaseYear,
      this.ageCertification,
      this.runtime,
      this.genres,
      this.productionCountries,
      this.seasons,
      this.imdbId,
      this.imdbScore,
      this.imdbVotes,
      this.tmdbPopularity,
      this.tmdbScore});

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  Title.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    releaseYear = json['release_year'];
    ageCertification = json['age_certification'];
    runtime = json['runtime'];
    genres = json['genres'];
    productionCountries = json['production_countries'];
    seasons = json['seasons'];
    imdbId = json['imdb_id'];
    imdbScore = json['imdb_score'];
    imdbVotes = json['imdb_votes'];
    tmdbPopularity = json['tmdb_popularity'];
    tmdbScore = json['tmdb_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['release_year'] = releaseYear;
    data['age_certification'] = ageCertification;
    data['runtime'] = runtime;
    data['genres'] = genres;
    data['production_countries'] = productionCountries;
    data['seasons'] = seasons;
    data['imdb_id'] = imdbId;
    data['imdb_score'] = imdbScore;
    data['imdb_votes'] = imdbVotes;
    data['tmdb_popularity'] = tmdbPopularity;
    data['tmdb_score'] = tmdbScore;
    return data;
  }
}
