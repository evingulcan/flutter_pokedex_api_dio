import 'package:flutter/material.dart';
import 'package:pokedex_proje3/pokemon/product/widgets/app_tittle.dart';
import 'package:pokedex_proje3/pokemon/product/widgets/pokemon_list.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(children: const [
          AppTittle(),
          Expanded(child: PokemonList()),
        ]),
      ),
    );
  }
}
