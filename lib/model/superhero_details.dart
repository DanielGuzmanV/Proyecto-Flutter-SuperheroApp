// ------- Detalles del SuperHeroe -------
class SuperheroDetails {

  final String id;
  final String name;
  final String url;
  final String realname;
  final PowerStatsResponse powerResponse;

  SuperheroDetails({
    required this.id, 
    required this.name,
    required this.url,
    required this.realname,
    required this.powerResponse,
  });

  factory SuperheroDetails.fromJson(Map<String, dynamic> json) {
    return SuperheroDetails(
      id: json["id"], 
      name: json["name"],
      url: json["image"]["url"],
      realname: json["biography"]["full-name"],
      powerResponse: PowerStatsResponse.fromJson(json["powerstats"])
    );
  }

}


// ------- Estadisticas del superheroe ------
class PowerStatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  PowerStatsResponse({
    required this.intelligence, 
    required this.strength, 
    required this.speed, 
    required this.durability, 
    required this.power, 
    required this.combat
  });

  factory PowerStatsResponse.fromJson (Map<String, dynamic> json) {
    return PowerStatsResponse(
      intelligence: json["intelligence"], 
      strength: json["strength"], 
      speed: json["speed"], 
      durability: json["durability"], 
      power: json["power"], 
      combat: json["combat"],
    );
  }

}







