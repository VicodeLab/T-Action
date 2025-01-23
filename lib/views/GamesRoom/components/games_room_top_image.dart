import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/constants.dart';

class GamesRoomTopImage extends StatelessWidget {
  const GamesRoomTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        Text(
          "¡vamos a jugar!".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Row(
          children: [
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/GamesRoom.svg"),
            ),
          ],
        ),
        // ignore: prefer_const_constructors
      ],
    );
  }
}
