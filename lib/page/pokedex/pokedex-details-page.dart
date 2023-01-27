import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_dt_app/bloc/pokedex-detail/pokedex-detail-bloc.dart';
import 'package:pokemon_dt_app/model/pokedex-detail-model.dart';

class PokedexDetailsPage extends StatefulWidget {
  final heroTag;
  PokedexDetailsPage({Key? key, this.heroTag}) : super(key: key);

  @override
  State<PokedexDetailsPage> createState() => _PokedexDetailsPageState();
}

class _PokedexDetailsPageState extends State<PokedexDetailsPage> {
  final PokedexDetailBloc _pokedexDetailBloc = PokedexDetailBloc();

  @override
  void initState() {
    _pokedexDetailBloc.add(GetPokedexDetailList(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text('POKEDEX'),
          backgroundColor: Colors.redAccent,
        ),
        body: _buildListPokedex());
  }

  Widget _buildListPokedex() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _pokedexDetailBloc,
        child: BlocListener<PokedexDetailBloc, PokedexDetailState>(
          listener: (context, state) {
            if (state is PokedexDetailError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<PokedexDetailBloc, PokedexDetailState>(
            builder: (context, state) {
              if (state is PokedexDetailInitial) {
                return _buildLoading();
              } else if (state is PokedexDetailLoading) {
                return _buildLoading();
              } else if (state is PokedexDetailLoaded) {
                return Stack(alignment: Alignment.center, children: [
                  Positioned(
                      top: 70,
                      left: 5,
                      child: Text("${state.pokemonDetailModel.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30))),
                  Positioned(
                      top: 140,
                      left: 20,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                          child: Text(
                              "${state.pokemonDetailModel.types![0].type!.name}",
                              style: TextStyle(color: Colors.white)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.black26,
                        ),
                      )),
                  Positioned(
                      top: height * 0.18,
                      right: -30,
                      child: Image.asset(
                        'assets/images/pokeball.png',
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: width,
                        height: height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 50),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: width * 0.3,
                                            child: Text(
                                              'Name',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18),
                                            )),
                                        Container(
                                          width: width * 0.3,
                                          child: Text(
                                            "${state.pokemonDetailModel.name}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: width * 0.3,
                                            child: Text(
                                              'Height',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18),
                                            )),
                                        Container(
                                          width: width * 0.3,
                                          child: Text(
                                            "${state.pokemonDetailModel.height} m",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: width * 0.3,
                                            child: Text(
                                              'Weight',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18),
                                            )),
                                        Container(
                                          width: width * 0.3,
                                          child: Text(
                                            "${state.pokemonDetailModel.weight} kg",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                )
                              ]),
                        ),
                      )),
                  Positioned(
                    top: (height * 0.10),
                    left: (width / 2) - 100,
                    child: Image(
                      image: NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'),
                      fit: BoxFit.fitHeight,
                      height: 400,
                    ),
                  )
                ]);
              } else if (state is PokedexDetailError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, PokemonDetailModel model) {
    return Card();
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
