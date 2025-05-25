import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:superhero_app/model/superhero_response.dart';

const String valueAPI = "https://superheroapi.com/api/";
const String accessToken = "7a960860a8e333549139f1c812d8e1b3";


class Repository {

  Future<SuperheroResponse?> fetchSuperHeroInfo(String name) async {
    final response = await http.get(Uri.parse(
      '$valueAPI$accessToken/search/$name'
    ));

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      SuperheroResponse superheroRes = SuperheroResponse.fromJson(data);
      return superheroRes;
    } else {
      return null;
    }
  }

}


