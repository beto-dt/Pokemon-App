import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_dt_app/bloc/pokedex/pokedex-bloc.dart';
import 'package:pokemon_dt_app/model/pokedex-model.dart';

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
      appBar: AppBar(title: const Text('POKEDEX')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
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
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: model.results!.length,
      itemBuilder: (context, index) {
        return Card(
          child: GridTile(
            child: Column(children: [
              Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png'),
              Text("${model.results![index].name}")
            ]),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
