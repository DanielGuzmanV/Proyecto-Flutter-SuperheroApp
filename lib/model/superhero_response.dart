
import 'package:superhero_app/model/superhero_details.dart';

class SuperheroResponse {

  final String response;
  final List<SuperheroDetails> result;

  SuperheroResponse({
    required this.response,
    required this.result
  });

  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {

    var list = json["results"] as List;
    List<SuperheroDetails> heroList = list.map( (valueHero) => SuperheroDetails.fromJson(valueHero)).toList();

    return SuperheroResponse(response: json["response"], result: heroList);
  }

}


