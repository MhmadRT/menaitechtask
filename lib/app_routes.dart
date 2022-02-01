import 'package:get/get_navigation/src/routes/get_route.dart';

import 'view/screens/player_screen.dart';
import 'view/screens/players_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.PLAYERS,
      page: () => const PlayersScreen(),
    ),
    GetPage(
      name: AppLinks.PLAYER,
      page: () => PlayerScreen(),
    ),
  ];
}

class AppLinks {
  static const String PLAYERS = "/players";
  static const String PLAYER = "/player";
}
