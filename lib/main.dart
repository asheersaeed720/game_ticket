import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_ticket/src/game_detail_screen.dart';
import 'package:game_ticket/src/main_binding.dart';
import 'package:game_ticket/utils/app_theme.dart';
import 'package:game_ticket/utils/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Game Ticket',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        // darkTheme: darkThemeData,
        initialBinding: MainBinding(),
        initialRoute: GameDetailScreen.routeName,
        getPages: routes,
      );
}
