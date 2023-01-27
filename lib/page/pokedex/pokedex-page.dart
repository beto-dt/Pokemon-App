import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_dt_app/bloc/pokedex/pokedex-bloc.dart';
import 'package:pokemon_dt_app/model/pokedex-model.dart';
import 'package:pokemon_dt_app/page/pokedex/pokedex-details-page.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final PokedexBloc _pokedexBloc = PokedexBloc();

  @override
  void initState() {
    _pokedexBloc.add(GetPokedexList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('POKEDEX'),
        backgroundColor: Colors.redAccent,
      ),
      body: _buildListPokedex(),
    );
  }

  Widget _buildListPokedex() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _pokedexBloc,
        child: BlocListener<PokedexBloc, PokedexState>(
          listener: (context, state) {
            if (state is PokedexError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<PokedexBloc, PokedexState>(
            builder: (context, state) {
              if (state is PokedexInitial) {
                return _buildLoading();
              } else if (state is PokedexLoading) {
                return _buildLoading();
              } else if (state is PokedexLoaded) {
                return _buildCard(context, state.pokedexModel);
              } else if (state is PokedexError) {
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

  Widget _buildCard(BuildContext context, PokedexModel model) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: .9),
      itemCount: model.results!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: (() => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PokedexDetailsPage()))
                  }),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.all(15),
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Column(children: [
                    Image(
                      image: NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png'),
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("${model.results![index].name}"),
                    ),
                  ]),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
