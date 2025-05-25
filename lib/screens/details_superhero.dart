import 'package:flutter/material.dart';
import 'package:superhero_app/model/superhero_details.dart';

class DetailsSuperhero extends StatelessWidget {

  final SuperheroDetails superheroDetails;

  const DetailsSuperhero({
    super.key, 
    required this.superheroDetails
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Superheroe ${superheroDetails.name}"),
      ),
      body: Column(
        children: [

          Image.network(
            superheroDetails.url,
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Text(
            superheroDetails.name,
            style: const TextStyle(
              fontSize: 35
            ),
          ),
          Text(
            superheroDetails.realname,
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic
            ),
          ),
          
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  // Estadistica de los poderes:
                  // intelligence:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(superheroDetails.powerResponse.intelligence),
                        width: 20,
                        color: Colors.amberAccent,
                      ),
                      const Text('Intelligence'),
                    ],
                  ),

                  // strength:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(superheroDetails.powerResponse.strength),
                        width: 20,
                        color: Colors.amberAccent,
                      ),
                      const Text('Strength'),
                    ],
                  ),

                  // speed:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(superheroDetails.powerResponse.speed),
                        width: 20,
                        color: Colors.amberAccent,
                      ),
                      const Text('Speed'),
                    ],
                  ),

                  // durability:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(superheroDetails.powerResponse.durability),
                        width: 20,
                        color: Colors.amberAccent,
                      ),
                      const Text('Durability'),
                    ],
                  ),

                  // power:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(superheroDetails.powerResponse.power),
                        width: 20,
                        color: Colors.amberAccent,
                      ),
                      const Text('Power'),
                    ],
                  ),

                  // combat:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(superheroDetails.powerResponse.combat),
                        width: 20,
                        color: Colors.amberAccent,
                      ),
                      const Text('Combat'),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

