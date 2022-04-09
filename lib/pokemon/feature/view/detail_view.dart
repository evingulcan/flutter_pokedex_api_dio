import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_proje3/pokemon/constant/constants.dart';
import 'package:pokedex_proje3/pokemon/constant/ui_helper.dart';
import 'package:pokedex_proje3/pokemon/feature/model/pokemon_model.dart';
import 'package:pokedex_proje3/pokemon/feature/view/pokedex_view.dart';

import '../../product/widgets/pokemon_information.dart';
import '../../product/widgets/pokemon_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscapeBody(context);
  }

  Scaffold _buildLandscapeBody(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokemonTypeNameDetail(pokemon: pokemon),
                        Expanded(
                          child: Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              height: 0.4.sh,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UIHelper.getDefaultPadding(),
                        child: PokemonInformation(pokemon: pokemon),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PokemonPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                //r'nin anlamı : genişlikte ve yükseklikte hangisi daha küçükse onu kullan diyoruz.
                //iconSize: 36.r,
                iconSize: 18.w,
              ),
            ),
            PokemonTypeNameDetail(
              pokemon: pokemon,
            ),
            SizedBox(height: 20.h),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    Constants.pokemonimage,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                  right: MediaQuery.of(context).size.width * 0,
                  top: MediaQuery.of(context).size.height * 0,
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0,
                  left: MediaQuery.of(context).size.width * 0,
                  bottom: MediaQuery.of(context).size.width * 0,
                  top: 0.12.sh,
                  child: PokemonInformation(pokemon: pokemon),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
