import 'package:flutter/material.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/model/superhero_details.dart';
import 'package:superhero_app/model/superhero_response.dart';

class SuperheroSearch extends StatefulWidget {
  const SuperheroSearch({super.key});

  @override
  State<SuperheroSearch> createState() => _SuperheroSearchState();
}

class _SuperheroSearchState extends State<SuperheroSearch> {

  Future<SuperheroResponse?>? _superheroInfoRes;
  Repository resRepository = Repository();
  bool _isTextEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Superhero Search"),
      ),

      body: Column(
        children: [

          //------- Input para buscar el nombre de los herores -------
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Busca un superheroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              
              // ------- Buscamos a los herores -------
              onChanged: (text) {
                setState(() {
                  _isTextEmpty = text.isEmpty;
                  _superheroInfoRes = resRepository.fetchSuperHeroInfo(text);
                });
              },
            ),
          ),

          //------- Body de la Lista de heroes -------
          bodyList(_isTextEmpty),


        ],
      ),
    );
  }

  //------- Funcion body de la Lista de heroes -------
  FutureBuilder<SuperheroResponse?> bodyList(bool valIsEmpty) {
    return FutureBuilder(
          future: _superheroInfoRes, 
          builder: (context, snapshot) {

            if(_isTextEmpty) return const Center(child: Text('Ingresa un nombre'));

            if(snapshot.connectionState == ConnectionState.waiting) {
              return const  CircularProgressIndicator();
            } else if(snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if(snapshot.hasData) {
                var superheroList = snapshot.data?.result;
              
                return Expanded(
                  child: ListView.builder(
                    itemCount: superheroList?.length ?? 0,
                    itemBuilder: (context, index) {
                      if(superheroList != null) {

                        // ------- Lista de herores -------
                        return itemListSuperHero(superheroList[index]);
                      } else {
                        return const Text('Error');
                      }
                    },
                  
                  ),
                );
            } else {
              return const Text('No hay resultados');
            }

          },
        );
  }
  
  // ------- Funcion lista de herores -------
  Padding itemListSuperHero(SuperheroDetails itemList) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),

    child: Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF515163)
      ),
      
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),

            child: Image.network(

              itemList.url,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                  
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              itemList.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    ),
  );
} 



