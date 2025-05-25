
class SuperheroDetails {

  final String id;
  final String name;
  final String url;

  SuperheroDetails({
    required this.id, 
    required this.name,
    required this.url,
  });

  factory SuperheroDetails.fromJson(Map<String, dynamic> json) {
    return SuperheroDetails(
      id: json["id"], 
      name: json["name"],
      url: json["image"]["url"],
    );
  }


}








