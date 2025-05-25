import 'package:flutter/material.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/model/superhero_response.dart';

class SuperheroSearch extends StatefulWidget {
  const SuperheroSearch({super.key});

  @override
  State<SuperheroSearch> createState() => _SuperheroSearchState();
}

class _SuperheroSearchState extends State<SuperheroSearch> {

  Future<SuperheroResponse?>? _superheroInfoRes;
  Repository resRepository = Repository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Superhero Search"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Busca un superheroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),

              onChanged: (text) {
                setState(() {
                  _superheroInfoRes = resRepository.fetchSuperHeroInfo(text);
                });
              },
            ),
          ),

          FutureBuilder(
            future: _superheroInfoRes, 
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const  CircularProgressIndicator();
              } else if(snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if(snapshot.hasData) {
                return Text('${snapshot.data?.response}');
              } else {
                return const Text('No hay resultados');
              }
            },
          ),


        ],
      ),
    );
  }
}



