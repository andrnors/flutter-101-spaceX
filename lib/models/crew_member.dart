class CrewMember {
  final String? name;
  final String? agency;
  final String? image;
  final String? wikipedia;
  final List<String> launches;
  final String? status;
  final String? id;

  CrewMember(
      {required this.name,
      required this.agency,
      required this.image,
      required this.wikipedia,
      required this.launches,
      required this.status,
      required this.id});

  factory CrewMember.fromJson(Map<String, dynamic> json) {
    return CrewMember(
        name: json['name'],
        agency: json['agency'],
        image: json['image'],
        wikipedia: json['wikipedia'],
        launches: List<String>.from(json['launches']),
        status: json['status'],
        id: json['id']);
  }

  String? get localImage {
    return 'assets/crew/$id.jpeg';
  }
}
