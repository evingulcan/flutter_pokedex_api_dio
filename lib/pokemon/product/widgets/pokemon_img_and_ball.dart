import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokedex_proje3/pokemon/constant/constants.dart';
import 'package:pokedex_proje3/pokemon/constant/ui_helper.dart';
import 'package:pokedex_proje3/pokemon/feature/model/pokemon_model.dart';

class PokemonImgAndBall extends StatefulWidget {
  final PokemonModel pokemon;

  const PokemonImgAndBall({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonImgAndBall> createState() => _PokemonImgAndBallState();
}

class _PokemonImgAndBallState extends State<PokemonImgAndBall> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.pokemonimage,
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        // CachedNetworkImage kütüphanesini kullanma amacımız internette verileri ilk seferde getiriyor ama ondan sonra cached storey ye ekliyor tekrar tekrar internete cıkmamıza gerek kalmadan ordan bu verileri okuyarak kullanıyor.
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: widget.pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: widget.pokemon.img ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImgAndBallSize(),
              height: UIHelper.calculatePokeImgAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                  color: UIHelper.getColorFromType(widget.pokemon.type![0])),
            ),
          ),
        ),
      ],
    );
  }
}
