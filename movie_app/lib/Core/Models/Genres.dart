import 'package:flutter/material.dart';

class Genres {
  final String id;
  final String name;
  final String image;
  final Color color;
  Genres({
    required this.color,
    required this.image,
    required this.id,
    required this.name,
  });
  factory Genres.fromJson(json) {
    return Genres(
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'].toString(),
      color: json['color'],
    );
  }
}

class GenresList {
  final List<Genres> list;
  GenresList({
    required this.list,
  });
  factory GenresList.fromJson(json) {
    return GenresList(
        list: (json as List).map((genre) => Genres.fromJson(genre)).toList());
  }
}

final genreslist = [
  {
    "id": 35,
    "name": "Comedies",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8kOWDBK6XlPUzckuHDo3wwVRFwt.jpg",
    "color": const Color(0xff375304)
  },
  {
    "id": 80,
    "name": "Crime",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6PX0r5TRRU5y0jZ70y1OtbLYmoD.jpg",
    "color": const Color(0xff4004d7)
  },
  {
    "id": 10751,
    "name": "Families",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uwslHj6nEyPX5IbNXhuEeI0PTth.jpg",
    "color": const Color(0xFF03774B)
  },
  {
    "id": 99,
    "name": "Documentaries",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/n0ybibhJtQ5icDqTp8eRytcIHJx.jpg",
    "color": const Color(0xFF6A680B)
  },
  {
    "id": 14,
    "name": "Fantasy",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg",
    "color": const Color(0xff039620)
  },
  {
    "id": 10402,
    "name": "Dramas",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gbmkFWdtihe1VfydTDsieQ6VfGL.jpg",
    "color": const Color(0xffc01111)
  },
  {
    "id": 18,
    "name": "Holidays",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nel144y4dIOdFFid6twN5mAX9Yd.jpg",
    "color": const Color(0xFF7D0396)
  },
  {
    "id": 27,
    "name": "Horror",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7pEn2fCFWa8DIwQnxG6Cq7iaKLv.jpg",
    "color": const Color(0xFF682303)
  },
  {
    "id": 878,
    "name": "Sci-Fi",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/th5UkDLIa7yyma9UYDAWaIgDh6z.jpg",
    "color": const Color(0xff8a08b5)
  },
  {
    "id": 53,
    "name": "Thriller",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
    "color": const Color(0xff0b7f1e)
  }
];
