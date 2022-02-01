import 'dart:convert';

Player playerFromMap(String str) => Player.fromMap(json.decode(str));

String playerToMap(Player data) => json.encode(data.toMap());

class Player {
  Player({
    required this.id,
    required this.firstName,
    this.heightFeet,
    this.heightInches,
    required this.lastName,
    required this.position,
    required this.team,
    this.weightPounds,
  });

  final int id;
  final String firstName;
  final dynamic heightFeet;
  final dynamic heightInches;
  final String lastName;
  final String position;
  final Team team;
  final dynamic weightPounds;

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["first_name"],
        heightFeet: json["height_feet"],
        heightInches: json["height_inches"],
        lastName: json["last_name"],
        position: json["position"],
        team: Team.fromMap(json["team"]),
        weightPounds: json["weight_pounds"],
      );

  String imageUrl() {
    return "https://cdn2.thecatapi.com/images/$id.jpg";
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "height_feet": heightFeet,
        "height_inches": heightInches,
        "last_name": lastName,
        "position": position,
        "team": team.toMap(),
        "weight_pounds": weightPounds,
      };
}

class Team {
  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: json["conference"],
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conference,
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}
