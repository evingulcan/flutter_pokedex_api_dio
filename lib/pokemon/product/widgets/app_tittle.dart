import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_proje3/pokemon/constant/constants.dart';
import 'package:pokedex_proje3/pokemon/constant/ui_helper.dart';

class AppTittle extends StatefulWidget {
  const AppTittle({Key? key}) : super(key: key);

  @override
  State<AppTittle> createState() => _AppTittleState();
}

class _AppTittleState extends State<AppTittle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTittleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            //genişliye göre bu degeri oranla
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Constants.tittle, style: Constants.getTitleTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              Constants.pokemonimage,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
