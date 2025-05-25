
class SuperheroDetails {

  final String id;
  final String name;

  SuperheroDetails({
    required this.id, 
    required this.name
  });

  factory SuperheroDetails.fromJson(Map<String, dynamic> json) {
    return SuperheroDetails(id: json["id"], name: json["name"]);
  }


}








