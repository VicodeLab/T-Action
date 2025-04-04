import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Registrate".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/signup.svg"),
            ),
            const Spacer(),
          ],
        ),
        // ignore: prefer_const_constructors
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
