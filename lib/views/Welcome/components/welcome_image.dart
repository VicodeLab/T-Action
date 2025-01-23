import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "BIENVENIDOS A T-ACTION",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Row(
          children: [
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                "assets/icons/Bienvenidos.svg",
              ),
            ),
          ],
        ),
      ],
    );
  }
}