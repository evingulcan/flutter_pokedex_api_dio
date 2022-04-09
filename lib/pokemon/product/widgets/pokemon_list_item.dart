import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_proje3/pokemon/constant/constants.dart';
import 'package:pokedex_proje3/pokemon/constant/ui_helper.dart';

import 'package:pokedex_proje3/pokemon/feature/model/pokemon_model.dart';
import 'package:pokedex_proje3/pokemon/feature/view/detail_view.dart';
import 'package:pokedex_proje3/pokemon/product/widgets/pokemon_img_and_ball.dart';

// ignore: must_be_immutable
class PokemonListItem extends StatefulWidget {
  PokemonModel pokemon;
  PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonListItem> createState() => _PokemonListItemState();
}

class _PokemonListItemState extends State<PokemonListItem> {
  double elevationSize = 3;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: widget.pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: elevationSize,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(widget.pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.pokemon.name ?? 'N/A',
                  style: Constants.getPokemonNameTextStyle,
                ),
                Chip(
                  label: Text(
                    widget.pokemon.type![0],
                  ),
                ),
                Expanded(child: PokemonImgAndBall(pokemon: widget.pokemon)),
              ]),
        ),
      ),
    );
  }
}
