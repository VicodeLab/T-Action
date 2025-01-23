import 'package:flutter/material.dart';
import 'package:t_action/components/constants.dart';
import 'package:t_action/components/responsive.dart';
import 'package:t_action/controllers/auth_controller.dart';
import 'package:t_action/views/GamesRoom/components/games_options.dart';
import 'package:t_action/views/GamesRoom/components/games_room_top_image.dart';

import '../../components/background.dart';

class GamesRoom extends StatelessWidget {
  const GamesRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.exit_to_app_rounded,
            color: Color(0xFF3a3737),
          ),
          onPressed: () {
            AuthController().signOut(context);
          },
        ),
      ),
      child: const SingleChildScrollView(
        child: Responsive(
          mobile: MobileGamesRoomScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: GamesRoomTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: GamesOptions(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileGamesRoomScreen extends StatelessWidget {
  const MobileGamesRoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GamesRoomTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: GamesOptions(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
