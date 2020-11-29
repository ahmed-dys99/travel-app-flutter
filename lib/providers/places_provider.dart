import 'package:flutter/material.dart';

class Place {
  final String id;
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final bool isFav;
  final String description;

  Place({this.id, this.name, this.location, this.rating, this.imageUrl, this.description, this.isFav = false});
}

class Places with ChangeNotifier {
  List<Place> _items = [
    Place(
      id: DateTime.now().toString(),
      name: 'Deosai plains',
      location: 'Paksitan',
      rating: 3.8,
      imageUrl: 'https://i.dawn.com/large/2015/12/567d1d53cdb17.jpg',
      description:
          'The Deosai National Park is a high-altitude alpine plain (plateau) and national park in the Northern Pakistan region of Gilgit Baltistan. Deosai Plains are situated at an average elevation of 4,114 metres (13,497 ft) above sea level and considered as the second highest plateaus in the world.',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'Siri Paye',
      location: 'Pakistan',
      rating: 3.8,
      imageUrl: 'https://i.dawn.com/large/2015/12/567d1ddd54b98.jpg',
      description:
          'Siri Paye is a high mountain lake at an elevation of 3.058m (10,032ft) above the sea level, located in the Khyber-Pakhtunkhwa province of Pakistan. A crystal fresh water lake is situated right in the center of the meadow.',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'Naltar Valley',
      location: 'Pakistan',
      rating: 4.3,
      imageUrl: 'https://i.dawn.com/large/2015/12/567d1a1cc9595.jpg',
      description:
          'Naltar (Urdu:وادی نلتر)is a valley near Gilgit,[Gilgit Baltistan] in the Gilgit–Baltistan region of Pakistan. Naltar is about 34 kilometres (21 mi) from Gilgit and can be reached by jeeps. Naltar is a forested region known for its dramatic mountain scenery. ... Tourists can reach Naltar valley using 4×4 vehicles.',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'Bhawalpur',
      location: 'Pakistan',
      rating: 4.7,
      imageUrl: 'https://i.dawn.com/large/2015/12/567e9cce4fbaf.jpg',
      description:
          'Bahawalpur (بہاولپور), is a city located in the Punjab province of Pakistan. ... The Nawabs left a rich architectural legacy, and Bahawalpur is now known for its monuments dating from that period. The city also lies at the edge of the Cholistan Desert, and serves as the gateway to the nearby Lal Suhanra National Park.',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'Shangrilla Resort',
      location: 'Pakistan',
      rating: 4.7,
      imageUrl: 'https://i.dawn.com/large/2015/12/567d1ca45aabe.jpg',
      description:
          'Shangrila Resort Hotel was founded by the late Muhammad Aslam Khan Afridi, the first commander of the Northern Scouts of the Pakistan Army. The resort is known for its restaurant that is built on the fuselage of an aircraft that had crashed nearby. ',
    ),
  ];

  List<Place> get items {
    return [..._items];
  }

  Place place(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
