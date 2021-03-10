class Rocket {
  const Rocket({
    required this.id,
    required this.name,
    required this.description,
    required this.active,
    required this.boosters,
    required this.flickrImages,
    required this.firstFlight,
    required this.height,
    required this.diameter,
    required this.mass,
    required this.wikipedia,
  });

  final String? id;
  final String? name;
  final String? description;
  final bool? active;
  final int? boosters;
  final List<String> flickrImages;
  final DateTime firstFlight;
  final double height;
  final double diameter;
  final double mass;
  final String? wikipedia;

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      active: json['active'],
      boosters: json['boosters'],
      flickrImages: List<String>.from(json['flickr_images']),
      firstFlight: DateTime.parse(json['first_flight']),
      height: (json['height']['meters'] as num).toDouble(),
      diameter: (json['diameter']['meters'] as num).toDouble(),
      mass: (json['mass']['kg'] as num).toDouble(),
      wikipedia: json['wikipedia'],
    );
  }

  Map<String, dynamic> get toJson {
    return {
      'id': id,
      'name': name,
      'description': description,
      'active': active,
      'boosters': boosters,
      'flickrImages': flickrImages,
      'firstFlight': firstFlight,
      'height': height,
      'diameter': diameter,
      'mass': mass,
      'wikipedia': wikipedia,
    };
  }

  List<String> get localImages {
    return flickrImages.asMap().entries.map((entry) {
      int index = entry.key;
      index += 1;
      return 'assets/rockets/$id/img-$index.jpg';
    }).toList();
  }
}
