import 'package:game_ticket/src/ticket/create_ticket_screen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: CreateTicketScreen.routeName,
    page: () => const CreateTicketScreen(),
  ),
];
