import 'package:game_ticket/src/game/views/game_detail_screen.dart';
import 'package:game_ticket/src/game/views/select_game_screen.dart';
import 'package:game_ticket/src/main/main_screen.dart';
import 'package:game_ticket/src/player/select_player_screen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: MainScreen.routeName,
    page: () => const MainScreen(),
  ),
  GetPage(
    name: SelectGameScreen.routeName,
    page: () => const SelectGameScreen(),
  ),
  GetPage(
    name: AddPlayerScreen.routeName,
    page: () => const AddPlayerScreen(),
  ),
  GetPage(
    name: GameDetailScreen.routeName,
    page: () => const GameDetailScreen(),
  ),
  // GetPage(
  //   name: GameInfoScreen.routeName,
  //   page: () => const GameInfoScreen(),
  // ),
];
