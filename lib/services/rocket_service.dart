import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rockets/models/crew_member.dart';
import 'package:rockets/models/rocket.dart';
import 'package:http/http.dart' as http;

class RocketService {
  final String apiUrl;

  RocketService({@required this.apiUrl});

  Future<List<CrewMember>> getCrewMembers() async {
    final url = '$apiUrl/crew';
    final response = await http.get(url); // Fetch data from API

    // Verify that the data is good
    if (response.statusCode != 200) {
      throw HttpException('${response.statusCode}: ${response.reasonPhrase}',
          uri: Uri.tryParse(url));
    }

    // Convert the body to json with the default dart json-decoder.
    // We know that the endpoint returns a list, so we can cast it directly
    // to a dynamic List<dynamic> (read list of json objects)
    final jsonData = jsonDecode(response.body) as List;

    // Convert json data to a CrewMember
    return jsonData.map((jsonObject) => CrewMember.fromJson(jsonObject)).toList();

  }

  Future<List<Rocket>> getRockets() async {
    final url = '$apiUrl/rockets';
    final response = await http.get(url); // Fetch data from API

    // Verify that the data is good
    if (response.statusCode != 200) {
      throw HttpException('${response.statusCode}: ${response.reasonPhrase}',
          uri: Uri.tryParse(url));
    }

    // Get json data from the response (currently a string)
    final body = response.body;

    // Convert the body to json with the default dart json-decoder.
    // We know that the endpoint returns a list, so we can cast it directly
    // to a dynamic List<dynamic> (read list of json objects)
    final jsonData = jsonDecode(body) as List;

    // Convert json data to a Rocket
    final rockets =
        jsonData.map((jsonObject) => Rocket.fromJson(jsonObject)).toList();

    return rockets;
  }

  List<Rocket> getRocketsMock() {
    return [
      Rocket(
        id: '5e9d0d95eda69973a809d1ec',
        name: 'Falcon 1',
        description: 'The Falcon 1 was an expendable launch system privately '
            'developed and manufactured by SpaceX during 2006-2009. '
            'On 28 September 2008, Falcon 1 became the first '
            'privately-developed liquid-fuel launch vehicle to go into orbit '
            'around the Earth.',
        active: false,
        boosters: 0,
        flickrImages: [
          'https://imgur.com/DaCfMsj.jpg',
          'https://imgur.com/azYafd8.jpg',
        ],
        height: 75.0,
        diameter: 18.0,
        firstFlight: DateTime.parse('2018-06-04'),
        mass: 567890,
        wikipedia: "https://en.wikipedia.org/wiki/Falcon_9",
      ),
      Rocket(
        id: '5e9d0d95eda69974db09d1ed',
        name: 'Falcon Heavy',
        description: 'With the ability to lift into orbit over 54 metric tons '
            '(119,000 lb)--a mass equivalent to a 737 jetliner loaded with '
            'passengers, crew, luggage and fuel--Falcon Heavy can lift more '
            'than twice the payload of the next closest operational vehicle, '
            'the Delta IV Heavy, at one-third the cost.',
        active: true,
        boosters: 2,
        flickrImages: [
          'https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg',
          'https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg',
          'https://farm5.staticflickr.com/4696/40126460511_b15bf84c85_b.jpg',
          'https://farm5.staticflickr.com/4711/40126461411_aabc643fd8_b.jpg',
        ],
        height: 25.0,
        diameter: 12.0,
        firstFlight: DateTime.parse('2029-06-04'),
        mass: 5678,
        wikipedia: "https://en.wikipedia.org/wiki/Falcon_9",
      ),
    ];
  }
}
