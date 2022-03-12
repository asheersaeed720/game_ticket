import 'package:game_ticket/src/game_detail_screen.dart';
import 'package:game_ticket/src/player/player_screen.dart';
import 'package:game_ticket/src/ticket/create_ticket_screen.dart';
import 'package:game_ticket/src/ticket/select_game_screen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: CreateTicketScreen.routeName,
    page: () => const CreateTicketScreen(),
  ),
  GetPage(
    name: PlayerScreen.routeName,
    page: () => PlayerScreen(),
  ),
  GetPage(
    name: SelectGameScreen.routeName,
    page: () => const SelectGameScreen(),
  ),
  GetPage(
    name: GameDetailScreen.routeName,
    page: () => const GameDetailScreen(),
  ),
];
